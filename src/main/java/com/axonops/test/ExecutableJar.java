package com.axonops.test;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.DefaultConsistencyLevel;
import com.datastax.oss.driver.api.core.config.DefaultDriverOption;
import com.datastax.oss.driver.api.core.config.DriverConfigLoader;
import com.datastax.oss.driver.api.core.config.DriverExecutionProfile;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.SimpleStatement;
import com.datastax.oss.driver.shaded.guava.common.base.Throwables;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.InetSocketAddress;

/**
 * Main class for Maven Executable Jar.
 */
public class ExecutableJar {

    private static final Logger logger = LoggerFactory.getLogger(ExecutableJar.class);
    public static final String CQL1 = "SELECT myvalue FROM integrationtests_multidc_rf3.test1 WHERE myid = 3";
    public static final String CQL2 = "INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (99, '99 some text')";
    public static final String CQL3 = "SELECT myvalue FROM integrationtests_multidc_rf3.test1 WHERE myid = 99";
    public static final String CQL4 = "DELETE FROM integrationtests_multidc_rf3.test1 WHERE myid = 99";



    public static void main(String[] args) {
        if (args.length != 5) {
            logger.error("Invalid number of arguments. Expected 5, got {}.", args.length);
            System.err.println("Usage: java ExecutableJar <contactpoint> <localdc> <consistency> <username> <password>");
            System.exit(5);
        }

        String contactPoint = args[0];
        if (!contactPoint.matches("^\\d+\\.\\d+\\.\\d+\\.\\d+:\\d+$")) {
            System.err.println("Invalid contactPoints format. Please use the format '1.2.3.4:9090'.");
            System.exit(1);
        }
        String localdc = args[1];
        String consistency = args[2];
        String username = args[3];
        String password = args[4];
        logger.info("Connecting to {} in local datacenter {} with consistency {} as user {}",
                contactPoint, localdc, consistency, username);

        CqlSession session = null;

        /**
         * INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (0, '0 some text');
         * INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (1, '1 some text');
         * INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (2, '2 some text');
         * INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (3, '3 some text');
         */
        try {
            session = CqlSession.builder()
                    .addContactPoint(new InetSocketAddress(contactPoint.split(":")[0], Integer.parseInt(contactPoint.split(":")[1])))
                    .withLocalDatacenter(localdc)
                    .withAuthCredentials(username, password)
                    .build();
            logger.info("Connected to cluster: {}", session.getMetadata().getClusterName());

            DriverExecutionProfile defaultProfile = session.getContext().getConfig().getDefaultProfile();
            DriverExecutionProfile dynamicProfile =
                    defaultProfile.withString(
                            DefaultDriverOption.REQUEST_CONSISTENCY, consistency);

            while (true) {
                // Your code to execute goes here

                // For example, you can print a message
                SimpleStatement s1 =
                        SimpleStatement.builder(CQL1)
                                .setExecutionProfile(dynamicProfile)
                                .build();
                ResultSet result1 = session.execute(s1);
                logger.info("{} is {}", CQL1, result1.one().getString("myvalue"));
                sleep(100);

                SimpleStatement s2 =
                        SimpleStatement.builder(CQL2)
                                .setExecutionProfile(dynamicProfile)
                                .build();
                session.execute(s2);
                logger.info("{} inserted", CQL2);
                sleep(100);

                SimpleStatement s3 =
                        SimpleStatement.builder(CQL3)
                                .setExecutionProfile(dynamicProfile)
                                .build();
                ResultSet result3 = session.execute(s3);
                logger.info("{} is {}", CQL3, result3.one().getString("myvalue"));
                sleep(100);

                SimpleStatement s4 =
                        SimpleStatement.builder(CQL4)
                                .setExecutionProfile(dynamicProfile)
                                .build();
                session.execute(s4);
                logger.info("{} deleted", CQL4);
                sleep(100);
            }


        } catch (Exception e) {
            logger.error("Error connecting to cluster: {}", e.getMessage());
            logger.error("Stack Trace: {}", Throwables.getStackTraceAsString(e));
            System.exit(2);
        } finally {
            if (session != null) session.close();
        }
        logger.info("Example log from {}", ExecutableJar.class.getSimpleName());
    }

    private static void sleep(long ms) {
        try {
            // Sleep for 50ms
            Thread.sleep(ms);
        } catch (InterruptedException e) {
            // Handle interrupted exception (if needed)
            e.printStackTrace();
        }
    }
}

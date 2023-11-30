-- noinspection SqlNoDataSourceInspectionForFile

CONSISTENCY ALL;

CREATE ROLE IF NOT EXISTS readonly WITH PASSWORD = 'password' AND LOGIN = true;
CREATE ROLE IF NOT EXISTS readwrite WITH PASSWORD = 'password' AND LOGIN = true;

GRANT SELECT ON ALL KEYSPACES TO readonly;
GRANT SELECT ON ALL KEYSPACES TO readwrite;

CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_allnodes WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '4', 'omega': '4'}  AND durable_writes = true;

CREATE TABLE IF NOT EXISTS integrationtests_multidc_allnodes.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_multidc_allnodes.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_multidc_allnodes.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_multidc_allnodes.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_multidc_allnodes.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_multidc_allnodes.test1 (myid, myvalue) VALUES (4, '4 some text');

CREATE TABLE IF NOT EXISTS integrationtests_multidc_allnodes.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_alpha_allnodes WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '4'}  AND durable_writes = true;

CREATE TABLE IF NOT EXISTS integrationtests_multidc_alpha_allnodes.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_multidc_alpha_allnodes.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_multidc_alpha_allnodes.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_multidc_alpha_allnodes.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_multidc_alpha_allnodes.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_multidc_alpha_allnodes.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_multidc_alpha_allnodes.test1 (myid, myvalue) VALUES (5, '5 some text');

CREATE TABLE IF NOT EXISTS integrationtests_multidc_alpha_allnodes.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);


CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_omega_allnodes WITH replication = {'class': 'NetworkTopologyStrategy', 'omega': '4'}  AND durable_writes = true;

CREATE TABLE IF NOT EXISTS integrationtests_multidc_omega_allnodes.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_multidc_omega_allnodes.test1 (myid, myvalue) VALUES (6, '6 some text');

CREATE TABLE IF NOT EXISTS integrationtests_multidc_omega_allnodes.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_rf3 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '3', 'omega': '3'}  AND durable_writes = true;

GRANT MODIFY ON KEYSPACE integrationtests_multidc_rf3 TO readwrite;

CREATE TABLE IF NOT EXISTS integrationtests_multidc_rf3.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (6, '6 some text');
INSERT INTO integrationtests_multidc_rf3.test1 (myid, myvalue) VALUES (7, '7 some text');


CREATE TABLE IF NOT EXISTS integrationtests_multidc_rf3.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

CREATE KEYSPACE IF NOT EXISTS integrationtests_alpha_rf3 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '3'}  AND durable_writes = true;

GRANT MODIFY ON KEYSPACE integrationtests_alpha_rf3 TO readwrite;

CREATE TABLE IF NOT EXISTS integrationtests_alpha_rf3.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (6, '6 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (7, '7 some text');
INSERT INTO integrationtests_alpha_rf3.test1 (myid, myvalue) VALUES (8, '8 some text');

CREATE TABLE IF NOT EXISTS integrationtests_alpha_rf3.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_rf2 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '2', 'omega': '2'}  AND durable_writes = true;

GRANT MODIFY ON KEYSPACE integrationtests_multidc_rf2 TO readwrite;

CREATE TABLE IF NOT EXISTS integrationtests_multidc_rf2.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (6, '6 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (7, '7 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (8, '8 some text');
INSERT INTO integrationtests_multidc_rf2.test1 (myid, myvalue) VALUES (9, '9 some text');

CREATE TABLE IF NOT EXISTS integrationtests_multidc_rf2.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);


CREATE KEYSPACE IF NOT EXISTS integrationtests_alpha_rf2 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '2'}  AND durable_writes = true;

GRANT MODIFY ON KEYSPACE integrationtests_alpha_rf2 TO readwrite;

CREATE TABLE IF NOT EXISTS integrationtests_alpha_rf2.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (6, '6 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (7, '7 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (8, '8 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (9, '9 some text');
INSERT INTO integrationtests_alpha_rf2.test1 (myid, myvalue) VALUES (10, '10 some text');



CREATE TABLE IF NOT EXISTS integrationtests_alpha_rf2.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_rf1 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '1', 'omega': '1'}  AND durable_writes = true;

GRANT MODIFY ON KEYSPACE integrationtests_multidc_rf1 TO readwrite;

CREATE TABLE IF NOT EXISTS integrationtests_multidc_rf1.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (6, '6 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (7, '7 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (8, '8 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (9, '9 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (10, '10 some text');
INSERT INTO integrationtests_multidc_rf1.test1 (myid, myvalue) VALUES (11, '11 some text');


CREATE TABLE IF NOT EXISTS integrationtests_multidc_rf1.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);


CREATE KEYSPACE IF NOT EXISTS integrationtests_alpha_rf1 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '1'}  AND durable_writes = true;

GRANT MODIFY ON KEYSPACE integrationtests_alpha_rf1 TO readwrite;

CREATE TABLE IF NOT EXISTS integrationtests_alpha_rf1.test1 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (0, '0 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (1, '1 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (2, '2 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (3, '3 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (4, '4 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (5, '5 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (6, '6 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (7, '7 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (8, '8 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (9, '9 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (10, '10 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (11, '11 some text');
INSERT INTO integrationtests_alpha_rf1.test1 (myid, myvalue) VALUES (12, '12 some text');


CREATE TABLE IF NOT EXISTS integrationtests_alpha_rf1.test2 (
    myid int,
    myvalue text,
    PRIMARY KEY (myid)
);

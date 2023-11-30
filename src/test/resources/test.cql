-- noinspection SqlNoDataSourceInspectionForFile

CONSISTENCY ALL;

CREATE KEYSPACE IF NOT EXISTS integrationtests_multidc_rf3 WITH replication = {'class': 'NetworkTopologyStrategy', 'alpha': '3', 'omega': '3'}  AND durable_writes = true;

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

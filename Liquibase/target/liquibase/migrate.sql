--  Create Database Lock Table
CREATE TABLE DATABASECHANGELOGLOCK (ID INT NOT NULL, `LOCKED` BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

--  Initialize Database Lock Table
DELETE FROM DATABASECHANGELOGLOCK;

INSERT INTO DATABASECHANGELOGLOCK (ID, `LOCKED`) VALUES (1, 0);

--  Lock Database
UPDATE DATABASECHANGELOGLOCK SET `LOCKED` = 1, LOCKEDBY = 'DESKTOP-EF2AUJ4 (172.27.192.1)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;

--  Create Database Change Log Table
CREATE TABLE DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, `DESCRIPTION` VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: src/main/resources/db/changelog/master-changelog.xml
--  Ran at: 13/06/23, 11:27 AM
--  Against: root@localhost@jdbc:mysql://localhost:3306/liquibase
--  Liquibase version: 4.22.0
--  *********************************************************************

--  Changeset src/main/resources/db/changelog/master-changelog1.xml::1::swapnil
CREATE TABLE Student (StudentId INT NOT NULL, StudentName VARCHAR(255) NULL, CONSTRAINT PK_STUDENT PRIMARY KEY (StudentId));

INSERT INTO Student (studentName) VALUES ('Tom');

UPDATE Student SET studentName = 'Jerry' WHERE name = 'Tom';

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'swapnil', 'src/main/resources/db/changelog/master-changelog1.xml', NOW(), 1, '9:6f856078f85553653d8cfc3e0846f7d6', 'createTable tableName=Student; insert tableName=Student; update tableName=Student', '', 'EXECUTED', NULL, NULL, '4.22.0', '6635828655');

--  Changeset src/main/resources/db/changelog/master-changelog2.xml::2::ajit
CREATE TABLE Emp (EmpId INT NOT NULL, EmpName VARCHAR(255) NULL, CONSTRAINT PK_EMP PRIMARY KEY (EmpId));

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'ajit', 'src/main/resources/db/changelog/master-changelog2.xml', NOW(), 2, '9:df17d34d1a6574d05cd37e9c2e697b83', 'createTable tableName=Emp', '', 'EXECUTED', NULL, NULL, '4.22.0', '6635828655');

--  Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


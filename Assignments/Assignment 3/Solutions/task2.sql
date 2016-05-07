SET ECHO ON;
SPOOL task2.lst;

SET LINESIZE 300;

/*
 * Task 2
 */
 
-- Question 2.1

-- Need to disable the constraint
ALTER TABLE TEACHES
  DISABLE CONSTRAINT RUNNINGSUBJECT_FKEY2;

DELETE FROM ACADEMIC WHERE ACADEMIC.STAFF# NOT IN (
  SELECT DISTINCT TEACHES.LECTURER FROM TEACHES
    WHERE TEACHES.YEAR > TO_CHAR(ADD_MONTHS(SYSDATE, -12 * 3), 'YYYY')
  );

-- Question 2.2
DROP TABLE CSCI235;
CREATE TABLE CSCI235 AS (SELECT * FROM ACADEMIC WHERE 1=0);

SELECT * FROM CSCI235;

ALTER TABLE CSCI235 ADD (  
	CONSTRAINT CSCI235_pkey PRIMARY KEY(staff#),
	CONSTRAINT CSCI235_ckey1 UNIQUE (first_name, last_name),
	CONSTRAINT CSCI235_ckey2 UNIQUE(email),
	CONSTRAINT CSCI235_ckey3 UNIQUE(bldg#, room#),
	CONSTRAINT CSCI235_ckey4 UNIQUE(phone#),
	CONSTRAINT CSCI235_fkey4 FOREIGN KEY (position)
				REFERENCES LPosition(position));
        
INSERT INTO CSCI235 (
  SELECT * FROM ACADEMIC WHERE ACADEMIC.STAFF# IN (
    SELECT LECTURER FROM TEACHES WHERE TEACHES.CODE = 'CSCI235'
  )
);

-- Question 2.3

ALTER TABLE ACADEMIC ADD TOTAL_SUBJECTS NUMBER(10);

UPDATE ACADEMIC A1 SET TOTAL_SUBJECTS = (SELECT COUNT(TEACHES.CODE) FROM TEACHES WHERE TEACHES.LECTURER = A1.STAFF#);

SPOOL OFF;
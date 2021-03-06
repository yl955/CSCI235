SET ECHO ON;
SPOOL task3.lst;

SET LINESIZE 300;

/*
 * Task 3
 */
 
CREATE USER SCOTT IDENTIFIED BY PASSWORD;
 
-- Question 3.1 
 
GRANT SELECT, INSERT, UPDATE ON TEACHES TO SCOTT;
 
-- Question 3.2

GRANT CREATE TABLE TO SCOTT;
GRANT REFERENCES (CODE) ON RUNNINGSUBJECT TO SCOTT;

-- Question 3.3

CREATE OR REPLACE VIEW VIEW_3_3 AS
  SELECT * FROM ACADEMIC WHERE ACADEMIC.STAFF# IN (
    SELECT LECTURER FROM TEACHES WHERE CODE IN (
      'CSCI235',
      'CSCI204',
      'CSCI124'
    )
  );
    
GRANT SELECT ON VIEW_3_3 TO SCOTT;

SPOOL OFF;

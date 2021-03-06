SPOOL task2;
SET ECHO ON;
SET FEEDBACK ON;
SET LINESIZE 100;
SET PAGESIZE 100;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE FINDAPPS(positionNumber IN SNEEDED.PNUMBER%TYPE)
IS
  minSkillLevel SNEEDED.SLEVEL%TYPE;
  currentSkillLevel SPOSSESSED.SLEVEL%TYPE;
  applicantNumber APPLICANT.ANUMBER%TYPE;
  CURSOR Q1 IS
    SELECT APPLICANT.ANUMBER, SPOSSESSED.SLEVEL FROM APPLICANT
    JOIN SPOSSESSED ON APPLICANT.ANUMBER = SPOSSESSED.ANUMBER;
BEGIN

  SELECT MIN(SLEVEL) INTO minSkillLevel FROM SNEEDED WHERE PNUMBER = positionNumber;

  DBMS_OUTPUT.PUT(positionNumber || ':');
  
  OPEN Q1;
  LOOP
    FETCH Q1 INTO applicantNumber, currentSkillLevel;
    IF Q1%NOTFOUND THEN EXIT; END IF;
    
    IF currentSkillLevel >= minSkillLevel THEN
      DBMS_OUTPUT.PUT(' ' || applicantNumber);
    END IF;
    
    END LOOP;
  CLOSE Q1;
  
  DBMS_OUTPUT.PUT_LINE('');

END FINDAPPS;
/

EXECUTE FINDAPPS(7);

SPOOL OFF;

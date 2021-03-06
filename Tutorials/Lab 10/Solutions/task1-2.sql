SET ECHO ON;
SPOOL task1-2.lst;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET SERVEROUTPUT ON;

SELECT * FROM POSITION;

BEGIN

  UPDATE POSITION SET POSITION.SALARY = (POSITION.SALARY - POSITION.SALARY*0.5)
  WHERE POSITION.ENAME = 'University of Wollongong';
  
  COMMIT;
  
END;
/

SELECT * FROM POSITION;

SPOOL OFF;

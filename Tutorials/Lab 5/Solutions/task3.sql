SET ECHO ON;
SPOOL task3.lst;

-- Question 1
SELECT P#, PTITLE FROM POSITION WHERE P# IN (
  SELECT P# FROM SNEEDED WHERE
    SNEEDED.SNAME = 'COOKING'
    AND
    SNEEDED.SKILLLEVEL > 5
);

-- Question 2
SELECT LSKILL.SKILL FROM LSKILL WHERE LSKILL.SKILL NOT IN (
  SELECT SPOSSESSED.SNAME FROM SPOSSESSED
);

-- Question 3
SELECT SNAME FROM SNEEDED GROUP BY SNAME HAVING COUNT(P#) > 3;

SPOOL OFF;

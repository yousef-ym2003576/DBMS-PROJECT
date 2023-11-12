---------------------------------------------------------HERE WE DISPLAY THE QUERIES FOR THE COST ESTIMATOR--------------------------------------------------------------------------

-----------------------------------------------------------------------------STUDENT-------------------------------------------------------------------------------------------

-- SELECTION USING A PRIMARY KEY AND EQUALITY OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT WHERE "SId" = 202008146;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A PRIMARY KEY WITH RANGE OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT WHERE "SId" > 202000000;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A NON-PRIMARY KEY AND EQUALITY OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT WHERE FName = 'Ali';

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A NON-PRIMARY KEY WITH RANGE OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT WHERE FName > 'A' AND FName < 'M';

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING EQUI-JOIN
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR 
SELECT S."SId", S.FName, S.LName, C.CCode, C.CoName, SE.SecNo, SE.Sem
FROM STUDENT S
JOIN STUDENT_TAKES ST ON S."SId" = ST."SId"
JOIN SECTION SE ON ST.SecId = SE.SecId
JOIN COURSE C ON SE.SecId = C.SecId;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-------------------------------------------------------------------------STUDENT_TAKES-------------------------------------------------------------------------------------------

-- SELECTION USING A PRIMARY KEY AND EQUALITY OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT_TAKES WHERE "SId" = 201903916;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A PRIMARY KEY WITH RANGE OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT_TAKES WHERE "SId" > 202000000;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A NON-PRIMARY KEY AND EQUALITY OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT_TAKES WHERE GRADE = 'C+';

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A NON-PRIMARY KEY WITH RANGE OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM STUDENT_TAKES WHERE Grade > 'A' AND Grade < 'C';

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING EQUI-JOIN
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR
SELECT S."SId", S.FName, S.LName, C.CCode, C.CoName, SE.SecNo, SE.Sem
FROM STUDENT_TAKES ST
JOIN STUDENT S ON ST."SId" = S."SId"
JOIN SECTION SE ON ST.SecId = SE.SecId
JOIN COURSE C ON SE.SecId = C.SecId;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-----------------------------------------------------------------------------SECTION-------------------------------------------------------------------------------------------

-- SELECTION USING A PRIMARY KEY AND EQUALITY OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM SECTION WHERE SecId = 14281;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A PRIMARY KEY WITH RANGE OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM SECTION WHERE SecId > 11900;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A NON-PRIMARY KEY AND EQUALITY OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM SECTION WHERE ROOMNO = 'E112';

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING A NON-PRIMARY KEY WITH RANGE OPERATOR
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR SELECT * FROM SECTION WHERE "Year" >= 2020 AND "Year" <= 2022;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

-- SELECTION USING EQUI-JOIN
DELETE FROM PLAN_TABLE;

EXPLAIN PLAN FOR 
SELECT SE.SecId, SE.SecNo, SE.Sem, S."SId", S.FName, S.LName, C.CCode, C.CoName
FROM SECTION SE
JOIN STUDENT_TAKES ST ON SE.SecId = ST.SecId
JOIN STUDENT S ON ST."SId" = S."SId"
JOIN COURSE C ON SE.SecId = C.SecId;

SELECT PLAN_ID, OPERATION, OPTIONS, OBJECT_NAME, OBJECT_TYPE, COST, CARDINALITY, BYTES, TIME FROM PLAN_TABLE;

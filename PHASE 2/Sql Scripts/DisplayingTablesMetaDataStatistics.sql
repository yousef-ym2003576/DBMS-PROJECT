---------------------------------------------------------------------HERE WE DISPLAY THE TABLES--------------------------------------------------------------------------

-- STUDENT
SELECT * FROM STUDENT;

-- STUDENT_TAKES
SELECT * FROM STUDENT_TAKES;

-- SECTION
SELECT * FROM SECTION;

----------------------------------------------------------HERE WE DISPLAY THE METADATA AND STATISTICS--------------------------------------------------------------------------

-----------------------------------------------------------------------------STUDENT-------------------------------------------------------------------------------------------

-- TABLE
SELECT NUM_ROWS, AVG_ROW_LEN, AVG_SPACE, BLOCKS, EMPTY_BLOCKS, SAMPLE_SIZE 
FROM USER_TABLES WHERE TABLE_NAME = 'STUDENT';

-- COLUMNS
SELECT COLUMN_NAME, COLUMN_ID, DATA_TYPE, DATA_LENGTH, NULLABLE, DATA_DEFAULT, NUM_NULLS, NUM_DISTINCT, CHAR_LENGTH, DATA_PRECISION 
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'STUDENT';

-- INDEXES
SELECT INDEX_NAME, NUM_ROWS, UNIQUENESS, STATUS, INDEX_TYPE, JOIN_INDEX 
FROM USER_INDEXES WHERE TABLE_NAME = 'STUDENT';

-------------------------------------------------------------------------STUDENT_TAKES-------------------------------------------------------------------------------------------

-- TABLE
SELECT NUM_ROWS, AVG_ROW_LEN, AVG_SPACE, BLOCKS, EMPTY_BLOCKS, SAMPLE_SIZE
FROM USER_TABLES WHERE TABLE_NAME = 'STUDENT_TAKES';

-- COLUMNS
SELECT COLUMN_NAME, COLUMN_ID, DATA_TYPE, DATA_LENGTH, NULLABLE, DATA_DEFAULT, NUM_NULLS, NUM_DISTINCT, CHAR_LENGTH, DATA_PRECISION 
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'STUDENT_TAKES';

-- INDEXES
SELECT INDEX_NAME, NUM_ROWS, UNIQUENESS, STATUS, INDEX_TYPE, JOIN_INDEX 
FROM USER_INDEXES WHERE TABLE_NAME = 'STUDENT_TAKES';

----------------------------------------------------------------------------SECTION-------------------------------------------------------------------------------------------

-- TABLE
SELECT NUM_ROWS, AVG_ROW_LEN, AVG_SPACE, BLOCKS, EMPTY_BLOCKS, SAMPLE_SIZE
FROM USER_TABLES WHERE TABLE_NAME = 'SECTION';

-- COLUMNS
SELECT COLUMN_NAME, COLUMN_ID, DATA_TYPE, DATA_LENGTH, NULLABLE, DATA_DEFAULT, NUM_NULLS, NUM_DISTINCT, CHAR_LENGTH, DATA_PRECISION 
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'SECTION';

-- INDEXES
SELECT INDEX_NAME, NUM_ROWS, UNIQUENESS, STATUS, INDEX_TYPE, JOIN_INDEX 
FROM USER_INDEXES WHERE TABLE_NAME = 'SECTION';


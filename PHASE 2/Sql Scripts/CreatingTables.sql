--------------------------------------------------------------------HERE WE CREATE THE TABLES--------------------------------------------------------------------------

/* 
We have modified the tables by creating constraints for attributes that are primary key or unique to be able to
give them names which will help identify them when vieiwing the index metadata for each table             
   
*/


CREATE TABLE STUDENT(
"SId" NUMBER(9),
DOB DATE NOT NULL,
FName VARCHAR2(20) NOT NULL,
MName VARCHAR2(20),
LName VARCHAR2(20) NOT NULL,
Addr VARCHAR2(50),
Phone NUMBER(8) NOT NULL,
Major VARCHAR2(50) NOT NULL,


CONSTRAINT STUDENT_SID_PK PRIMARY KEY ("SId"),
CONSTRAINT STUDENT_PHONE_UNIQUE UNIQUE (Phone)
);

CREATE TABLE SECTION(
SecId NUMBER(5),
SecNo VARCHAR2(3),
Sem VARCHAR2(30) NOT NULL,
"Year" NUMBER(4) NOT NULL,
Bldg VARCHAR2(3) NOT NULL,
RoomNo VARCHAR2(4) NOT NULL,
DaysTime VARCHAR2(255) NOT NULL,

CONSTRAINT SECTION_SECID_PK PRIMARY KEY (SecId)
);

CREATE TABLE COURSE(
CCode VARCHAR2(10),
Credits NUMBER(1) NOT NULL,
CoName VARCHAR2(255),
"Level" VARCHAR2(255) NOT NULL,
CDesc VARCHAR2(1000) ,
SecId NUMBER(5),

CONSTRAINT COURSE_CCode_PK PRIMARY KEY (CCode),
CONSTRAINT COURSE_SecId_FK FOREIGN KEY (SecId) REFERENCES SECTION(SecId)
);

CREATE TABLE INSTRUCTOR(
"Id" NUMBER(4),
"Rank" VARCHAR2(100) NOT NULL,
IName VARCHAR2(50) NOT NULL,
IOffice VARCHAR2(30),
IPhone NUMBER(8) NOT NULL,
SecId NUMBER(5),

CONSTRAINT INSTRUCTOR_IPHONE_UNIQUE UNIQUE (IPhone),
CONSTRAINT INSTRUCTOR_ID_PK PRIMARY KEY ("Id"),
CONSTRAINT INSTRUCTOR_SecId_FK FOREIGN KEY (SecId) REFERENCES SECTION(SecId)
);

CREATE TABLE DEPT(
DCode VARCHAR2(30),
DName VARCHAR2(100) NOT NULL,
DOffice VARCHAR2(30) NOT NULL,
DPhone NUMBER(8) NOT NULL,
"Id" NUMBER(4),
"SId" NUMBER(9),
CCode VARCHAR2(10),
CStartDate DATE NOT NULL,

CONSTRAINT DEPT_DName_UNIQUE UNIQUE (DName),
CONSTRAINT DEPT_DOffice_UNIQUE UNIQUE (DOffice),
CONSTRAINT DEPT_DPhone_UNIQUE UNIQUE (DPhone),
CONSTRAINT DCode_SID_PK PRIMARY KEY (DCode),
CONSTRAINT DEPT_Id_FK FOREIGN KEY ("Id") REFERENCES INSTRUCTOR("Id"),
CONSTRAINT DEPT_SId_FK FOREIGN KEY ("SId") REFERENCES STUDENT("SId"),
CONSTRAINT DEPT_CCode_FK FOREIGN KEY (CCode) REFERENCES COURSE(CCode)
);

CREATE TABLE COLLEGE(
CName VARCHAR2(30) NOT NULL,
COffice VARCHAR2(30) NOT NULL,
CPhone NUMBER(8) NOT NULL,
"Id" NUMBER(4),
DCode VARCHAR2(30),

CONSTRAINT COLLEGE_COffice_UNIQUE UNIQUE (COffice),
CONSTRAINT COLLEGE_CPhone_UNIQUE UNIQUE (CPhone),
CONSTRAINT COLLEGE_CName_PK PRIMARY KEY (CName),
CONSTRAINT COLLEGE_Id_FK FOREIGN KEY ("Id") REFERENCES INSTRUCTOR("Id"),
CONSTRAINT COLLEGE_DCode_FK FOREIGN KEY (Dcode) REFERENCES DEPT(DCode)
);

CREATE TABLE STUDENT_TAKES(
"SId" NUMBER(9),
SecId NUMBER(5),
Grade VARCHAR2(2),

CONSTRAINT STUDENT_TAKES_SId_SecId_PK PRIMARY KEY("SId",SecId),
CONSTRAINT STUDENT_TAKES_SId_FK FOREIGN KEY ("SId") REFERENCES STUDENT("SId"),
CONSTRAINT STUDENT_TAKES_SecId_FK FOREIGN KEY (SecId) REFERENCES SECTION(SecId)
);

--------------------------------------------------------------HERE WE INSERT VALUES INTO THE TABLES-----------------------------------------------------------------------

INSERT INTO STUDENT VALUES(202008146,'19-JUN-2003','Ali','Ahmed','Mohamed','Fereej Bin Mahmoud',55298173,'Computer Science');
INSERT INTO STUDENT VALUES(201903916,'28-FEB-2002','Mohamed',null,'Hussein','Al Thumama',55793825,'Computer Engineering');
INSERT INTO STUDENT VALUES(202104927,'05-DEC-2004','Majed','Walid','Abdullah','Musherieb',66778239,'Mechanical Engineering');
INSERT INTO STUDENT VALUES(201707720,'18-MAY-2000','Osama',null,'Ghassan','Al Saad',62914431,'General Engineering');
INSERT INTO STUDENT VALUES(202209136,'03-AUG-2005','Hany','Ahmed','Sherif','Al Matar Al Qadeem',33992847,'Electrical Engineering');

INSERT INTO SECTION VALUES(11873,'L01','Spring 2021',2021,'H07','C115','S/T/TH 9-9:50 AM');
INSERT INTO SECTION VALUES(14281,'L03','Spring 2023',2023,'H08','D210','S/T/TH 10-10:50 AM');
INSERT INTO SECTION VALUES(15922,'B01','Fall 2022',2022,'BCR','E112','M 12-2:50 PM');
INSERT INTO SECTION VALUES(11931,'B04','Spring 2020',2020,'A07','212','W 9-11:50 AM');
INSERT INTO SECTION VALUES(11201,'L02','Fall 2023',2023,'B05','205','S/T/TH 2-2:50 PM');

INSERT INTO COURSE VALUES('CMPS251',0,'Object-Oriented Programming','Undergraduate','Fundamentals of object-oriented programming, object-oriented design, apply object oriented concepts such as abstraction, encapsulation, composition, inheritance, polymorphism, and interfaces. Graphical user interface and event-driven programming; exception handling; additional object-oriented features. The laboratory provides practical object-oriented programming experience.',15922);

INSERT INTO COURSE VALUES('PHYS191',3,'General Physics for Engineering 1','Undergraduate','Vectors - motion in one dimension - motion in a plane - Newton’s laws - work and energy - potential energy - momentum - rotational motion - dynamics of rotational motion - elasticity - fluid mechanics.',11873);

INSERT INTO COURSE VALUES('ENGL202',3,'English Language 1','Undergraduate','English Language I Post Foundation is based on learner-centric academic writing, with an emphasis on process-based writing of academic essays and paraphrasing.',11201);

INSERT INTO COURSE VALUES('HIST121',3,'History of Qatar','Undergraduate','This course aims at familiarizing students with the history of Qatar through different historical eras, with particular emphasis on the emergence and development of Qatar Emirate during the Ottoman-British rivalry in the Gulf.',14281);

INSERT INTO COURSE VALUES('GEOL101',3,'Principles of General Geology','Undergraduate','Introduction to geology and earth sciences, evaluation of the geologic thinking and the contribution of Arab and Muslim scientists, position of the Earth in the universe and its relation to other planets, and origin and evolution of Earth.',11931);

INSERT INTO INSTRUCTOR VALUES(2186,'Associate Proffesor of Computer Science','Ahmed Musa','BCR-C204',55246833,15922);
INSERT INTO INSTRUCTOR VALUES(1940,'Lecturer','Mohamed Salem','BCR-E121',66108430,14281);
INSERT INTO INSTRUCTOR VALUES(2913,'Teaching assistant','Zeyad Gaber','H07-A110',33193075,11931);
INSERT INTO INSTRUCTOR VALUES(3910,'Engineer','Ahmed Tamer','BCR-A111',67208814,11873);
INSERT INTO INSTRUCTOR VALUES(4100,'Assistant Proffesor','Khaled Ahmed','B05-115',66105632,11201);

INSERT INTO DEPT VALUES('CSE','Department of Computer Science','H07-A105',44891120,2186,202008146,'CMPS251','28-AUG-2022');
INSERT INTO DEPT VALUES('PHY','Department of Physics','H07-B118',44783019,3910,201903916,'PHYS191','10-JAN-2021');
INSERT INTO DEPT VALUES('GEO','Department of Geology','BCR-F210',44229031,2913,202104927,'GEOL101','07-JAN-2020');
INSERT INTO DEPT VALUES('ENG','Department of English Language','B05-201',44841038,4100,201707720,'ENGL202','27-AUG-2023');
INSERT INTO DEPT VALUES('QH','Department of Qatar History','BCR-H115',44319055,1940,202209136,'HIST121','09-JAN-2023');

INSERT INTO COLLEGE VALUES('College of Engineering','H07-A111',44881212,2186,'CSE');
INSERT INTO COLLEGE VALUES('College of Education','H08-D118',44103374,4100,'ENG');
INSERT INTO COLLEGE VALUES('College of Sciences','B05-113',44993720,3910,'PHY');
INSERT INTO COLLEGE VALUES('College of Educational Science','H12-104',44291035,2913,'GEO');
INSERT INTO COLLEGE VALUES('College of History','H08-124',44447291,1940,'QH');

INSERT INTO STUDENT_TAKES VALUES(202008146,15922,'C+');
INSERT INTO STUDENT_TAKES VALUES(201903916,11873,'B');
INSERT INTO STUDENT_TAKES VALUES(202104927,11201,'A');
INSERT INTO STUDENT_TAKES VALUES(202008146,14281,'C');
INSERT INTO STUDENT_TAKES VALUES(202209136,11931,'B+');


COMMIT;





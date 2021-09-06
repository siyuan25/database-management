/*
** ----------------------------------------------------------------------------
** script to insert data into the engineer table
** attributes: name, empId, hours, payRate
** --------------------------------------------------------------------------*/
INSERT INTO engineer VALUES('James','111111',20,12);
INSERT INTO engineer VALUES('Sally','222222',25,12);
INSERT INTO engineer VALUES('John','333333',27,14);
INSERT INTO engineer VALUES('Vanessa','444444',23,13);
INSERT INTO engineer VALUES('Sean','555555',28,15);
INSERT INTO engineer VALUES('Zoe','666666',26,15);
INSERT INTO engineer VALUES('Franklin','777777',32,16);
INSERT INTO engineer VALUES('William','888888',35,15);
INSERT INTO engineer VALUES('Ashley','999999',24,14);




/*
** ----------------------------------------------------------------------------
** update empId in the engineer table, change 6 digits to 5 digits 
** --------------------------------------------------------------------------*/
UPDATE engineer SET empId = '11111' WHERE empId='111111';
UPDATE engineer SET empId = '22222' WHERE empId='222222';
UPDATE engineer SET empId = '33333' WHERE empId='333333';
UPDATE engineer SET empId = '44444' WHERE empId='444444';
UPDATE engineer SET empId = '55555' WHERE empId='555555';
UPDATE engineer SET empId = '66666' WHERE empId='666666';
UPDATE engineer SET empId = '77777' WHERE empId='777777';
UPDATE engineer SET empId = '88888' WHERE empId='888888';
UPDATE engineer SET empId = '99999' WHERE empId='999999';



/*
** ----------------------------------------------------------------------------
** script to insert data into the project table
** attributes: projId, proj_name, project_status, managerEmpId, 
**             start_date, end_date, budget
** --------------------------------------------------------------------------*/
INSERT INTO project VALUES('01','project1','in progress','88888', '21-FEB-21', '', 500);
INSERT INTO project VALUES('02','project2','in progress','11111', '14-FEB-21', '', 220);
INSERT INTO project VALUES('03','project3','in progress','99999', '8-DEC-20', '', 420);
INSERT INTO project VALUES('04','project4','in progress','22222', '12-JAN-21', '', 600);
INSERT INTO project VALUES('05','project5','in progress','55555', '6-JAN-2021', '', 520);
INSERT INTO project VALUES('06','project6','not started','44444', '', '', 310);
INSERT INTO project VALUES('07','project7','completed','33333', '13-OCT-20', '30-JAN-21', 390);
INSERT INTO project VALUES('08','project8','completed','77777', '18-NOV-20', '19-FEB-21', 500);
INSERT INTO project VALUES('09','project9','completed','66666', '5-DEC-20', '6-MAR-21', 630);



/*
** ----------------------------------------------------------------------------
** update projId in the project table, change two digits to one digit
** --------------------------------------------------------------------------*/
UPDATE project SET projId = '1' WHERE projId='01';
UPDATE project SET projId = '2' WHERE projId='02';
UPDATE project SET projId = '3' WHERE projId='03';
UPDATE project SET projId = '4' WHERE projId='04';
UPDATE project SET projId = '5' WHERE projId='05';
UPDATE project SET projId = '6' WHERE projId='06';
UPDATE project SET projId = '7' WHERE projId='07';
UPDATE project SET projId = '8' WHERE projId='08';
UPDATE project SET projId = '9' WHERE projId='09';



/*
** ----------------------------------------------------------------------------
** script to insert data into the manager table
** attributes: managerEmpId
** --------------------------------------------------------------------------*/
INSERT INTO manager VALUES('11111');
INSERT INTO manager VALUES('22222');
INSERT INTO manager VALUES('33333');
INSERT INTO manager VALUES('44444');
INSERT INTO manager VALUES('66666');
INSERT INTO manager VALUES('77777');
INSERT INTO manager VALUES('99999');


/*
** ----------------------------------------------------------------------------
** update managerEmpId in the manager table
** update the managerEmpId, '22222' will not take in charge of projects, 
** whose original prject will take over by '55555', 
** also the original project(s) from '44444' will take over by '88888'
** --------------------------------------------------------------------------*/
UPDATE manager SET managerEmpId = '55555' WHERE managerEmpId='22222';
UPDATE manager SET managerEmpId = '88888' WHERE managerEmpId='44444';



/*
** ----------------------------------------------------------------------------
** script to insert data into the manages table
** attributes: projectId, managerEmpId
** --------------------------------------------------------------------------*/
INSERT INTO manages VALUES('01','88888');
INSERT INTO manages VALUES('02','11111');
INSERT INTO manages VALUES('03','99999');
INSERT INTO manages VALUES('04','55555');
INSERT INTO manages VALUES('05','55555');
INSERT INTO manages VALUES('06','88888');
INSERT INTO manages VALUES('07','33333');
INSERT INTO manages VALUES('08','77777');
INSERT INTO manages VALUES('09','66666');


/*
** ----------------------------------------------------------------------------
** update projectId in the manages table, change two digits to one digit
** --------------------------------------------------------------------------*/
UPDATE manages SET projectId = '1' WHERE projectId='01';
UPDATE manages SET projectId = '2' WHERE projectId='02';
UPDATE manages SET projectId = '3' WHERE projectId='03';
UPDATE manages SET projectId = '4' WHERE projectId='04';
UPDATE manages SET projectId = '5' WHERE projectId='05';
UPDATE manages SET projectId = '6' WHERE projectId='06';
UPDATE manages SET projectId = '7' WHERE projectId='07';
UPDATE manages SET projectId = '8' WHERE projectId='08';
UPDATE manages SET projectId = '9' WHERE projectId='09';



/*
** ----------------------------------------------------------------------------
** script to insert data into the engineer_assignProject table
** attributes: assignPId, empId
** --------------------------------------------------------------------------*/
INSERT INTO engineer_assignProject VALUES('01','88888');
INSERT INTO engineer_assignProject VALUES('01','77777');
INSERT INTO engineer_assignProject VALUES('02','11111');
INSERT INTO engineer_assignProject VALUES('02','22222');
INSERT INTO engineer_assignProject VALUES('02','66666');
INSERT INTO engineer_assignProject VALUES('03','99999');
INSERT INTO engineer_assignProject VALUES('03','22222');
INSERT INTO engineer_assignProject VALUES('03','44444');
INSERT INTO engineer_assignProject VALUES('04','22222');
INSERT INTO engineer_assignProject VALUES('04','55555');
INSERT INTO engineer_assignProject VALUES('05','55555');
INSERT INTO engineer_assignProject VALUES('05','33333');
INSERT INTO engineer_assignProject VALUES('05','99999');
INSERT INTO engineer_assignProject VALUES('06','44444');
INSERT INTO engineer_assignProject VALUES('06','11111');
INSERT INTO engineer_assignProject VALUES('07','33333');
INSERT INTO engineer_assignProject VALUES('07','55555');
INSERT INTO engineer_assignProject VALUES('08','77777');
INSERT INTO engineer_assignProject VALUES('08','22222');
INSERT INTO engineer_assignProject VALUES('08','55555');
INSERT INTO engineer_assignProject VALUES('09','66666');
INSERT INTO engineer_assignProject VALUES('09','44444');
INSERT INTO engineer_assignProject VALUES('09','88888');



/*
** ----------------------------------------------------------------------------
** update assignPId in the engineer_assignProject table, change 
** two digits to one digit
** --------------------------------------------------------------------------*/
UPDATE engineer_assignProject SET assignPId = '1' WHERE assignPId='01';
UPDATE engineer_assignProject SET assignPId = '2' WHERE assignPId='02';
UPDATE engineer_assignProject SET assignPId = '3' WHERE assignPId='03';
UPDATE engineer_assignProject SET assignPId = '4' WHERE assignPId='04';
UPDATE engineer_assignProject SET assignPId = '5' WHERE assignPId='05';
UPDATE engineer_assignProject SET assignPId = '6' WHERE assignPId='06';
UPDATE engineer_assignProject SET assignPId = '7' WHERE assignPId='07';
UPDATE engineer_assignProject SET assignPId = '8' WHERE assignPId='08';
UPDATE engineer_assignProject SET assignPId = '9' WHERE assignPId='09';



/*
** ----------------------------------------------------------------------------
** script to insert data into the engineer_assignReport table
** attributes: assignReportId, empId
** --------------------------------------------------------------------------*/
INSERT INTO engineer_assignReport VALUES('1','11111');
INSERT INTO engineer_assignReport VALUES('2','88888');
INSERT INTO engineer_assignReport VALUES('3','33333');
INSERT INTO engineer_assignReport VALUES('4','66666');



/*
** ----------------------------------------------------------------------------
** update assignReportId in the engineer_assignReport table, change 
** one digit to three digits in order to easier distinguish numbers
** --------------------------------------------------------------------------*/
UPDATE engineer_assignReport SET assignReportId = '001' WHERE assignReportId='1';
UPDATE engineer_assignReport SET assignReportId = '002' WHERE assignReportId='2';
UPDATE engineer_assignReport SET assignReportId = '003' WHERE assignReportId='3';
UPDATE engineer_assignReport SET assignReportId = '004' WHERE assignReportId='4';



/*
** ----------------------------------------------------------------------------
** script to insert data into the bug table
** attributes: bugId, bug_type, bug_desc
** --------------------------------------------------------------------------*/
INSERT INTO bug VALUES('01','Incorrect calculations','The bug caused by the wrong algorithm.');
INSERT INTO bug VALUES('02','Error handling errors','User cannot receive an informative message not to do the same mistake again.');
INSERT INTO bug VALUES('03','Functional errors','The expected result of operations in function 1 did not coincide with an actual one.');
INSERT INTO bug VALUES('04','Syntactic errors','While testing GUI of the product, the correspondence of the elements with the documentation do not match.');
INSERT INTO bug VALUES('05','Missing command errors','Cannot close a pop-up window without performing some actions.');
INSERT INTO bug VALUES('06','Boundary related errors','Too many characters in a text entry.');
INSERT INTO bug VALUES('07','Incorrect calculations','The bug caused by data type mismatch.');
INSERT INTO bug VALUES('08','Boundary related errors','Amount of maximum number of simultaneous users is uncertain.');



/*
** ----------------------------------------------------------------------------
** update bugId in the bug table, change two digits to one digit
** --------------------------------------------------------------------------*/
UPDATE bug SET bugId = '1' WHERE bugId='01';
UPDATE bug SET bugId = '2' WHERE bugId='02';
UPDATE bug SET bugId = '3' WHERE bugId='03';
UPDATE bug SET bugId = '4' WHERE bugId='04';
UPDATE bug SET bugId = '5' WHERE bugId='05';
UPDATE bug SET bugId = '6' WHERE bugId='06';
UPDATE bug SET bugId = '7' WHERE bugId='07';
UPDATE bug SET bugId = '8' WHERE bugId='08';



/*
** ----------------------------------------------------------------------------
** script to insert data into the bug_report table
** attributes: reportId, submit_engId, assign_engId, bugId, projectId, 
**             report_desc, report_date, fix_date
** --------------------------------------------------------------------------*/
INSERT INTO bug_report VALUES('1','77777','11111','1','1','bugId 1, the bug caused by the wrong algorithm.','26-JAN-21','2-FEB-21');
INSERT INTO bug_report VALUES('2','55555','88888','2','5','bugId2, user cannot receive an informative message not to do the same mistake again.','8-FEB-21','15-FEB-21');
INSERT INTO bug_report VALUES('3','11111','33333','6','2','bugId6, too many characters in a text entry.','16-FEB-21','26-FEB-21');
INSERT INTO bug_report VALUES('4','22222','66666','5','4','bugId5, cannot close a pop-up window without performing some actions.','19-FEB-21','');



/*
** ----------------------------------------------------------------------------
** update reportId in the bug_report table, change three digits to one digit
** --------------------------------------------------------------------------*/
UPDATE bug_report SET reportId = '001' WHERE reportId='1';
UPDATE bug_report SET reportId = '002' WHERE reportId='2';
UPDATE bug_report SET reportId = '003' WHERE reportId='3';
UPDATE bug_report SET reportId = '004' WHERE reportId='4';



/*
** ----------------------------------------------------------------------------
** script to insert data into the works_on table
** attributes: reportId, empId, status
** --------------------------------------------------------------------------*/
INSERT INTO works_on VALUES('001','11111','in progress');
INSERT INTO works_on VALUES('002','88888','in progress');
INSERT INTO works_on VALUES('003','33333','in progress');
INSERT INTO works_on VALUES('004','66666','not started');



/*
** ----------------------------------------------------------------------------
** update status in the works_on table, update the projects' work status
** --------------------------------------------------------------------------*/
UPDATE works_on SET status = 'completed' WHERE reportId='001';
UPDATE works_on SET status = 'completed' WHERE reportId='002';
UPDATE works_on SET status = 'completed' WHERE reportId='003';
UPDATE works_on SET status = 'in progress' WHERE reportId='004';



/*
** ----------------------------------------------------------------------------
** script to insert data into the submits table
** attributes: reportId, empId
** --------------------------------------------------------------------------*/
INSERT INTO submits VALUES('001','777777');
INSERT INTO submits VALUES('002','555555');
INSERT INTO submits VALUES('003','111111');
INSERT INTO submits VALUES('004','222222');



/*
** ----------------------------------------------------------------------------
** update empId in the submits table, change 6 digits to 5 digits 
** --------------------------------------------------------------------------*/
UPDATE submits SET empId = '11111' WHERE empId='111111';
UPDATE submits SET empId = '22222' WHERE empId='222222';
UPDATE submits SET empId = '55555' WHERE empId='555555';
UPDATE submits SET empId = '77777' WHERE empId='777777';


/*
** ----------------------------------------------------------------------------
** script to insert data into the updates table
** attributes: bugId, reportId
** --------------------------------------------------------------------------*/
INSERT INTO updates VALUES('01','001');
INSERT INTO updates VALUES('02','002');
INSERT INTO updates VALUES('05','004');
INSERT INTO updates VALUES('06','003');



/*
** ----------------------------------------------------------------------------
** update bugId in the updates table, change two digits to one digit
** --------------------------------------------------------------------------*/
UPDATE updates SET bugId = '1' WHERE bugId='01';
UPDATE updates SET bugId = '2' WHERE bugId='02';
UPDATE updates SET bugId = '5' WHERE bugId='05';
UPDATE updates SET bugId = '6' WHERE bugId='06';



/*
** -----------------------------------------------------------------------------
** script to create the engineer table 
** ---------------------------------------------------------------------------*/

CREATE TABLE engineer (
	name			VARCHAR2(30)	NOT NULL,
	empId		    VARCHAR2(10)	PRIMARY KEY,
	hours 		    FLOAT        	NOT NULL CHECK(hours >= 0),
	payRate			FLOAT			NOT NULL CHECK(payRate >= 0)
);

SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the project table 
** ---------------------------------------------------------------------------*/

CREATE TABLE project (
	projId		    VARCHAR2(10)	PRIMARY KEY,
    proj_name       VARCHAR2(30)	NOT NULL,
	project_status  VARCHAR(12) 	NOT NULL
                                    CHECK (project_status = 'in progress' 
                                    OR project_status = 'not started' 
                                    OR project_status = 'completed'),
	managerEmpId	VARCHAR2(10),
    start_date		DATE,
	end_date	    DATE,
    budget          FLOAT           NOT NULL CHECK(budget >= 0)
);

SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the manager table 
** ---------------------------------------------------------------------------*/

CREATE TABLE manager (
	managerEmpId	    VARCHAR2(10)	PRIMARY KEY
);

SHOW ERRORS;


/*
** -----------------------------------------------------------------------------
** add foreign key for the manager table 
** ---------------------------------------------------------------------------*/
ALTER TABLE manager
	ADD (FOREIGN KEY(managerEmpId) REFERENCES engineer(empId));
	
SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the manages table 
** ---------------------------------------------------------------------------*/

CREATE TABLE manages (
    projectId       VARCHAR2(20)    PRIMARY KEY,
	managerEmpId	VARCHAR2(10)
);

SHOW ERRORS;


/*
** -----------------------------------------------------------------------------
** add foreign key for the manages table 
** ---------------------------------------------------------------------------*/
ALTER TABLE manages
	ADD (FOREIGN KEY(managerEmpId) REFERENCES manager(managerEmpId) ON DELETE CASCADE);
	
SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the engineer_assignProject table 
** ---------------------------------------------------------------------------*/
CREATE TABLE engineer_assignProject (
    assignPId	VARCHAR2(20),
	empId		VARCHAR2(10),
	PRIMARY KEY (empId,assignPId)
);

SHOW ERRORS;


/*
** -----------------------------------------------------------------------------
** add foreign key for the engineer_assignProject table 
** ---------------------------------------------------------------------------*/
ALTER TABLE engineer_assignProject
	ADD (FOREIGN KEY(empId) REFERENCES engineer(empId) ON DELETE CASCADE);
	
SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the engineer_assignReport table 
** ---------------------------------------------------------------------------*/
CREATE TABLE engineer_assignReport (
    assignReportId	VARCHAR2(20),
	empId		    VARCHAR2(10),
	PRIMARY KEY (empId,assignReportId)
);

SHOW ERRORS;


/*
** -----------------------------------------------------------------------------
** add foreign key for the engineer_assignReport table 
** ---------------------------------------------------------------------------*/
ALTER TABLE engineer_assignReport
	ADD (FOREIGN KEY(empId) REFERENCES engineer(empId) ON DELETE CASCADE);
	
SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the bug table 
** ---------------------------------------------------------------------------*/

CREATE TABLE bug (
    bugId		    VARCHAR2(10)	PRIMARY KEY,
	bug_type		VARCHAR2(50)	NOT NULL,
	bug_desc 		VARCHAR(200) 	NOT NULL
);

SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the engineer table 
** ---------------------------------------------------------------------------*/

CREATE TABLE bug_report (
	reportId		VARCHAR2(20)	PRIMARY KEY,
    submit_engId    VARCHAR2(20)    NOT NULL,
    assign_engId    VARCHAR2(20)    NOT NULL,
	bugId		    VARCHAR2(10) 	NOT NULL,
	projectId       VARCHAR2(20)	NOT NULL,
	report_desc 	VARCHAR(200) 	NOT NULL,
	report_date	    DATE            NOT NULL,
    fix_date	    DATE
);

SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the works_on table 
** ---------------------------------------------------------------------------*/

CREATE TABLE works_on (
    reportId	VARCHAR2(20)	PRIMARY KEY,
	empId		VARCHAR2(10),
	status      VARCHAR(12) 	NOT NULL
                                CHECK (status = 'in progress' 
                                OR status = 'not started' 
                                OR status = 'completed')
);

SHOW ERRORS;


/*
** -----------------------------------------------------------------------------
** add foreign key for the works_on table 
** ---------------------------------------------------------------------------*/
ALTER TABLE works_on
	ADD (FOREIGN KEY(reportId) REFERENCES bug_report(reportId) ON DELETE CASCADE);
	
SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the submits table 
** ---------------------------------------------------------------------------*/

CREATE TABLE submits (
    reportId	VARCHAR2(20)	PRIMARY KEY,
	empId		VARCHAR2(10)    NOT NULL
);

SHOW ERRORS;


/*
** -----------------------------------------------------------------------------
** add foreign key for the submits table 
** ---------------------------------------------------------------------------*/
ALTER TABLE submits
	ADD (FOREIGN KEY(reportId) REFERENCES bug_report(reportId) ON DELETE CASCADE);
	
SHOW ERRORS;



/*
** -----------------------------------------------------------------------------
** script to create the updates table 
** ---------------------------------------------------------------------------*/

CREATE TABLE updates (
	bugId		VARCHAR2(10)	PRIMARY KEY,
    reportId	VARCHAR2(20)    NOT NULL,
    FOREIGN KEY(reportId) REFERENCES bug_report(reportId) ON DELETE CASCADE
);

SHOW ERRORS;


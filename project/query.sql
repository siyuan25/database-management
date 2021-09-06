/*
** ----------------------------------------------------------------------------
** Engineer Assignment Projects
** Retrieve information for each engineer that has been assigned project(s),
** and order by empId by ascending order.
** --------------------------------------------------------------------------*/

SELECT E.empId, E.name, P.projId, P.proj_name, P.project_status, 
       P.managerEmpId, P.start_date, P.end_date
FROM project P, engineer E, engineer_assignProject A
/* natural join three tables by common attributes */
WHERE E.empId = A.empId and P.projId = A.assignPId
ORDER BY E.empId asc;


/*
** ----------------------------------------------------------------------------
**  Engineer’s Current Projects
** 	Retrieve the project name, project ID, and status of each of the 
**  projects to which the engineer is currently assigned, and order by 
**  projId by ascending order. 
** --------------------------------------------------------------------------*/
SELECT P.projId, A.empId, E.name, P.proj_name, P.project_status
FROM project P, engineer E, engineer_assignProject A
/* natural join three tables by common attributes, and choose in progress projects */
WHERE E.empId = A.empId and P.projId = A.assignPId 
      and P.project_status = 'in progress'
ORDER BY P.projId asc;


/*
** ----------------------------------------------------------------------------
** 	Lowest Cost Project 
** 	Retrieve the project ID, project name, project budget, project 
**  start date, and project end date for the project that has the lowest 
**  budget and the shortest period.
** --------------------------------------------------------------------------*/
SELECT P.projId, P.proj_name, P.start_date, P.end_date, P.budget
FROM project P
/* when there is not exists other peojects that has a lower budget, 
** the original project would have the lowest budget */
WHERE not exists 
(SELECT * FROM project P1
WHERE P.projId <>  P1.projId and P.budget > P1.budget);


/*
** ----------------------------------------------------------------------------
** 	Manager’s Current Projects 
** 	Retrieve the project name, project ID, and status of each of the 
**  projects the manager is currently managing.
** --------------------------------------------------------------------------*/
SELECT M.managerEmpId, M1.projectId, P.proj_name, P.project_status
FROM manager M, manages M1, project P
/* natural join three tables by common attributes, and choose in progress 
** projects that the manager is managing */
WHERE M.managerEmpId = M1.managerEmpId and M1.projectId = P.projId 
      and P.project_status='in progress';


/*
** ----------------------------------------------------------------------------
** 	Supervising Engineers
**	Retrieve the employee IDs and employee names of the engineers that 
**  the manager is managing.
** --------------------------------------------------------------------------*/
SELECT A.empId, A.assignPId, M.managerEmpId, E.name
FROM engineer E, engineer_assignProject A, manager M, manages M1, project P
/* natural join four tables by common attributes to find out among 
** in progress projects, which manager is managing which engineers */
WHERE M.managerEmpId = M1.managerEmpId and M1.projectId = P.projId 
      and P.projId = A.assignPId  and E.empId = A.empId 
      and P.project_status ='in progress';


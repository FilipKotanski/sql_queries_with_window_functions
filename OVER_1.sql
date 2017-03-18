
Table: employee

id	first_name	last_name	department_id	salary	years_worked
1	Diane	      Turner	       1	     5330	     4
2	Clarence	  Robinson	       1	     3617	     2
3	Eugene	      Phillips	       1	     4877	     2
4	Philip	      Mitchell	       1	     5259	     3
5	Ann	          Wright	       2	     2094	     5
6	Charles	      Wilson	       2	     5167	     5
7	Russell	      Johnson	       2	     3762	     4
8	Jacqueline	  Cook	           2	     6923	     3
9	Larry	      Lee	           3	     2796	     4
10	Willie	      Patterson	       3	     4771	     5
11	Janet	      Ramirez	       3	     3782	     2
12	Doris	      Bryant	       3	     6419	     1
13	Amy	          Williams	       3	     6261	     1
14	Keith	      Scott	           3	     4928	     8
15	Karen	      Morris	       4	     6347	     6
16	Kathy	      Sanders	       4	     6286	     1
17	Joe	          Thompson	       5	     5639      	 3
18	Barbara	      Clark	           5	     3232	     1
19	Todd	      Bell	           5	     4653	     1
20	Ronald	      Butler	       5	     2076	     5

For each employee in table employee, select first and last name, 
years_worked, average of years spent in the company by all employees, 
and the difference between the years_worked and the average as difference .


SELECT first_name,
       last_name,
       years_worked,AVG(years_worked) OVER(),
       years_worked - AVG(years_worked) OVER()AS difference  
FROM employee;

For all employees from department with id = 3, show their:

first_name,
last_name,
salary,
the difference of their salary to the average of all salaries 
in that department as difference.

SELECT first_name,
       last_name,
       salary,
       salary - AVG(salary) OVER() AS difference
FROM employee WHERE department_id=3;

For each employee that earns more than 4000, show their first_name, 
last_name, salary and the number of all employees who earn more than 4000.

SELECT first_name,
       last_name,
       salary,
       COUNT(id) OVER() 
FROM employee WHERE salary>4000;

Show the first_name, last_name and salary of every person 
who works in departments with id 1, 2 or 3, along with the average salary 
calculated in those three departments.

SELECT first_name,
       last_name,
       salary,
       AVG(SALARY)OVER()
FROM employee WHERE department_id IN (1,2,3);







-- Índice na tabela employee
CREATE INDEX idx_employee_dno ON employee(Dno);
select * from employee e;

-- Índices na tabela department
CREATE INDEX idx_department_dnumber ON department(Dnumber);
CREATE INDEX idx_department_dname ON department(Dname);

-- Índices na tabela dept_locations
CREATE INDEX idx_dept_locations_dnumber ON dept_locations(Dnumber);
CREATE INDEX idx_dept_locations_dlocation ON dept_locations(Dlocation);

-- Query 1: Qual o departamento com maior número de pessoas?
SELECT d.Dname, COUNT(e.Ssn) AS num_employees
FROM departament d
JOIN employee e ON d.Dnumber = e.Dno
GROUP BY d.Dname
ORDER BY num_employees DESC
LIMIT 1;

-- Query 2: Quais são os departamentos por cidade?
SELECT d.Dname, dl.Dlocation
FROM departament d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
ORDER BY d.Dname, dl.Dlocation;

-- Query 3: Relação de empregados por departamento
SELECT d.Dname, e.Fname, e.Lname
FROM departament d
JOIN employee e ON d.Dnumber = e.Dno
ORDER BY d.Dname, e.Lname, e.Fname;

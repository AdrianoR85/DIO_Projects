-- Número de empregados por departamento e localidade:
CREATE VIEW EmpregadoPorDeptLocalidade AS
SELECT 
    d.Dname AS Departamento,
    dl.Dlocation AS Localidade,
    COUNT(e.Ssn) AS NumeroDeEmpregados
FROM 
    department d
JOIN 
    dept_locations dl ON d.Dnumber = dl.Dnumber
JOIN 
    employee e ON d.Dnumber = e.Dno
GROUP BY 
    d.Dname, dl.Dlocation;
   

-- Lista de departamentos e seus gerentes:   
CREATE VIEW DepartamentosEGerentes AS
SELECT 
    d.Dname AS Departamento,
    e.Fname AS GerentePrimeiroNome,
    e.Lname AS GerenteUltimoNome
FROM 
    department d
JOIN 
    employee e ON d.Mgr_ssn = e.Ssn;

-- Quais empregados possuem dependentes e se são gerentes
CREATE VIEW ProjetosComMaisEmpregados AS
SELECT 
    p.Pname AS Projeto,
    COUNT(w.Essn) AS NumeroDeEmpregados
FROM 
    project p
JOIN 
    works_on w ON p.Pnumber = w.Pno
GROUP BY 
    p.Pname
ORDER BY 
    NumeroDeEmpregados DESC;

-- 
CREATE VIEW EmpregadosComDependentesEStatusDeGerente AS
SELECT 
    e.Fname AS PrimeiroNome,
    e.Lname AS UltimoNome,
    CASE 
        WHEN d.Ssn IS NOT NULL THEN 'Sim' 
        ELSE 'Não' 
    END AS PossuiDependentes,
    CASE 
        WHEN mgr.Mgr_ssn IS NOT NULL THEN 'Sim' 
        ELSE 'Não' 
    END AS ÉGerente
FROM 
    employee e
LEFT JOIN 
    dependent d ON e.Ssn = d.Essn
LEFT JOIN 
    department mgr ON e.Ssn = mgr.Mgr_ssn;

# Definindo Permissões de Acesso
   
-- Criando o usuário gerente:   
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senhaGerente';

-- Dando permissões ao gerente:
GRANT SELECT ON database_name.employee TO 'gerente'@'localhost';
GRANT SELECT ON database_name.department TO 'gerente'@'localhost';

--Criando o usuário empregado:
CREATE USER 'empregado'@'localhost' IDENTIFIED BY 'senhaEmpregado';

-- Dando permissões ao empregado:
GRANT SELECT ON database_name.employee TO 'empregado'@'localhost';
REVOKE SELECT ON database_name.department FROM 'empregado'@'localhost';
 
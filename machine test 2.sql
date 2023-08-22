
CREATE TABLE manufacturer
( mfname VARCHAR(20),
 city VARCHAR(20),
 state VARCHAR(20)
 )
INSERT INTO manufacturer VALUES
('hp','kipling','south dakota'),
('dell','kipling','south dakota')

CREATE TABLE employee(
employeeid INT PRIMARY KEY IDENTITY,
empname VARCHAR(20),
phone INT ,
area_code INT,
email VARCHAR (20),
)
INSERT INTO employee(empname,area_code) VALUES
('michael',24),
('louis',678),
('stella',222)

CREATE TABLE computer
( serialnumber INT PRIMARY KEY IDENTITY ,
mfname VARCHAR(20),
model VARCHAR(20),
weight INT,
employeeid INT,
used VARCHAR(20),
CONSTRAINT c_fk1 FOREIGN KEY (employeeid) REFERENCES employee(employeeid),

)
INSERT INTO computer VALUES
('dell','x1',20,2,'using'),
('hp','x2',20,1,'not-used')
--q.1
SELECT mfname FROM manufacturer WHERE state='south dakota';
--q.2
SELECT AVG(weight) FROM computer;
--q.3

SELECT empname FROM employee WHERE area_code like '2%';
--q.4
SELECT serialnumber FROM computer WHERE weight in
( SELECT AVG(weight) FROM computer)
--Q.5
SELECT mfname FROM manufacturer WHERE mfname in (
SELECT mfname FROM computer WHERE used='using');

--q6
SELECT e.empname,c.serialnumber,m.city
FROM employee e join computer c ON e.employeeid=c.employeeid
join manufacturer m ON c.mfname=m.mfname

--q7

CREATE PROCEDURE pT
@empid INT
AS
BEGIN 
SELECT c.serialnumber,m.mfname,c.model,
 c.weight FROM computer c join employee e ON
    c.employeeid = e.employeeid join
	manufacturer m ON c.mfname=m.mfname
	WHERE e.employeeid=@empid
  END;
  
  EXEC pT @empid=1

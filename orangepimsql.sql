 # am creat o baza de date numita ORANGEHRM, si 3 tabele #
 


create database ORANGEHRM;
use ORANGEHRM;

create table Employees (EmployeeId int not null, 
FirstName varchar (250), 
LastName varchar (250), 
JobTitle varchar (250),
EmployementStatus varchar (100),
Salary int (100),
SubUnit varchar (100),
Supervisor varchar (250),
Primary key (EmployeeId));


create table Supervisor (SupervisorId int not null, 
FirstName varchar (25), 
LastName varchar (25), 
JobTitle varchar (25),
EmployementStatus varchar (100),
SubUnit varchar (1000),
EmployeeId int not null, 
Primary key (SupervisorId),
Foreign key (EmployeeId) references Employees (EmployeeId));

# stergem tabela Supervisor #

delete from Supervisor;


create table Memberships (EmployeeId int not null, 
memership varchar (200),
 SubscriptionPay varchar (200),
 SubscriptionAmount int (200),
 Currency varchar (10),
 Datestart date ,
 Dateend date ,
 Foreign key (EmployeeId) references Employees (EmployeeId));


 # inseram valori in tabelele create#
 
 insert into Employees (EmployeeId, FirstName, LastName, JobTitle, EmployementStatus, Salary, SubUnit, Supervisor ) 
 values 
 (01, "Popa", "Ion", "QALead", "FullTime", 5000, "Quality", "PopaIoana");
 
  insert into Employees (EmployeeId, FirstName, LastName, JobTitle, EmployementStatus, Salary, SubUnit, Supervisor ) 
 values 
 (02, "Cassidy", "Charter", "ItManager", "FullTime", 7000, "TechsOps", "OdisAdalwin"),
 (03, "Charlie", "Hope", "QaEnginner", "PartTime", 3000, "QualityAssurance", "KevinMathias"),
 (04, "Jordan", "Mathew", "FinanceManager", "FullTime", 8000, "Finance", "PeterAnderson"),
 (05, "Linda", "Anderson", "VPSales", "Freelance", 5000, "Administration", "JohnSmith");
 
 # verific introducerea de date in tabela #
 
 select * from Employees;
 
 Insert into Memberships (EmployeeId, memership, SubscriptionPay, SubscriptionAmount, Currency, Datestart, Dateend) values
 (01, "British Computer Scienty", "Company", "600", "USD", "2022-03-03", "2023-03-03");
 
 
 Insert into Memberships (EmployeeId, memership, SubscriptionPay, SubscriptionAmount, Currency, Datestart, Dateend) values
 (02, "CIM", "Individual", "300", "USD", "2022-01-01", "2023-01-01"),
 (03, "ACCA", "Individual", "300", "USD", "2023-01-01", "2023-06-06"),
 (04,"OxfordIT", "ICompany", "800", "GBP", "2021-01-01", "2024-01-01"),
 (05, "CIM", "Individual", "300", "USD", "2022-01-01", "2023-01-01");
 


 # verific introducerea de date in tabela #
 select * from Memberships;

# fac un update de nume, presupunand ca o persona s-a casatorit si si-a schimbat FirstName#

update Employees set FirstName="Jackson"  where EmployeeId=02;

#employees cu salariu mai mare de 6000#

Select * from Employees where Salary>6000;

#employees cu salariu mai mic de 6000#

Select * from Employees where Salary<6000;

#employees cu functia QaLead#

Select * from Employees where JobTitle="QaLead";

#memberships cu SubcriptionPay individual#

Select * from Memberships where  SubscriptionPay="Individual";

#memberships cu SubcriptionPay company#
Select * from Memberships where  SubscriptionPay="Company";


#memberships cu dataend in 2023-01-01#

 select * from Memberships where dateend= "2023-01-01";
 #adaug o coloana in tabela Employees cu data nasterii# 
 alter table Employees add column DateofBirth date;
 
 
 #adauga valori pentru coloana DateofBirth nou adaugata in tabela Employees#
 
update Employees set DateofBirth="1957-09-11"  where EmployeeId=01;
update Employees set DateofBirth="1987-01-30"  where EmployeeId=02;
update Employees set DateofBirth="1986-12-11"  where EmployeeId=03;
update Employees set DateofBirth="1977-12-30"  where EmployeeId=04;
update Employees set DateofBirth="1990-07-11"  where EmployeeId=05;
#verific noile update-uri# 
select * from Employees;

#fac actualizare de FirstName pentru ca am gresit sintaxa prima data, si s-au efectuat modificarile. uneori mai facem greseli pe care trebuie sa le corectam, deci e un exercitiu in plus# 

update Employees set FirstName="Cassidy"  where EmployeeId=02; 
update Employees set FirstName="Jackson"  where EmployeeId=03; 
update Employees set FirstName="Jordan"  where EmployeeId=04; 
update Employees set FirstName="Linda"  where EmployeeId=05; 
select * from Employees;

#employees cu dataofbirth mai mare de 1985#
select * from Employees where DateofBirth > "1985-01-01" ;

select * from Employees where DateofBirth > "1985-01-01"  and FirstName="Cassidy";
#employees cu salariu maxim#
select max(salary) from Employees where EmployeeId=02;

#vom ordona employees crescator# 

select FirstName from Employees order by FirstName asc;

#vom ordona employees descrescator#

select FirstName from Employees order by FirstName desc;


#sterg tabela Memberships, deoarece am gresit la definirea cheii secundare, i# 
drop table Memberships;

#creez o tabela EmergencyContacts, pentru a putea realiza join-uri#

create table EmergencyContacts (
EmergencyContactID int not null, 
Name varchar (50),
Relationship varchar (50),
MobilePhone int, 
EmployeeId int not null,
primary key (EmergencyContactID),
foreign key (EmployeeId)  REFERENCES Employees (EmployeeId));

##     =     ""  ;
#adaug valori tabelei nou create EmercencyContacts#

Insert into EmergencyContacts (EmergencyContactID, 
Name,
Relationship,
MobilePhone , 
EmployeeId ) values
 (001, "PopaMarcel" , "frate",  0754557655, 01);

Insert into EmergencyContacts (EmergencyContactID, 
Name,
Relationship,
MobilePhone , 
EmployeeId ) values
 (02, "JohnSmither" , "sora",  0045075455, 02),
 (03,"KattyPerry" , "matusa",0039214587,03),
 (04, "CharlizeTheron" ,"sotie", 00451234,04 ),
  (05, "BobMarley" ,"unchi", 00450934,05 );
  
 select * from EmergencyContacts;
 
 ##
 select FirstName, LastName from Employees inner join EmergencyContacts on Employees.EmployeeID=EmergencyContacts.EmployeeId;
 select FirstName, LastName from Employees full  join EmergencyContacts on Employees.EmployeeID=EmergencyContacts.EmployeeId order by FirstName Asc;
 
 
create database SQL_Project;
use SQL_Project;

------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table Customers_tb;
CREATE TABLE Customers_tb (Customer_ID INT PRIMARY KEY,Name VARCHAR(30) NOT NULL,Email VARCHAR(30) UNIQUE,
							Phone_Number bigint,City varchar(30),Date_of_Birth DATE);
					
INSERT INTO Customers_tb (Customer_ID, Name, Email, Phone_Number, City, Date_of_Birth) VALUES
(1, 'Amit Sharma', 'amitsharma@gmail.com', '9876543210', 'Mumbai', '1990-05-14'),
(2, 'Priya Verma', 'priyaverma@gmail.com', '7465321470', 'Hyderabad', '1985-07-22'),
(3, 'Ravi Kumar', 'ravikumar@gmail.com', '8756234789', 'Bengaluru', '1992-09-10'),
(4, 'Neha Joshi', 'nehajoshi@gmail.com', '8945123678', 'Mumbai', '1995-01-30'),
(5, 'Rahul Singh', 'rahulsingh@gmail.com', '9934765120', 'Chennai', '1988-12-25'),
(6, 'Sneha Patil', 'snehapatil@gmail.com', '9023456789', 'Hyderabad', '1993-04-18'),
(7, 'Arun Mehta', 'arunmehta@gmail.com', '9712345678', 'Bengaluru', '1980-08-05'),
(8, 'Pooja Desai', 'poojadesai@gmail.com', '7007654321', 'Hyderabad', '1996-06-12'),
(9, 'Vikas Gupta', 'vikasgupta@gmail.com', '8798543210', 'Bengaluru', '1983-11-08'),
(10, 'Kiran Rao', 'kiranrao@gmail.com', '9589632145', 'Hyderabad', '1991-03-15');

select * from Customers_tb;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table Accounts_tb;
CREATE TABLE Accounts_tb (Account_ID INT PRIMARY KEY,Customer_ID INT,Account_Type VARCHAR(30),Balance DECIMAL(15,2),
							Open_Date DATE,Status1 VARCHAR(20),FOREIGN KEY (Customer_ID) REFERENCES Customers_tb(Customer_ID));
                            
INSERT INTO  Accounts_tb(Account_ID, Customer_ID, Account_Type, Balance, Open_Date, Status1) VALUES
(101, 1, 'Savings', 50000.00, '2015-08-10', 'Active'),
(102, 2, 'Current', 150000.00, '2017-04-22', 'Inactive'),
(103, 3, 'Savings', 70000.00, '2018-01-15', 'Active'),
(104, 4, 'Fixed Deposit', 200000.00, '2020-06-25', 'Active'),
(105, 5, 'Savings', 80000.00, '2019-03-18', 'Active'),
(106, 6, 'Current', 90000.00, '2021-02-10', 'Inactive'),
(107, 7, 'Savings', 60000.00, '2016-11-12', 'Active'),
(108, 8, 'Fixed Deposit', 250000.00, '2022-07-01', 'Inactive'),
(109, 9, 'Savings', 5500.00, '2019-09-25', 'Inactive'),
(110, 10, 'Current', 175000.00, '2018-12-30', 'Active');

select * from Accounts_tb;						
--------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Transactions_tb (Transaction_ID INT PRIMARY KEY,Account_ID INT,Transaction_Type VARCHAR(30),Amount DECIMAL(15,2),
    Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP,Mode VARCHAR(30),FOREIGN KEY (Account_ID) REFERENCES Accounts_tb(Account_ID));
    
INSERT INTO Transactions_tb (Transaction_ID, Account_ID, Transaction_Type, Amount, Transaction_Date, Mode) VALUES
(201, 101, 'Deposit', 20000.00, '2025-01-10 10:15:00', 'Online'),
(202, 102, 'Withdrawal', 5000.00, '2025-01-12 12:30:00', 'ATM'),
(203, 103, 'Deposit', 10000.00, '2025-01-14 14:00:00', 'Online'),
(204, 104, 'Withdrawal', 7000.00, '2025-01-15 16:20:00', 'Branch'),
(205, 105, 'Deposit', 30000.00, '2025-01-16 18:45:00', 'Online'),
(206, 106, 'Withdrawal', 4000.00, '2025-01-17 09:10:00', 'ATM'),
(207, 107, 'Deposit', 15000.00, '2025-01-18 11:30:00', 'Cheque'),
(208, 108, 'Withdrawal', 10000.00, '2025-01-19 14:45:00', 'Branch'),
(209, 109, 'Deposit', 5000.00, '2025-01-20 16:50:00', 'Online'),
(210, 110, 'Withdrawal', 6000.00, '2025-01-21 19:00:00', 'ATM');

select * from Transactions_tb;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table Loans_tb;
CREATE TABLE Loans_tb (Loan_ID INT PRIMARY KEY,Customer_ID INT,Loan_Type VARCHAR(30),Loan_Amount DECIMAL(15,2),
    Interest_Rate DECIMAL(5,2),Tenure BIGINT,Status2 VARCHAR(20),FOREIGN KEY (Customer_ID) REFERENCES Customers_tb(Customer_ID));

INSERT INTO Loans_tb (Loan_ID, Customer_ID, Loan_Type, Loan_Amount, Interest_Rate, Tenure, Status2) VALUES
(301, 1, 'Home Loan', 5000000.00, 7.5, 240, 'Active'),
(302, 2, 'Car Loan', 800000.00, 9.0, 60, 'Active'),
(303, 3, 'Personal Loan', 300000.00, 11.5, 36, 'Inactive'),
(304, 4, 'Education Loan', 1000000.00, 8.5, 120, 'Closed'),
(305, 5, 'Gold Loan', 200000.00, 10.0, 24, 'Inactive'),
(306, 6, 'Business Loan', 1500000.00, 12.5, 180, 'Active'),
(307, 7, 'Home Loan', 4500000.00, 7.2, 240, 'Inactive'),
(308, 8, 'Car Loan', 750000.00, 8.9, 60, 'Active'),
(309, 9, 'Personal Loan', 500000.00, 10.5, 48, 'Closed'),
(310, 10, 'Education Loan', 1200000.00, 8.0, 120, 'Active');

select * from Loans_tb;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table CreditCard_tb;
CREATE TABLE CreditCard_tb (Card_ID INT PRIMARY KEY,Customer_ID INT,Card_Type VARCHAR(30),Credit_Limit DECIMAL(15,2),
    Expiry_Date DATE,CVV INT,Status3 VARCHAR(20),FOREIGN KEY (Customer_ID) REFERENCES Customers_tb(Customer_ID));
    
INSERT INTO CreditCard_tb (Card_ID, Customer_ID, Card_Type, Credit_Limit, Expiry_Date, CVV, Status3) VALUES
(401, 1, 'Visa', 100000.00, '2028-12-01', 123, 'Active'),
(402, 2, 'MasterCard', 200000.00, '2027-06-15', 456, 'Risk'),
(403, 3, 'RuPay', 150000.00, '2026-09-30', 789, 'Active'),
(404, 4, 'MasterCard', 250000.00, '2025-11-20', 321, 'Active'),
(405, 5, 'Visa', 120000.00, '2029-05-10', 654, 'Active'),
(406, 6, 'MasterCard', 180000.00, '2026-07-25', 987, 'Risk'),
(407, 7, 'Visa', 220000.00, '2027-02-28', 159, 'Active'),
(408, 8, 'MasterCard', 175000.00, '2028-08-18', 753, 'Risk'),
(409, 9, 'RuPay', 130000.00, '2025-04-05', 951, 'Risk'),
(410, 10, 'MasterCard', 190000.00, '2029-10-12',357,'Active');

select * from CreditCard_tb;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
show tables;



SELECT City, COUNT(*) AS Total_Customers FROM Customers_tb GROUP BY City;      #1

SELECT * FROM Accounts_tb WHERE Status1 = 'Inactive';                          #2

SELECT c.Name, a.Balance 
FROM Customers_tb c
JOIN Accounts_tb a ON c.Customer_ID = a.Customer_ID;                           #3

SELECT Account_Type, SUM(Balance) AS Total_Balance FROM Accounts_tb GROUP BY Account_Type;   #4

SELECT Loan_Type, SUM(Loan_Amount) AS Total_Loan_Amount 
FROM Loans_tb GROUP BY Loan_Type;                                      #5

SELECT Loan_Type, Interest_Rate FROM Loans_tb 
WHERE Interest_Rate = (SELECT MAX(Interest_Rate) FROM Loans_tb)         #6
   or Interest_Rate = (SELECT MIN(Interest_Rate) FROM Loans_tb);


SELECT c.Name, l.Loan_Type, l.Loan_Amount, l.Status2 
FROM Customers_tb c 
JOIN Loans_tb l ON c.Customer_ID = l.Customer_ID                      #7
WHERE l.Status2 = 'Active';

SELECT c.Name, l.Loan_Type, l.Loan_Amount, l.Status2 
FROM Customers_tb c 
JOIN Loans_tb l ON c.Customer_ID = l.Customer_ID                     #8
WHERE l.Status2 = 'Inactive';

SELECT c.Name, l.Loan_Type, l.Loan_Amount, l.Status2 
FROM Customers_tb c 
JOIN Loans_tb l ON c.Customer_ID = l.Customer_ID                     #9
WHERE l.Status2 = 'Closed';

SELECT c.Name, cc.Card_Type, cc.Status3 
FROM Customers_tb c
JOIN CreditCard_tb cc ON c.Customer_ID = cc.Customer_ID              #10
WHERE cc.Status3 = 'Risk';                                              

SELECT c.Name, cc.Credit_Limit 
FROM Customers_tb c 
JOIN CreditCard_tb cc ON c.Customer_ID = cc.Customer_ID              #11
ORDER BY cc.Credit_Limit DESC limit 1;

SELECT c.Name, a.Status1 AS Account_Status, l.Status2 AS Loan_Status
FROM Customers_tb c
JOIN Accounts_tb a ON c.Customer_ID = a.Customer_ID                    #12
JOIN Loans_tb l ON c.Customer_ID = l.Customer_ID
WHERE a.Status1 = 'Active' AND l.Status2 = 'Active';


SELECT c.Name, SUM(a.Balance) AS Total_Balance 
FROM Customers_tb c
JOIN Accounts_tb a ON c.Customer_ID = a.Customer_ID                   #13
GROUP BY c.Name
HAVING Total_Balance > 100000;

SELECT c.Name 
FROM Customers_tb c
JOIN CreditCard_tb cc ON c.Customer_ID = cc.Customer_ID
JOIN Accounts_tb a ON c.Customer_ID = a.Customer_ID                   #14
WHERE cc.Status3 = 'Risk' AND a.Status1 = 'Inactive';

SELECT c.Customer_ID, c.Name, t.Transaction_ID, t.Amount, t.Transaction_Type 
FROM Customers_tb c
JOIN Accounts_tb a ON c.Customer_ID = a.Customer_ID                   #15
JOIN Transactions_tb t ON a.Account_ID = t.Account_ID
WHERE t.Amount > 50000;







CREATE DATABASE Project_1;
USE Project_1;
CREATE TABLE Employee_Details(
			Emp_ID INT(5),
            Emp_NAME VARCHAR(30),
            Emp_BRANCH VARCHAR(15),
            Emp_DESIGNATION VARCHAR(40),
            Emp_ADDR VARCHAR(100),
            Emp_CONT_NO VARCHAR(10),
            PRIMARY KEY (Emp_ID));
DESCRIBE Employee_Details;
SELECT * FROM Employee_details;

CREATE TABLE Membership(
				M_ID INT PRIMARY KEY,
                START_DATE TEXT,
                END_DATE TEXT
                );
DESCRIBE membership;
SELECT * FROM membership;

CREATE TABLE Customer(
				Cust_ID INT(4) PRIMARY KEY,
                Cust_NAME VARCHAR(30),
                Cust_EMAIL_ID VARCHAR(50),
                Cust_CONT_NO VARCHAR(10),
                Cust_ADDR VARCHAR(100),
                Cust_TYPE VARCHAR(30),
                Membership_M_ID INT,
                FOREIGN KEY(Membership_M_ID) REFERENCES Membership(M_ID));
DESCRIBE customer;
SELECT * FROM customer;

CREATE TABLE Payment_Details(
			PAYMENT_ID VARCHAR(40) UNIQUE KEY,
            AMOUNT INT,
            PAYMENT_STATUS VARCHAR(10),
            PAYMENT_MODE VARCHAR(25),
            Shipment_SH_ID VARCHAR(6),
            Shipment_Client_C_ID INT(4),
            FOREIGN KEY(Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
            FOREIGN KEY(Shipment_Client_C_ID) REFERENCES Customer(Cust_ID));
ALTER TABLE Payment_Details ADD COLUMN PAYMENT_DATE TEXT AFTER PAYMENT_STATUS;
DESCRIBE PAYMENT_DETAILS;
SELECT * FROM Payment_Details;
            
CREATE TABLE Shipment_Details(
			SD_ID VARCHAR(6) PRIMARY KEY,
            SD_CONTENT VARCHAR(40),
            SD_DOMAIN VARCHAR(15),
            SD_TYPE VARCHAR(15),
            SD_WEIGHT VARCHAR(10),
            SD_CHARGES INT(10),
            SD_ADDR VARCHAR(100),
            DS_ADDR VARCHAR(100),
            Customer_Cust_ID INT(4),
            FOREIGN KEY(Customer_Cust_ID) REFERENCES Customer(Cust_ID));
DESCRIBE SHIPMENT_DETAILS;
SELECT * FROM Shipment_Details;

CREATE TABLE Status(
			CURRENT_ST VARCHAR(15),
            SENT_DATE TEXT,
            DELIVERY_DATE TEXT,
            SH_ID VARCHAR(6) PRIMARY KEY);
DESCRIBE STATUS;
SELECT * FROM Status;

CREATE TABLE EMPLOYEE_MANAGES_SHIPMENT(
			Employee_E_ID INT(5),
            Shipment_SH_ID VARCHAR(6),
            Status_SH_ID VARCHAR(6),
            FOREIGN KEY(Employee_E_ID) REFERENCES Employee_Details(Emp_ID),
			FOREIGN KEY(Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
			FOREIGN KEY(Status_SH_ID) REFERENCES Status(SH_ID));
DESCRIBE EMPLOYEE_MANAGES_SHIPMENT;
SELECT * FROM EMPLOYEE_MANAGES_SHIPMENT;


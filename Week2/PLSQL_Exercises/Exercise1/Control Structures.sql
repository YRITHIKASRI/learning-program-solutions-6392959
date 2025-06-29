------------------------------------------------------
-- Drop tables if they exist
------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE LOANS CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CUSTOMERS CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

------------------------------------------------------
-- Create CUSTOMERS table
------------------------------------------------------

CREATE TABLE CUSTOMERS (
    CUSTOMERID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    DOB DATE,
    BALANCE NUMBER,
    LASTMODIFIED DATE,
    ISVIP VARCHAR2(1)
);
/

------------------------------------------------------
-- Create LOANS table
------------------------------------------------------

CREATE TABLE LOANS (
    LOANID NUMBER PRIMARY KEY,
    CUSTOMERID NUMBER,
    LOANAMOUNT NUMBER,
    INTERESTRATE NUMBER,
    STARTDATE DATE,
    ENDDATE DATE,
    FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);
/

------------------------------------------------------
-- Insert data into CUSTOMERS
------------------------------------------------------

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (1, 'John Doe', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1000, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 1500, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (3, 'Michael Brown', TO_DATE('1952-12-10', 'YYYY-MM-DD'), 12000, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (4, 'Emily Johnson', TO_DATE('1975-03-08', 'YYYY-MM-DD'), 8000, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (5, 'William Davis', TO_DATE('1948-11-22', 'YYYY-MM-DD'), 22000, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (6, 'Sophia Wilson', TO_DATE('1961-04-30', 'YYYY-MM-DD'), 9500, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (7, 'James Miller', TO_DATE('2000-01-14', 'YYYY-MM-DD'), 400, SYSDATE, 'N');

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED, ISVIP)
VALUES (8, 'Olivia Martinez', TO_DATE('1988-09-26', 'YYYY-MM-DD'), 13000, SYSDATE, 'N');

------------------------------------------------------
-- Insert data into LOANS
------------------------------------------------------

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 60));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (2, 2, 10000, 4.5, SYSDATE, ADD_MONTHS(SYSDATE, 36));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (3, 3, 20000, 6, SYSDATE, ADD_MONTHS(SYSDATE, 24));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (4, 4, 8000, 4, SYSDATE, ADD_MONTHS(SYSDATE, 48));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (5, 5, 15000, 5.5, SYSDATE, ADD_MONTHS(SYSDATE, 12));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (6, 6, 7000, 4.2, SYSDATE, ADD_MONTHS(SYSDATE, 30));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (7, 7, 2500, 6.8, SYSDATE, ADD_MONTHS(SYSDATE, 18));

INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
VALUES (8, 8, 12000, 3.9, SYSDATE, ADD_MONTHS(SYSDATE, 72));

COMMIT;
/

------------------------------------------------------
-- Scenario 1: Apply interest rate discount for >60 years
------------------------------------------------------

SET SERVEROUTPUT ON;

BEGIN
    FOR cust_rec IN (
        SELECT CUSTOMERID,
               TRUNC(MONTHS_BETWEEN(SYSDATE, DOB)/12) AS AGE
        FROM CUSTOMERS
    ) LOOP
        IF cust_rec.AGE > 60 THEN
            UPDATE LOANS
               SET INTERESTRATE = INTERESTRATE - 1
             WHERE CUSTOMERID = cust_rec.CUSTOMERID;

            DBMS_OUTPUT.PUT_LINE(
                'Applied 1% discount for Customer ID: ' || cust_rec.CUSTOMERID
            );
        END IF;
    END LOOP;

    COMMIT;
END;
/

------------------------------------------------------
-- Scenario 2: Promote customers to VIP if balance > 10,000
------------------------------------------------------

BEGIN
    FOR cust_rec IN (
        SELECT CUSTOMERID, BALANCE
        FROM CUSTOMERS
    ) LOOP
        IF cust_rec.BALANCE > 10000 THEN
            UPDATE CUSTOMERS
               SET ISVIP = 'Y'
             WHERE CUSTOMERID = cust_rec.CUSTOMERID;

            DBMS_OUTPUT.PUT_LINE(
                'Customer ID ' || cust_rec.CUSTOMERID || ' promoted to VIP.'
            );
        END IF;
    END LOOP;

    COMMIT;
END;
/

------------------------------------------------------
-- Display results
------------------------------------------------------

SELECT * FROM CUSTOMERS;

SELECT * FROM LOANS;










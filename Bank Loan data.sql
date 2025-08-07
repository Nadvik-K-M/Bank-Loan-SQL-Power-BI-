select * from Bank_Loan_Data;

--NUMBER OF LOAN APPLICATIONS

SELECT COUNT(id) AS Total_Loan_Applications FROM Bank_Loan_Data;

SELECT COUNT(id) AS MTD_Total_Loan_Applications
FROM Bank_Loan_Data
WHERE MONTH(issue_date) =12 AND YEAR(issue_date) = 2021;


SELECT COUNT(id) AS PMTD_Total_Loan_Applications 
FROM Bank_Loan_Data
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) = 2021;

SELECT COUNT(id) AS MOM_Total_Loan_Applications 
FROM Bank_Loan_Data
WHERE MONTH(issue_date) BETWEEN 1 AND 12 AND YEAR(issue_date) = 2021;

--TOTAL LOAN AMOUNT

SELECT SUM(loan_amount) AS Total_Loan_Amount FROM Bank_Loan_Data;

SELECT SUM(loan_amount) AS MTD_Total_Loan_Amount 
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) AS PMTD_Total_Loan_Amount FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--TOTAL AMOUNT RECIVED
SELECT SUM(total_payment) MTD_Total_Amount_Recived 
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) PMTD_Total_Amount_Recived 
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--Avg Interest Rate
SELECT ROUND(AVG(int_rate)*100,2) AS Avg_Interest_Rate from Bank_Loan_Data;

SELECT ROUND(AVG(int_rate)*100,2) AS Avg_Interest_Rate 
from Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

--GOOD LOAN	
SELECT 
(COUNT( CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
/
COUNT(id) AS Good_Loan_Percentage
FROM Bank_Loan_Data;

--GOOD LOAN APPLICATIONS
SELECT COUNT(loan_status) AS Good_Loan_Applications 
FROM Bank_Loan_Data
WHERE loan_status = 'Fully Paid' OR loan_status ='Current';

SELECT SUM(loan_amount) AS Good_Loan_Sum_Amount 
FROM Bank_Loan_Data
WHERE loan_status = 'Fully Paid' OR loan_status ='Current';

SELECT SUM(total_payment) AS Good_Loan_Total_Payment 
FROM Bank_Loan_Data
WHERE loan_status = 'Fully Paid' OR loan_status ='Current';

SELECT * FROM Bank_Loan_Data;

--BAD LOANS
SELECT (
COUNT(CASE WHEN loan_status = 'Charged off' THEN id END)*100)
/
COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Loan_Data;

SELECT COUNT(id) AS Bad_Loan_Applications 
FROM Bank_Loan_Data
WHERE loan_status = 'Charged off';

SELECT SUM(loan_amount) AS Bad_Loan_Sum_Amount 
FROM Bank_Loan_Data
WHERE loan_status = 'Charged off';

SELECT SUM(total_payment) AS Bad_Loan_Amount_Recived 
FROM Bank_Loan_Data
WHERE loan_status = 'Charged off';


--ALL VALUES IN GRID VIEW
SELECT 
	loan_status,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Payment_recieved,
	SUM(loan_amount) AS Total_Funded_Amont,
	ROUND(AVG(int_rate * 100),2) AS Interest_Rate,
	ROUND(AVG(dti * 100),2) AS DTI
	FROM 
	Bank_Loan_Data
	GROUP BY loan_status;

SELECT 
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Recieved,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;

--ADDRESS STATE
SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recieved_Amount
FROM Bank_Loan_Data
GROUP BY address_state
ORDER BY COUNT(id) DESC;

-- TERM
SELECT 
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recieved_Amount
FROM Bank_Loan_Data	
GROUP BY term
ORDER BY term;

-- BANK EMPLOYEES WORKING EXPERIENCE AND THEIR ASSIGN APPLICATIONS 
SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recieved_Amount
FROM Bank_Loan_Data
GROUP BY emp_length
ORDER BY emp_length;

--PURPOSE OF THE LOANS
SELECT 
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recieved_Amount
FROM Bank_Loan_Data
GROUP BY purpose
ORDER BY COUNT(id) DESC;

--CALCATIONS OF HOME OWNER SHIP
SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recieved_Amount
FROM Bank_Loan_Data
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;

SELECT * FROM Bank_Loan_Data;







SELECT count(*) FROM loan_data;    #Total Number of Rows in the Table
SELECT * FROM loan_data;           #Entire Table
 
-- KPI 1 --
SELECT ROUND(SUM(Funded_Amount), 2) AS Total_Loan_Amount_Funded 
FROM loan_data WHERE Account_ID IS NOT NULL;   
 
-- KPI 2 --
SELECT COUNT(distinct Account_ID) AS Total_Loans FROM loan_data;  
 
-- KPI 3 --
SELECT round(sum(Total_Rec_Prncp + Total_Rrec_int), 2) AS Total_Collection FROM loan_data;
 
-- KPI 4 --
SELECT round(sum(Total_Rrec_int), 2) AS Total_Interest FROM loan_data;

-- KPI 5 --
SELECT 
Branch_Name, round(sum(Total_Rrec_int), 2) AS Total_Interest,
		     round(sum(Total_Fees), 2) AS Total_Fees,
			round(SUM(Total_Rrec_int + Total_Fees), 2) AS Total_Revenue
FROM loan_data
GROUP BY Branch_Name
ORDER BY Total_Revenue DESC;

-- KPI 6 --
SELECT 
State_Name, Round(sum(Funded_Amount), 2) as Total_Funded_Amount
FROM loan_data 
GROUP BY State_Name
ORDER BY Total_Funded_Amount DESC; 
 
-- KPI 7 --
SELECT 
Religion, Round(sum(Funded_Amount), 2) as Total_Funded_Amount
FROM loan_data 
GROUP BY Religion
ORDER BY Total_Funded_Amount DESC; 

-- KPI 8 --

SELECT 
Product_Code, Round(sum(Funded_Amount), 2) as Total_Funded_Amount
FROM loan_data 
GROUP BY Product_Code
ORDER BY Total_Funded_Amount DESC; 
 
-- KPI 9 -- 
SELECT 
     Disbursement_Date AS Disbursement_Year, 
     Round(sum(Funded_Amount), 2) as Total_Funded_Amount
FROM loan_data 
GROUP BY Disbursement_Date
ORDER BY Total_Funded_Amount DESC;  

-- KPI 10 -- 
SELECT 
Grrade, Round(sum(Funded_Amount), 2) as Total_Funded_Amount
FROM loan_data 
GROUP BY Grrade
ORDER BY Total_Funded_Amount DESC; 

-- KPI 11 -- 
SELECT 
count(distinct Account_ID) AS Count_of_Default_Loan FROM loan_data
WHERE Is_Default_Loan = "Y"; 

-- KPI 12 -- 
SELECT 
count(distinct Account_ID) AS Count_of_Delinqunet_Client FROM loan_data
WHERE Is_Delinquent_Loan = "Y"; 

-- KPI 13 --
SELECT 
Round(count(CASE WHEN Is_Delinquent_Loan = "Y" THEN Account_ID END) * 100
/Count(DISTINCT Account_ID), 2) AS Delinquent_Loan_Rate
FROM loan_data;

-- KPI 14 --
SELECT
Round(count(CASE WHEN Is_Default_Loan ="Y" THEN Account_ID END) * 100
/Count(DISTINCT Account_ID), 2) AS Default_Loan_Rate
FROM loan_data;

-- KPI 15 --
SELECT 
Loan_Status, round(Sum(Funded_Amount), 2) AS Total_Amount_Fund
FROM loan_data
GROUP BY Loan_Status
ORDER BY Total_Amount_Fund DESC; 

-- KPI 16 --
SELECT 
Age, ROUND(SUM(Funded_Amount), 2) AS Total_Amount_Fund
FROM loan_data
GROUP BY Age
ORDER BY Total_Amount_Fund DESC;

-- KPI 17 --
SELECT
Count(DISTINCT Account_ID) AS No_Verified_Loan
FROM loan_data WHERE Verification_Status = "Not Verified"; 

-- KPI 18 --
SELECT 
Term_in_month, ROUND(Count(Account_ID), 2) AS Total_Term
FROM loan_data
GROUP BY Term_in_month
ORDER BY Total_Term DESC;



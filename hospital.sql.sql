
--CREATE the TABLE 

CREATE TABLE Hospital(
Hospital_Name VARCHAR(100) NOT NULL,
Location  VARCHAR(50),
Department VARCHAR(50),
Doctors_Count INT,
Patients_Count NUMERIC(10,2),
Admission_Date DATE,
Discharge_Date  DATE,
Medical_Expenses NUMERIC (18,2)

);


DROP TABLE IF Exists Hospital;

        SELECT*FROM Hospital;

--1. Total Number of Patients
     SELECT SUM(Patients_Count) AS Total_Patients
	 FROM Hospital;

--2. Average Number of Doctors per Hospital
      SELECT AVG(doctors_count) AS per_Hospital
	  FROM Hospital; 

--3. Top 3 Departments with the Highest Number of Patients
      SELECT department,patients_count FROM Hospital
	  ORDER BY patients_count DESC 
	  LIMIT 3;

--4. Hospital with the Maximum Medical Expenses
      SELECT hospital_name,medical_expenses FROM Hospital
	  WHERE medical_expenses = (SELECT MAX(medical_expenses) 
	  FROM Hospital);
	
--5. Daily Average Medical Expenses
     SELECT admission_date,AVG(medical_expenses) AS Daily_Medical_Expenses
	 FROM Hospital 
	 GROUP BY admission_date
	 ORDER BY admission_date;

--6. Longest Hospital Stay
     SELECT hospital_name, (admission_date - discharge_date) AS Longest_Stay
	 FROM Hospital ORDER BY Longest_stay DESC LIMIT 1;

--7. Total Patients Treated Per City
      SELECT location,SUM(patients_count) AS total_patients
	  FROM Hospital
	  GROUP BY location;

--8. Average Length of Stay Per Department

	   SELECT department, AVG(discharge_date-admission_date)AS Stay_days
	   FROM Hospital GROUP BY department;

--9. Identify the Department with the Lowest Number of Patients


            			SELECT department,SUM(patients_count) AS Lowest_NUMBER
						 FROM Hospital
						 GROUP BY department
						ORDER BY Lowest_NUMBER ASC LIMIT 1;

--10. Monthly Medical Expenses Report

     SELECT TO_CHAR(admission_date,'YYYY-MM')AS Month,
	 SUM(medical_expenses) AS monthly_medical_expenses
	 FROM Hospital
	 GROUP BY TO_CHAR(admission_date,'YYYY-MM') 
	 ORDER BY month;
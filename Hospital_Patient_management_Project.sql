

-- Basic Level Questions:

-- 1. Retrieve the names and genders of all patients.
SELECT patient_name, gender
FROM Patients;

-- 2. List the unique diagnoses recorded in the medical records.

SELECT DISTINCT diagnosis
FROM MedicalRecords;

-- 3. Count the total number of patients in the database.

SELECT COUNT(*) AS total_patients
FROM Patients;

-- 4. Find the oldest patient in the database.

SELECT patient_name, date_of_birth
FROM Patients
ORDER BY date_of_birth
LIMIT 1;

-- 5. Display the address and phone number of patient with ID 7.

SELECT address, phone_number
FROM Patients
WHERE patient_id = 7;

-- 6. Retrieve the names and specializations of all doctors.
SELECT doctor_name, specialization
FROM Doctors;

-- 7. Calculate the average length of hospital stay for all patients.

SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM MedicalRecords;

-- 8. Count the number of male and female patients separately.

SELECT gender, COUNT(*) AS total_count
FROM Patients
GROUP BY gender;

-- 9. Find the doctor who treated the most patients.

SELECT doctor_id, COUNT(*) AS patient_count
FROM MedicalRecords
GROUP BY doctor_id
ORDER BY patient_count DESC
LIMIT 1;

-- 10. List all patients whose names start with 'J'.
SELECT *
FROM Patients
WHERE patient_name LIKE 'J%';


-- 11. Retrieve the names of patients along with their admission and discharge dates.

SELECT p.patient_name, m.admission_date, m.discharge_date
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id;

-- 12. Calculate the total number of medical records in the database.
SELECT COUNT(*) AS total_medical_records
FROM MedicalRecords;

-- 13. List the patients who were diagnosed with hypertension or diabetes.
SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
WHERE m.diagnosis IN ('Hypertension', 'Diabetes');

select * from MedicalRecords;

-- 14. Find the average age of patients in the database.
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(date_of_birth)) AS avg_age
FROM Patients;

-- 15. Display the doctors who treated patients admitted in January 2023.
SELECT DISTINCT d.*
FROM Doctors d
INNER JOIN MedicalRecords m ON d.doctor_id = m.doctor_id
WHERE YEAR(m.admission_date) = 2023 AND MONTH(m.admission_date) = 1;

-- 16. Calculate the total number of patients treated by each doctor.
SELECT doctor_id, COUNT(*) AS total_patients_treated
FROM MedicalRecords
GROUP BY doctor_id;

-- 17. List the patients who were treated by doctors specializing in Cardiology.

SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
INNER JOIN Doctors d ON m.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiology';

SELECT * FROM MedicalRecords;
SELECT * FROM Doctors;
SELECT * FROM Patients;

-- 18. Find the patient with the longest hospital stay duration.
SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
ORDER BY DATEDIFF(m.discharge_date, m.admission_date) DESC
LIMIT 1;

-- 19. Display the top 5 most common diagnoses recorded in the medical records.

SELECT diagnosis, COUNT(*) AS diagnosis_count
FROM MedicalRecords
GROUP BY diagnosis
ORDER BY diagnosis_count DESC
LIMIT 5;

-- 20. List the patients who were treated by doctors with names starting with 'Dr. S'.
SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
INNER JOIN Doctors d ON m.doctor_id = d.doctor_id
WHERE d.doctor_name LIKE 'Dr. S%';

-- 21. Calculate the percentage of male and female patients in the database.
SELECT 
    gender,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patients) AS percentage
FROM 
    Patients
GROUP BY 
    gender;
    
SELECT * FROM Patients;

-- 22. Find the patient with the highest number of medical records.

SELECT 
    patient_id,
    COUNT(*) AS record_count
FROM 
    MedicalRecords
GROUP BY 
    patient_id
ORDER BY 
    record_count DESC
LIMIT 1;

-- 23. List the top 3 doctors who treated the most patients.

SELECT 
    doctor_id,
    COUNT(*) AS patient_count
FROM 
    MedicalRecords
GROUP BY 
    doctor_id
ORDER BY 
    patient_count DESC
LIMIT 3;

-- 24. Calculate the average length of hospital stay for each diagnosis.
SELECT 
    diagnosis,
    AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM 
    MedicalRecords
GROUP BY 
    diagnosis;

-- 25. Rank patients based on the number of medical records they have, from highest to lowest.
SELECT 
    patient_id,
    COUNT(*) AS record_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS record_rank
FROM 
    MedicalRecords
GROUP BY 
    patient_id;
    
-- 26. Display the patient who spent the most time in the hospital.
SELECT 
    p.patient_id,
    p.patient_name,
    DATEDIFF(MAX(m.discharge_date), MIN(m.admission_date)) AS total_days
FROM 
    Patients p
JOIN 
    MedicalRecords m ON p.patient_id = m.patient_id
GROUP BY 
    p.patient_id, p.patient_name
ORDER BY 
    total_days DESC
LIMIT 1;

-- 27. List the patients who were treated by doctors specializing in Cardiology or Pulmonology.

SELECT 
    p.*
FROM 
    Patients p
JOIN 
    MedicalRecords m ON p.patient_id = m.patient_id
JOIN 
    Doctors d ON m.doctor_id = d.doctor_id
WHERE 
    d.specialization IN ('Cardiology', 'Pulmonology');

-- 28. Find the doctor who treated the most patients diagnosed with Diabetes.
SELECT 
    m.doctor_id,
    d.doctor_name,
    COUNT(*) AS diabetes_patients
FROM 
    MedicalRecords m
JOIN 
    Doctors d ON m.doctor_id = d.doctor_id
WHERE 
    m.diagnosis = 'Diabetes'
GROUP BY 
    m.doctor_id, d.doctor_name
ORDER BY 
    diabetes_patients DESC
LIMIT 1;

-- 29. Calculate the total number of patients treated by each doctor, including those with no patients.
SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(m.patient_id) AS patient_count
FROM 
    Doctors d
LEFT JOIN 
    MedicalRecords m ON d.doctor_id = m.doctor_id
GROUP BY 
    d.doctor_id, d.doctor_name;

-- Recreate a dataset for the next questions

INSERT INTO MedicalRecords (record_id, patient_id, admission_date, discharge_date, diagnosis, treatment, doctor_id) VALUES
(121, 1, '2024-01-15', '2024-01-20', 'Pneumonia', 'Antibiotics', 201),
(122, 1, '2024-02-10', '2024-02-15', 'Pneumonia', 'Antibiotics', 201),
(123, 2, '2024-03-20', '2024-03-25', 'Diabetes', 'Insulin therapy', 202),
(124, 2, '2024-04-12', '2024-04-15', 'Diabetes', 'Insulin therapy', 202),
(125, 3, '2024-05-08', '2024-05-15', 'Asthma', 'Bronchodilators', 202),
(126, 3, '2024-06-18', '2024-06-20', 'Asthma', 'Bronchodilators', 202),
(127, 4, '2024-07-03', '2024-07-10', 'Migraine', 'Triptans', 203),
(128, 4, '2024-07-25', '2024-07-30', 'Migraine', 'Triptans', 203);


-- 30. Identify patients who have been readmitted within 30 days of discharge:
SELECT 
    m1.patient_id,
    p.patient_name,
    m1.admission_date AS readmission_date,
    m1.discharge_date AS readmission_discharge_date,
    m2.admission_date AS previous_admission_date
FROM 
    MedicalRecords m1
JOIN 
    MedicalRecords m2 ON m1.patient_id = m2.patient_id
    AND m1.admission_date > m2.discharge_date
    AND DATEDIFF(m1.admission_date, m2.discharge_date) <= 30
JOIN 
    Patients p ON m1.patient_id = p.patient_id
ORDER BY 
    m1.patient_id, m1.admission_date;

-- 31 Calculate the average length of hospital stay by month for the past year:
SELECT 
    YEAR(admission_date) AS year,
    MONTH(admission_date) AS month,
    AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM 
    MedicalRecords
WHERE 
    admission_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY 
    YEAR(admission_date), MONTH(admission_date)
ORDER BY 
    year, month;

-- 32. List patients who have been admitted to the hospital more than once in the past year:
SELECT 
    Patients.patient_id,
    Patients.patient_name,
    COUNT(*) AS admissions
FROM 
    MedicalRecords
JOIN 
    Patients ON MedicalRecords.patient_id = Patients.patient_id
WHERE 
    MedicalRecords.admission_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY 
    Patients.patient_id, Patients.patient_name
HAVING 
    COUNT(*) > 1;

-- 33. Find patients whose total hospital charges exceed a certain threshold:
SELECT 
    Patients.patient_id,
    Patients.patient_name,
    SUM(MedicalRecords.hospital_charges) AS total_charges
FROM 
    MedicalRecords
JOIN 
    Patients ON MedicalRecords.patient_id = Patients.patient_id
GROUP BY 
    Patients.patient_id, Patients.patient_name
HAVING 
    total_charges > 100;

-- for 33 questions. If the Data not avaliable in your table in this add data in a table.

-- 34. Calculate the percentage change in the number of patients admitted each month compared to the previous month:

SELECT 
    YEAR(admission_date) AS year,
    MONTH(admission_date) AS month,
    COUNT(*) AS admissions,
    ((COUNT(*) - LAG(COUNT(*), 1, 0) OVER (ORDER BY YEAR(admission_date), MONTH(admission_date))) * 100.0) / LAG(COUNT(*), 1, 1) OVER (ORDER BY YEAR(admission_date), MONTH(admission_date)) AS percentage_change
FROM 
    MedicalRecords
WHERE 
    admission_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY 
    YEAR(admission_date), MONTH(admission_date);

-- Common QUestions for final analysis.
-- Male vs. Female Patients:

SELECT gender, COUNT(*) AS total_count FROM Patients GROUP BY gender;

-- Percentage of Male and Female Patients:

SELECT gender, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patients) AS percentage FROM Patients GROUP BY gender;

-- Top 5 Most Common Diagnoses:

SELECT diagnosis, COUNT(*) AS diagnosis_count FROM MedicalRecords GROUP BY diagnosis ORDER BY diagnosis_count DESC LIMIT 5;

-- Average Length of Hospital Stay:

SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay FROM MedicalRecords;

-- Top 3 Doctors Treating the Most Patients:

SELECT doctor_id, COUNT(*) AS patient_count FROM MedicalRecords GROUP BY doctor_id ORDER BY patient_count DESC LIMIT 3;

-- Doctors Treating Patients with Diabetes:

SELECT m.doctor_id, d.doctor_name, COUNT(*) AS diabetes_patients 
FROM MedicalRecords m JOIN Doctors d ON m.doctor_id = d.doctor_id 
WHERE m.diagnosis = 'Diabetes' 
GROUP BY m.doctor_id, d.doctor_name 
ORDER BY diabetes_patients DESC 
LIMIT 1;

-- Readmission Rate within 30 Days:
SELECT m1.patient_id, p.patient_name, m1.admission_date AS readmission_date, m1.discharge_date AS readmission_discharge_date, m2.admission_date AS previous_admission_date FROM MedicalRecords m1 JOIN MedicalRecords m2 ON m1.patient_id = m2.patient_id AND m1.admission_date > m2.discharge_date AND DATEDIFF(m1.admission_date, m2.discharge_date) <= 30 JOIN Patients p ON m1.patient_id = p.patient_id ORDER BY m1.patient_id, m1.admission_date;


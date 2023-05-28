WITH tabel_aggregat AS (
    SELECT *,
    CASE 
        WHEN customer_age <= 30 THEN '30 years below'
        WHEN customer_age BETWEEN 31 AND 35 THEN '31-35 years'
        WHEN customer_age BETWEEN 36 AND 40 THEN '36-40 years'
        WHEN customer_age BETWEEN 41 AND 45 THEN '41-45 years'
        WHEN customer_age BETWEEN 46 AND 50 THEN '46-50 years'
        WHEN customer_age BETWEEN 51 AND 55 THEN '51-55 years'
        WHEN customer_age BETWEEN 56 AND 60 THEN '56-60 years'
        ELSE '>60 years'
    END AS age_category
    FROM fp_btpn_syariah.customer_data_history cdh
    LEFT JOIN fp_btpn_syariah.category_db cd ON cdh.card_categoryid = id_category
    LEFT JOIN fp_btpn_syariah.education_db edu ON cdh.Educationid = id_education
    LEFT JOIN fp_btpn_syariah.marital_db md ON cdh.Maritalid = id_marital
    LEFT JOIN fp_btpn_syariah.status_db st ON cdh.idstatus = id_status
) SELECT * FROM tabel_aggregat;



SELECT Gender, count(Gender)
FROM tabel_aggregat
GROUP BY Gender
ORDER BY count(Gender) DESC;

SELECT
age_category, 
count(age_category) 
FROM tabel_aggregat
GROUP BY age_category 
ORDER BY count(age_category) DESC;

SELECT 
min(customer_age), max(customer_age), AVG(customer_age), count(DISTINCT customer_age) 
FROM tabel_aggregat;

SELECT 
Marital_Status, 
count(Marital_Status)
FROM tabel_aggregat
GROUP BY
Marital_Status
ORDER BY
count(Marital_Status) DESC;

SELECT 
Education_Level, count(Education_Level) 
FROM tabel_aggregat 
GROUP BY 
Education_Level 
ORDER BY count(Education_level) desc;

SELECT * FROM tabel_aggregat;

SELECT count(DISTINCT CLIENTNUM) FROM tabel_aggregat;
SELECT count(CLIENTNUM) FROM tabel_aggregat;




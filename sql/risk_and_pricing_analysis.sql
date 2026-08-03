/* ============================================================
   RISK & PRICING ANALYSIS
   Purpose: Analyze claim severity, frequency, and risk factors
   Dataset: insurance_claims
   ============================================================ */


/* ------------------------------------------------------------
   1. Age vs. Average Claim Amount - How does age affect average claim amount?
   ------------------------------------------------------------ */
-- Query 1A: Average claim amount by age
SELECT age, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY age
ORDER BY age;
-- Query 1B: Age groups (bins) vs average claim amount
SELECT 
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 40 THEN '25-40'
        WHEN age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY age_group
ORDER BY avg_claim DESC;

/* ------------------------------------------------------------
   2. Claim Severity by Policy State - Do certain policy states have higher claim severity?
   ------------------------------------------------------------ */
-- Query 2A: Average claim amount by state
SELECT policy_state, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY policy_state
Order BY avg_claim DESC;
-- Query 2B: Severity distribution by state
SELECT policy_state, incident_severity, COUNT(*) AS total
FROM insurance_claims
GROUP BY policy_state, incident_severity
ORDER BY policy_state, total DESC;

/* ------------------------------------------------------------
   3. Deductible vs. Total Claim Amount - How does policy deductible relate to total claim amount?
   ------------------------------------------------------------ */
-- Query 3A: Correlation-style comparison (deductible vs avg claim)
SELECT policy_deductible, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY policy_deductible
ORDER BY policy_deductible;
-- Query 3B: Deductible buckets vs claim severity
SELECT 
   CASE 
      WHEN policy_deductible = 500 THEN "Low Deductible"
      WHEN policy_deductible = 1000 THEN "Moderate Deductible"
      WHEN policy_deductible = 2000 THEN "High Deductible"
	END AS deductible_group,
AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY deductible_group
ORDER BY avg_claim;

/* ------------------------------------------------------------
   4. Occupation & Education Level Risk - Which occupations or education levels correlate with higher risk?
   ------------------------------------------------------------ */
-- Query 4A: Occupation vs average claim amount
SELECT insured_occupation AS occupation, ROUND(AVG(total_claim_amount),2) AS avg_claim
FROM insurance_claims
GROUP BY occupation
ORDER BY avg_claim DESC;
-- Query 4B: Education level vs average claim amount
SELECT insured_education_level, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY insured_education_level
ORDER BY avg_claim DESC;

/* ------------------------------------------------------------
   5. Relationship Status vs Claim Frequency - Does insured relationship status affect claim frequency?
   ------------------------------------------------------------ */
-- Query 5A: Frequency of claims by relationship status
SELECT insured_relationship, COUNT(total_claim_amount) AS claim_frequency
FROM insurance_claims
GROUP BY insured_relationship
ORDER BY claim_frequency DESC;
-- Query 5B: Severity by relationship status
SELECT insured_relationship, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY insured_relationship
ORDER BY avg_claim DESC;
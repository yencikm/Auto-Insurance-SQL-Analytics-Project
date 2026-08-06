/* ============================================================
   FRAUD & SUSPICIOUS PATTERNS ANALYSIS
   Purpose: Identify unusual claim behavior, anomalies, and
            potential fraud indicators in the dataset.
   Dataset: insurance_claims
   ============================================================ */

/* ------------------------------------------------------------
   1. Unusual City/State Patterns vs Claim Amount - Are there unusual patterns in incident city/state vs. claim amount?
   ------------------------------------------------------------ */
-- Query 1A: Cities with unusually high average claim amounts
SELECT incident_city, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY incident_city
ORDER BY avg_claim DESC;
-- Query 1B: States with unusually high average claim amounts
SELECT incident_state, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY incident_state
ORDER BY avg_claim DESC;
-- Query 1C: Outlier detection using z-scores (optional)
SELECT 
    incident_city,
    AVG(total_claim_amount) AS avg_claim,
    (AVG(total_claim_amount) - 
        (SELECT AVG(total_claim_amount) FROM insurance_claims)
    ) /
    (SELECT STDDEV(total_claim_amount) FROM insurance_claims) AS z_score
FROM insurance_claims
GROUP BY incident_city
ORDER BY z_score DESC;

/* ------------------------------------------------------------
   2. Hobbies Correlated with Suspiciously High Claims - Do certain hobbies correlate with suspiciously high claims?
   ------------------------------------------------------------ */
-- Query 2A: Average claim amount by hobby
SELECT insured_hobbies, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY insured_hobbies
ORDER BY avg_claim DESC;
-- Query 2B: Frequency of high-severity claims by hobby
SELECT insured_hobbies, incident_severity, COUNT(*) AS count
FROM insurance_claims
GROUP BY insured_hobbies, incident_severity
ORDER BY insured_hobbies, incident_severity;
-- Query 2C: Identify hobbies with abnormal claim distributions
SELECT insured_hobbies,
	MIN(total_claim_amount) AS min_claim,
   MAX(total_claim_amount) AS max_claim,
   ROUND(STDDEV(total_claim_amount),2) AS stddev_claim
FROM insurance_claims
GROUP BY insured_hobbies
ORDER BY stddev_claim;

/* ------------------------------------------------------------
   3. Clusters of Identical Incident Dates or Policy Numbers - Are there clusters of claims with identical incident dates or policy numbers?
   ------------------------------------------------------------ */
-- Query 3A: Multiple claims on the same incident date
SELECT incident_date, COUNT(policy_number) AS claim_count
FROM insurance_claims
GROUP BY incident_date
ORDER BY incident_date; 
-- Query 3B: Policy numbers appearing in multiple claims
-- Query 3B: Policy numbers appearing in multiple claims
SELECT policy_number, COUNT(*) AS claim_count
FROM insurance_claims
GROUP BY policy_number
HAVING COUNT(*) > 0
ORDER BY claim_count DESC;
-- Query 3C: Combined clustering: same date + same policy number
SELECT policy_number, incident_date, COUNT(*) AS claim_count
FROM insurance_claims
GROUP BY policy_number, incident_date
HAVING COUNT(*) > 0
ORDER BY claim_count DESC;

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
-- Query 2B: Frequency of high-severity claims by hobby
-- Query 2C: Identify hobbies with abnormal claim distributions


/* ------------------------------------------------------------
   3. Clusters of Identical Incident Dates or Policy Numbers - Are there clusters of claims with identical incident dates or policy numbers?
   ------------------------------------------------------------ */
-- Query 3A: Multiple claims on the same incident date
-- Query 3B: Policy numbers appearing in multiple claims
-- Query 3C: Combined clustering: same date + same policy number


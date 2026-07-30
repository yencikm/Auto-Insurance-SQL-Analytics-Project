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


/* ------------------------------------------------------------
   2. Claim Severity by Policy State - Do certain policy states have higher claim severity?
   ------------------------------------------------------------ */
-- Query 2A: Average claim amount by state
-- Query 2B: Severity distribution by state


/* ------------------------------------------------------------
   3. Deductible vs. Total Claim Amount - How does policy deductible relate to total claim amount?
   ------------------------------------------------------------ */
-- Query 3A: Correlation-style comparison (deductible vs avg claim)
-- Query 3B: Deductible buckets vs claim severity


/* ------------------------------------------------------------
   4. Occupation & Education Level Risk - Which occupations or education levels correlate with higher risk?
   ------------------------------------------------------------ */
-- Query 4A: Occupation vs average claim amount
-- Query 4B: Education level vs average claim amount


/* ------------------------------------------------------------
   5. Relationship Status vs Claim Frequency - Does insured relationship status affect claim frequency?
   ------------------------------------------------------------ */
-- Query 5A: Frequency of claims by relationship status
-- Query 5B: Severity by relationship status


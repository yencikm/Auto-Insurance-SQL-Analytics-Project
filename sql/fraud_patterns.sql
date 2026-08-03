/* ============================================================
   FRAUD & SUSPICIOUS PATTERNS ANALYSIS
   Purpose: Identify unusual claim behavior, anomalies, and
            potential fraud indicators in the dataset.
   Dataset: insurance_claims
   ============================================================ */


/* ------------------------------------------------------------
   1. Unusual City/State Patterns vs Claim Amount
   ------------------------------------------------------------ */
-- Query 1A: Cities with unusually high average claim amounts
-- Query 1B: States with unusually high average claim amounts
-- Query 1C: Outlier detection using z-scores (optional)


/* ------------------------------------------------------------
   2. Hobbies Correlated with Suspiciously High Claims
   ------------------------------------------------------------ */
-- Query 2A: Average claim amount by hobby
-- Query 2B: Frequency of high-severity claims by hobby
-- Query 2C: Identify hobbies with abnormal claim distributions


/* ------------------------------------------------------------
   3. Clusters of Identical Incident Dates or Policy Numbers
   ------------------------------------------------------------ */
-- Query 3A: Multiple claims on the same incident date
-- Query 3B: Policy numbers appearing in multiple claims
-- Query 3C: Combined clustering: same date + same policy number


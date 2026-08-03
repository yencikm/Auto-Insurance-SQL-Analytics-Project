/* ============================================================
   LOSS MODELING ANALYSIS
   Purpose: Identify predictors of claim severity, build simple
            SQL-based severity models, and evaluate high-severity
            drivers.
   Dataset: insurance_claims
   ============================================================ */

/* ------------------------------------------------------------
   1. Variables Predicting Total Claim Amount
   ------------------------------------------------------------ */
-- Query 1A: Correlation-style comparison for numeric predictors
-- Query 1B: Categorical predictors ranked by average claim amount
-- Query 1C: Multi-factor grouping (state + incident type)


/* ------------------------------------------------------------
   2. SQL-Based Severity Model (Grouping + Averages)
   ------------------------------------------------------------ */
-- Query 2A: Severity model using age + incident type
-- Query 2B: Severity model using auto make + auto year
-- Query 2C: Combined severity model using multiple factors


/* ------------------------------------------------------------
   3. Factors Contributing Most to High Severity Claims
   ------------------------------------------------------------ */
-- Query 3A: Identify high-severity claims (threshold-based)
-- Query 3B: Rank factors by average severity
-- Query 3C: Cross-tab high severity by incident type + collision type

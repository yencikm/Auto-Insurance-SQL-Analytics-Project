/* ============================================================
   CLAIM SEVERITY & FREQUENCY ANALYSIS
   Purpose: Analyze severity drivers, frequency patterns, and
            high-cost claim characteristics.
   Dataset: insurance_claims
   ============================================================ */

/* ------------------------------------------------------------
   1. Incident Types and Average Payouts - Which incident types lead to the highest average payouts?
   ------------------------------------------------------------ */
-- Query 1A: Average claim amount by incident type
SELECT incident_type, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY incident_type
ORDER BY avg_claim DESC;
-- Query 1B: Severity distribution by incident type
SELECT incident_type, incident_severity, COUNT(*) AS count
FROM insurance_claims
GROUP BY incident_type, incident_severity
ORDER BY incident_severity, count DESC;

/* ------------------------------------------------------------
   2. Collision Types and Claim Severity - What collision types are most expensive?
   ------------------------------------------------------------ */
-- Query 2A: Average claim amount by collision type
SELECT collision_type, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY collision_type
ORDER BY avg_claim DESC;
-- Query 2B: Collision type severity breakdown
SELECT collision_type, incident_severity, COUNT(*) AS count
FROM insurance_claims
GROUP BY collision_type, incident_severity
ORDER BY collision_type DESC, count DESC;

/* ------------------------------------------------------------
   3. Incident Hour vs. Severity - Does incident hour of day correlate with severity?
   ------------------------------------------------------------ */
-- Query 3A: Average claim amount by hour of day
SELECT incident_hour, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY incident_hour
ORDER BY avg_claim DESC;
-- Query 3B: Hourly severity distribution
SELECT incident_hour, incident_severity, COUNT(*) AS count
FROM insurance_claims
GROUP BY incident_hour, incident_severity
ORDER BY incident_hour, count DESC;

/* ------------------------------------------------------------
   4. Auto Make/Model Severity Analysis - Which auto makes/models have the highest claim amounts?
   ------------------------------------------------------------ */
-- Query 4A: Auto make & model vs average claim amount
SELECT auto_make, auto_model, AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY auto_make, auto_model
ORDER BY auto_make, avg_claim;

/* ------------------------------------------------------------
   5. Property Damage vs Bodily Injury Frequency & Cost - How many claims involve property damage vs. bodily injury, and what’s the cost difference?
   ------------------------------------------------------------ */
-- Query 5A: Frequency of property vs bodily injury claims
SELECT 
    property_damage,
    bodily_injuries,
    COUNT(*) AS claim_count
FROM insurance_claims
GROUP BY property_damage, bodily_injuries
ORDER BY claim_count DESC;
-- Query 5B: Average cost comparison
SELECT 
    property_damage,
    bodily_injuries,
    AVG(total_claim_amount) AS avg_claim
FROM insurance_claims
GROUP BY property_damage, bodily_injuries
ORDER BY avg_claim DESC;

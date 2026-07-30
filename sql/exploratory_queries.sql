-- Count total rows in the dataset
SELECT COUNT(*) FROM insurance_claims;

-- See all incident types and how often they occur
SELECT incident_type, COUNT(*)
FROM insurance_claims
GROUP BY incident_type
ORDER BY COUNT(*) DESC;

-- Average claim amount by state
SELECT incident_state, AVG(total_claim_amount)
FROM insurance_claims
GROUP BY incident_state
ORDER BY AVG(total_claim_amount) DESC;

-- Average claim amount by auto make
SELECT auto_make, AVG(total_claim_amount)
FROM insurance_claims
GROUP BY auto_make
ORDER BY AVG(total_claim_amount) DESC;

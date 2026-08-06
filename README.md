# Auto Insurance SQL Analytics Project

This repository contains a SQL-based analytics workflow for exploring auto insurance claims data. The project focuses on identifying patterns related to claim severity, pricing risk, claim frequency, and potential fraud indicators using structured database queries.

## Project Overview

The analysis is designed to answer practical insurance questions such as:

- How do demographic and policy factors influence claim severity?
- Which incident characteristics are associated with higher payouts?
- Are there suspicious patterns that may warrant deeper investigation?

By organizing the work into focused SQL scripts, this project provides a reproducible framework for performing actuarial-style exploratory analysis.

## Business Questions Addressed

### Risk & Pricing Questions

- How does age affect average claim amount?
- Do certain policy states have higher claim severity?
- How does policy deductible relate to total claim amount?
- Which occupations or education levels correlate with higher risk?
- Does insured relationship status affect claim frequency?

### Claims Severity & Frequency

- Which incident types lead to the highest average payouts?
- What collision types are most expensive?
- Does incident hour of day correlate with severity?
- Which auto makes and models have the highest claim amounts?
- How many claims involve property damage versus bodily injury, and what is the cost difference?

### Fraud & Suspicious Patterns

- Are there unusual patterns in incident city/state versus claim amount?
- Do certain hobbies correlate with suspiciously high claims?
- Are there clusters of claims with identical incident dates or policy numbers?

## Key Finding

One notable observation from the exploratory analysis is that the highest average claim amount appears at age 22, with an average of 86,130, while the lowest average claim amount appears at age 63, with an average of 24,130. This suggests that age may be an important factor in claim severity and is worth further investigation.

## Dataset

The project uses the insurance claims dataset stored in the data folder:

- data/insurance_claims.csv

The dataset includes fields such as:

- Customer and policy information
- Claim amounts and deductible details
- Incident type, severity, and timing
- Vehicle and injury-related attributes
- Potential fraud-related dimensions such as city, state, hobbies, and repeat policy activity

## Database Schema

The table structure for the analysis is defined in:

- sql/schema.sql

The schema creates a table named insurance_claims with columns for policy, incident, vehicle, and claim-related attributes.

## SQL Analysis Files

The repository is organized into separate SQL scripts for each analysis area:

- sql/risk_and_pricing_analysis.sql
  - Explores age, policy state, deductible, occupation, education, and relationship effects on claim behavior.

- sql/claim_severity_and_frequency_analysis.sql
  - Examines incident type, collision type, incident hour, vehicle make/model, and injury/property damage patterns.

- sql/fraud_patterns.sql
  - Investigates unusual city/state behavior, hobby-based anomalies, and clusters of repeated incident or policy activity.

## How to Use

1. Create a database and load the CSV data into the insurance_claims table.
2. Run the schema script from sql/schema.sql.
3. Execute the analysis scripts in the desired order:
   - sql/risk_and_pricing_analysis.sql
   - sql/claim_severity_and_frequency_analysis.sql
   - sql/fraud_patterns.sql
4. Review the query results to identify patterns and support business decisions.

## Results Summary

The exploratory SQL analysis produced several actionable insights based on the dataset:

- Age appears to influence claim severity. The highest average claim amount was observed for age 22 at 86,130, while the lowest average claim amount was observed for age 63 at 24,130. When grouped into age bands, the 60+ group showed the highest average claim amount, while the 25–40 group showed the lowest.
- Policy state also appears relevant to claim severity. Among the states reviewed, Indiana had the highest average claim amount at about 53,000, while Ohio had the lowest at about 52,467. Illinois had the highest count of major or total-loss severity incidents.
- Deductible level showed a modest relationship with claim amount. The highest deductible group ($2,000) had the highest average claim amount at about 54,000, while the $1,000 deductible group had the lowest at about 51,600.
- Occupation and education level both showed variation in claim severity. The occupation with the highest average claim amount was handlers-cleaners at 61,658, while administrative-clerical had the lowest at 46,638. The highest average claim amount by education level was for PhD holders at 55,453, and the lowest was for those with an Associate’s degree at 48,907.
- Relationship status influenced claim frequency. Own-child had the highest claim frequency at 183 claims, while unmarried insureds had the lowest at 141. The highest average claim amount by relationship status was for wives at 53,554, while own-child had the lowest at 51,441.
- Incident characteristics also mattered. Single-vehicle collisions had the highest average payout at 64,445, while parked-car incidents had the lowest. Front collisions were the most expensive on average at 64,658, while rear collisions had the lowest average at 61,705.
- The hour of day appeared to correlate with severity. The highest average claim amount occurred at 11 a.m., while the lowest occurred at 5 a.m. The most total-loss incidents occurred at 12 a.m.
- Vehicle make and model also showed notable differences. The BMW X6 had the highest average claim amount at about 66,480, while the Mercedes E400 had the lowest at 40,880.
- Property damage and bodily injury showed different patterns in both frequency and cost. Claims involving property damage tended to have higher average claim costs, even though they were less frequent than some other claim types.
- Fraud-related review indicated possible anomalies in incident location, hobbies, and repeated claim activity. Columbus had the highest average claim amount among cities, while Arlington had the lowest. New York had the highest average claim amount by state, while North Carolina had the lowest. Cross-fit had the highest average claim amount by hobby, while base-jumping had the lowest. February 2, 2015 had the highest number of incidents in the dataset.

These findings support the use of SQL-based exploratory analytics for risk assessment, pricing review, and fraud monitoring.

## Notes

This project is intended as an exploratory SQL analytics exercise. The queries provide a strong foundation for identifying risk drivers and suspicious claim patterns, but further validation, statistical testing, and data-quality checks may be needed before using the findings for production underwriting or fraud operations.

## License

This project is available under the MIT license as described in LICENSE.

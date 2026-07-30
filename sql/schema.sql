-- Create your database and set to use it
CREATE DATABASE auto_insurance
USE auto_insurance
--Structure of the Table
CREATE TABLE insurance_claims (
  month_as_customer INT,
  age INT,
  policy_number VARCHAR(50),
  policy_state VARCHAR(10),
  policy_deductible INT,
  policy_annual_premium INT,
  insured_sex VARCHAR(10),
  insured_education_level VARCHAR(50),
  insured_occupation VARCHAR(50),
  insured_hobbies VARCHAR(50),
  insured_relationship VARCHAR(50),
  incident_date DATE,
  incident_type VARCHAR(50),
  collision_type VARCHAR(50),
  incident_severity VARCHAR(50),
  incident_state VARCHAR(10),
  incident_city VARCHAR(50),
  incident_hour INT,
  number_of_vehicles_involved INT,
  property_damage VARCHAR(10),
  bodily_injuries INT,
  total_claim_amount INT,
  injury_claim INT,
  property_claim INT,
  vehicle_claim INT,
  auto_make VARCHAR(50),
  auto_model VARCHAR(50),
  auto_year INT);

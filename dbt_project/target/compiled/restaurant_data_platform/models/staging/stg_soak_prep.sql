-- Staging model for soak preparation data
SELECT 
    Timestamp,
    User,
    Date,
    Time,
    Shift,
    "Chhola Soak (KG)" as chhola_soak_kg,
    "Dal Soak (KG)" as dal_soak_kg,
    -- Add some data quality checks
    CASE 
        WHEN "Chhola Soak (KG)" > 0 OR "Dal Soak (KG)" > 0 
        THEN 'valid' 
        ELSE 'invalid' 
    END as data_quality_flag
FROM "restaurant"."main"."soak_prep"
WHERE Timestamp IS NOT NULL
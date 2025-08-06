-- User performance analysis
SELECT 
    User,
    COUNT(*) as total_entries,
    SUM(chhola_soak_kg) as total_chhola_kg,
    SUM(dal_soak_kg) as total_dal_kg,
    AVG(chhola_soak_kg) as avg_chhola_kg,
    AVG(dal_soak_kg) as avg_dal_kg,
    COUNT(DISTINCT Date) as days_worked
FROM "restaurant"."main"."stg_soak_prep"
WHERE data_quality_flag = 'valid'
GROUP BY User
ORDER BY total_chhola_kg DESC
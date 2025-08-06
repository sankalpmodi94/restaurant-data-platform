
  
    
    

    create  table
      "restaurant"."main"."daily_soak_summary__dbt_tmp"
  
    as (
      -- Daily summary of soak preparation
SELECT 
    Date,
    COUNT(*) as total_entries,
    SUM(chhola_soak_kg) as total_chhola_kg,
    SUM(dal_soak_kg) as total_dal_kg,
    AVG(chhola_soak_kg) as avg_chhola_kg,
    AVG(dal_soak_kg) as avg_dal_kg,
    COUNT(DISTINCT User) as unique_users
FROM "restaurant"."main"."stg_soak_prep"
WHERE data_quality_flag = 'valid'
GROUP BY Date
ORDER BY Date DESC
    );
  
  
select business_name,
case when  business_name ILIKE '%restaurant%' then 'restaurant'  
     when business_name ILIKE  any(array['%cafe%', '%café%', '%coffee%']) then 'Cafe'
     when business_name ILIKE '%school%' then 'school'
     else 'other' end  as business_type


from sf_restaurant_health_violations;

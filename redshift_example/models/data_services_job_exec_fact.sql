{{ config(materialized='table') }}
select ds_repo_key 
,      etl_job_key
,      start_time 
,      end_time 
,      execution_time 
--  next three columns should be split into status dim
,      status 
,      has_error 
,      ignore_error 
-- next two columns should be split into server dim 
,      machine 
,      server 
,      service 
--      
from  {{ ref('data_services_job_exec_fact_work') }}
--
where  ds_repo_key != 0
and    etl_job_key != 0
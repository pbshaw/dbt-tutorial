select coalesce (drd.ds_repo_key,0) as ds_repo_key 
,      coalesce (ejd.etl_job_key,0) as etl_job_key
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
-- next two columns included for error checking purposes
,      repo_name
,      service 
--      
from   public.al_history_combined                ahc  
left   join {{ ref('data_services_repo_dim') }}  drd 
on     ahc.repo_name          = drd.ds_repo_name 
left   join {{ ref('data_services_job_dim')}}    ejd 
on     upper(ahc.service)     = ejd.job_name_upper 
and    drd.ds_repo_key        = ejd.ds_repo_key
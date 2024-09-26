

EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Upcoming WIP Shortages (MH)','Upcoming WIP Shortages (MH) Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Released WIP Summary (MH)','Released WIP Summary (MH) Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Upcoming WIP Data (MH)','Upcoming WIP Data (MH) Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','WIP Location Summary (MH)','WIP Location Summary (MH) Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Upcoming WIP Summary (MH)','Upcoming WIP Summary (MH) Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Recent WIP Completions (MH)','Recent WIP Completions (MH) Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Subassembly Supply/Demand (MH)','Subassembly Supply/Demand Alteryx'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','All Jobs and Orders (MH)','All Jobs and Orders (MH) Alteryx'

select b.[Item Number] from [ops-datascience-5026].[Subassembly Supply/Demand (MH)] a left outer JOIN
[ops-datascience-5026].[Subassembly Supply/Demand Alteryx] b on a.[Item Number]!=b.[Item Number]
and a.[Order Number]=b.[Order Number] and a.[Project Num]=b.[Project Num]


select [Item Number] from [ops-datascience-5026].[Subassembly Supply/Demand (MH)] where 
except
select [Item Number] from [ops-datascience-5026].[Subassembly Supply/Demand Alteryx]
except
select [Item Number] from [ops-datascience-5026].[Subassembly Supply/Demand (MH)]





middle spark read5 preview 
select [JOB Name],[Actual Start Date] FROM  [ops-datascience-5026].[Depot_Alteryx_Output]



select * from [ops-datascience-5026].[Subassembly Supply/Demand (MH)] where [Item Number]='1126667'
1002444
1013033


1126667
1148262

select DISTINCT a.[JOB Name],a.[Actual Start Date] as synapse_dt,b.[Actual Start Date] as Altrey_dt from [ops-datascience-5026].[VR Depot] a join [ops-datascience-5026].[VR Depot Alteryx] b
on a.[JOB Name]=b.[JOB Name] and a.[JOB Name] IN (select [JOB Name] from (select [JOB Name],[Actual Start Date]  FROM  [ops-datascience-5026].[VR Depot]
except
select [JOB Name],[Actual Start Date]  FROM  [ops-datascience-5026].[VR Depot Alteryx]) p )


select * from [ops-datascience-5026].[Upcoming WIP Shortages (MH) Alteryx] where [Assembly Part #]='1458893'and [Component Part #]='1330181'
select * from [ops-datascience-5026].[Upcoming WIP Shortages (MH)] where [Assembly Part #]='1458893' and [Component Part #]='1330181'



select * from [ops-datascience-5026].[Released WIP Summary (MH) Alteryx] where [Item #]='1413284'

select * from [ops-datascience-5026].[Released WIP Summary (MH)] where [Item #]='1413284'

select distinct 'alteryx',* from [ops-datascience-5026].[Upcoming WIP Data (MH) Alteryx] where [Assembly$Sv$Part Number]='1078878' 
and [Job Status]='Complete - No Charges'
AND [Job Start Date]='2024-08-09 00:00:00.000' and [Date]='2024-08-09 14:43:51.000'
UNION
select 'adf', * from [ops-datascience-5026].[Upcoming WIP Data (MH)] where [Assembly$Sv$Part Number]='1078878' 
and [Job Status]='Complete - No Charges'
and [Job Start Date]='2024-08-09 00:00:00.000'and [Date]='2024-08-09 00:00:00.000'

select * from [ops-datascience-5026].[Upcoming WIP Data (MH)] where [Assembly$Sv$Part Number]='1078878'

select * from [ops-datascience-5026].[WIP Location Summary (MH) Alteryx] where [Job Name]='AS100G3668BP' and [Sequence #]=115

select * from [ops-datascience-5026].[WIP Location Summary (MH)] where [Job Name]='AS100G3668BP'and [Sequence #]=115

;;;
ascience-5026].[Upcoming WIP Summary (MH)] where [Average Jobs Open]='9.4' and [Month]='2023-11-01'

select  * from [ops-datascience-5026].[Upcoming WIP Summary (MH) Alteryx]
except
select  * from [ops-datascience-5026].[Upcoming WIP Summary (MH)]

select * from [ops-datascience-5026].[Upcoming WIP Summary (MH) Alteryx] where [Project Number]='0001858' --and [Average Jobs Open]='9.4' and [Month]='2023-11-01'
select * from [ops-datascience-5026].[Upcoming WIP Summary (MH)] where  [Project Number]='0001858'

select * from [ops-datascience-5026].[Recent WIP Completions (MH) Alteryx] where [Job Name]='50204-GM4030086'
union
select * from [ops-datascience-5026].[Recent WIP Completions (MH)] where [Job Name]='50204-GM4030086'


select * from [ops-datascience-5026].[Subassembly Supply/Demand Alteryx] where [Project Num]='C202255' and [Item Num]='1224403T'
UNION
select * from [ops-datascience-5026].[Subassembly Supply/Demand (MH)] where [Project Num]='C202255' and [Item Num]='1224403T'



select count(*) from [ops-datascience-5026].[Subassembly Supply/Demand Alteryx] where date is null
select count(*) from [ops-datascience-5026].[Subassembly Supply/Demand (MH)] where date is null -- 10054 date are NULL


select * from [ops-datascience-5026].[All Jobs and Orders (MH) Alteryx] where [Item Number]='1219457' and [Job Created By]='PDONALD'
union
select * from [ops-datascience-5026].[All Jobs and Orders (MH)] where [Item Number]='1219457'and [Job Created By]='PDONALD'

SELECT count(*)
FROM [ops-datascience-5026].[WIPG0_All_Matrl_Requirements]

select count(*) from [ops-datascience-5026].[Subassembly Supply/Demand (MH)] where date is null -- 10054 date are NULL



--[ops-datascience-5026].[Upcoming WIP Data (MH)] 

select top 10 * from [ops-datascience-5026].[WIP Location Summary (MH)]  --Timpil
select top 10 * from [ops-datascience-5026].[Upcoming WIP Summary (MH)] --guna
select top 10 *  from [ops-datascience-5026].[WIP Location Summary (MH)] --swetha

--[ops-datascience-5026].[Recent WIP Completions (MH)]----

select * from [ops-datascience-5026].[WIP Location Summary (MH)] where [Assembly PN] = '1182711'

select * from [ops-datascience-5026].[All Jobs and Orders (MH)] where [Item Number] = '1354633'



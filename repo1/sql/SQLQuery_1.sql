--select top 1000  * from [ops-datascience-5026].[Item_Revisions_Early]


--in ADF but not in Alteryx
select [Project Number] from [ops-datascience-5026].[Planner Assignment Sheet]
except
select [Project Number] from [ops-datascience-5026].[Planner_Assignemnt_Sheet_Alteryx]


-- In Alteryx but not in ADF
select [Project Number] from [ops-datascience-5026].[Planner_Assignemnt_Sheet_Alteryx]
except
select [Project Number] from [ops-datascience-5026].[Planner Assignment Sheet]


select 
	[Project Number] ,
	[PM or OPM] ,
	[PLANNER] ,
	[Business Area] ,
	[Project Name ] ,
	[Penalties] ,
	[FAT Complete] ,
	[BOM & DWG] ,
	[Material CTB Date] ,
	[Ship] ,
	[Install Complete] ,
	[Site] ,
	[Comments] ,
	[Material LLs] ,
	[Govt Rating] ,
	[Tower] ,
	[Stack Complete] 
from [ops-datascience-5026].[Planner Assignment Sheet]

UNION
select 
	[Project Number] ,
	[PM or OPM] ,
	[PLANNER] ,
	[Business Area] ,
	[Project Name ] ,
	[Penalties] ,
	[FAT Complete] ,
	[BOM & DWG] ,
	[Material CTB Date] ,
	[Ship] ,
	[Install Complete] ,
	[Site] ,
	[Comments] ,
	[Material LLs] ,
	[Govt Rating] ,
	[Tower] ,
	[Stack Complete] 

 from [ops-datascience-5026].[Planner_Assignemnt_Sheet_Alteryx]
 





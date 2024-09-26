select 
	-- [Project Number] ,
	-- [PM or OPM] ,
	-- [PLANNER] ,
	-- [Business Area] ,
	-- [Project Name ] ,
	-- [Penalties] ,
	-- [FAT Complete] ,
	-- [BOM & DWG] ,
	-- [Material CTB Date] ,
	-- [Ship] ,
	 [Install Complete] ,
	-- [Site] ,
	-- [Comments] ,
	-- [Material LLs] ,
	-- [Govt Rating] ,
	-- [Tower] ,
	 [Stack Complete] 
from [ops-datascience-5026].[Planner Assignment Sheet]
where [Project Number]='0005051'


select 
	-- [Project Number] ,
	-- [PM or OPM] ,[ops-datascience-5026].[BPlanner_KPIs_SS]
	-- [PLANNER] ,
	-- [Business Area] ,
	-- [Project Name ] ,
	-- [Penalties] ,
	-- [FAT Complete] ,
	-- [BOM & DWG] ,
	-- [Material CTB Date] ,
	-- [Ship] ,
	 [Install Complete] ,
	-- [Site] ,
	-- [Comments] ,
	-- [Material LLs] ,
	-- [Govt Rating] ,
	-- [Tower] ,
	 [Stack Complete] 

 from [ops-datascience-5026].[Planner_Assignemnt_Sheet_Alteryx]
 where [Project Number]='0005051'


EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'planner-kpi-daily-projplan-alteryx-output','Daily_Project_Planning_KPIs'


select * from [ops-datascience-5026].[BOMExplosion]
select * from [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly]

select count(*) from [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]


--648616 (alteryx)
--647830 (ADF)



240545 - MRP Workbench
560 -- hold attr
6805705 -- Item revision -- 
48883 -- project lookup
467832 -- Onhand qty


EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'MRP Workbench with Onhand - MRPearly','MRP Workbench with Onhand - MRPearly Alteryx'


select  [Buyer], [Buyer Org], [Buyer Type], Manager, [Project Number] FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly]
where [Using Assembly]='VA-215930-0207' and [Fiscal Date]='2026-08-07'
ORDER by [Avg Item Cost] desc

select [Project Number] ,"Cum Manufacturing Lead Time",
"Cumulative Total Lead Time",
"Fixed Lead Time",
"Item Avg Cost",
"List Price Per Unit",
"Planning Group Quantity",
"Preprocessing Lead Time",
"Processing Lead Time",
"Postprocessing Lead Time",
"Shelf Life Days",
"Variable Lead Time" FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly]
where [Using Assembly]='VA-215930-0207' and [Fiscal Date]='2026-08-07'

select [Project Number] ,"Cum Manufacturing Lead Time",
"Cumulative Total Lead Time",
"Fixed Lead Time",
"Item Avg Cost",
"List Price Per Unit",
"Planning Group Quantity",
"Preprocessing Lead Time",
"Processing Lead Time",
"Postprocessing Lead Time",
"Shelf Life Days",
"Variable Lead Time" FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]
where [Using Assembly]='VA-215930-0207' and [Fiscal Date]='2026-08-07'


select   count(*)  FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]
where CUM

select * FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]
where [Using Assembly]='VA-215930-0207' and [Fiscal Date]='2026-08-07'
ORDER by [Avg Item Cost] desc

select [Avg Item Cost] FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly] where [Avg Item Cost] = '139'

select [Avg Item Cost] FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx] where [Avg Item Cost] = '1'

select [Org] from [ops-datascience-5026].[MRP Workbench_Vsat_Alteryx]


EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'Planner_Assignemnt_Sheet_Alteryx','Planner Assignment Sheet'

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'Duluth Labor Loading Alteryx','Duluth Labor Loading'


select count(*) from [ops-datascience-5026].[Duluth Labor Loading]

--930537
--934156

select * from [ops-datascience-5026].[Duluth Labor Loading Alteryx] where Assembly='1199073' and [Project Number]='S000420' and [Job Name]='VT2560621' order by Department


select * from [ops-datascience-5026].[Duluth Labor Loading] where Assembly='1199073'and [Project Number]='S000420' and [Job Name]='VT2560621'order by Department




select 
ActiAction,
Change Notice,
Compression Days,
Cum Manufacturing Lead Time
Cumulative Total Lead Time
Days From Today
Fixed Lead Time
Implemented Quantity
Item Avg Cost
List Price Per Unit
Organization Id
Postprocessing Lead Time
Preprocessing Lead Time
Process Days
Processing Lead Time
Project Number
Release Time Fence Code
Shelf Life Days
Variable Lead Time



select 'Alteryx',Action, [Change Notice],[Compression Days],[Cum Manufacturing Lead Time],[Cumulative Total Lead Time],[Days From Today],[Fixed Lead Time],[Implemented Quantity],
[Item Avg Cost],[List Price Per Unit],[Organization Id],[Postprocessing Lead Time],[Preprocessing Lead Time],[Process Days],[Processing Lead Time],[Project Number],
[Release Time Fence Code],[Shelf Life Code],[Variable Lead Time] from [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]
 where [Change Notice]='REQ-034060'
union
select 'ADF',[Action], [Change Notice],[Compression Days],[Cum Manufacturing Lead Time],[Cumulative Total Lead Time],[Days From Today],[Fixed Lead Time],[Implemented Quantity],
[Item Avg Cost],[List Price Per Unit],[Organization Id],[Postprocessing Lead Time],[Preprocessing Lead Time],[Process Days],[Processing Lead Time],[Project Number],
[Release Time Fence Code],[Shelf Life Code],[Variable Lead Time]
 FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly] 
 where [Change Notice]='REQ-034060'


select [Project Number] from [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]





select top 10 * from   [ops-datascience-5026].[BOMExplosion]

select count(*) from [ops-datascience-5026].[INVG0_Items_Vsat - MRPearly] --MRP BOM output 1

select count(*) from [ops-datascience-5026].[INVG0_Items_Vsat - MRPearl Alteryx]

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'INVG0_Items_Vsat - MRPearl Alteryx','INVG0_Items_Vsat - MRPearly'

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'MRP Workbench with Onhand - MRPearly Alteryx','MRP Workbench with Onhand - MRPearly'

EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Indented BOM - MRP - MRPearly Alteryx','Indented BOM - MRP - MRPearly'

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'Duluth Labor Loading Alteryx','Duluth Labor Loading'

select * from [ops-datascience-5026].[Duluth Labor Loading] where Assembly='VA-014493-0000' and [Operation Sequence Number]=465 and [Resource Sequence Number]=10
UNION
select * from [ops-datascience-5026].[Duluth Labor Loading Alteryx] where Assembly='VA-014493-0000'and [Operation Sequence Number]=465and [Resource Sequence Number]=10


EXEC dbo.sp_DF_Compare 'ops-datascience-5026','duluth-labor-alteryx-output','Duluth Labor Loading'



SELECT count(*) FROM us WHERE a IS NULL 
UNION ALL
SELECT count(*) FROM us WHERE a IS NOT NULL

select count(*) from [ops-datascience-5026].[WIPQuantities]

select * from [ops-datascience-5026].[OHQuantities] where [PN] = '1271047'

select * from [ops-datascience-5026].[OHQuantities Alteryx] where [PN] = '1271047'

select  * from [ops-datascience-5026].[MRP_Before_MultiRow]




EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Indented BOM -(non-Mas) - MRPearly Alteryx','Indented BOM -(non-Mas) - MRPearly'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','BOM MRP Alteryx','Indented BOM - MRP - MRPearly'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Indented BOM - MRP - MRPearly Alteryx','INVG0_Items_Vsat - MRPearly'

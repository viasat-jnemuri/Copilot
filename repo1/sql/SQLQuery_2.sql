SELECT COUNT(*) FROM [ops-datascience-5026].[BOMExplosion]
select count(*) from [ops-datascience-5026].[QAG0_NMR_Detail_Vsat Alteryx]
select count(*)from [ops-datascience-5026].[Released WIP Summary (MH)]
select count(*) from [ops-datascience-5026].[Released WIP Summary (MH) Alteryx]
select count(*) from [ops-datascience-5026].[Upcoming WIP Data (MH)
select count(*) from [ops-datascience-5026].[Upcoming WIP Shortages (MH) Alteryx]


select count(*) from [ops-datascience-5026].[WIP Location Summary (MH) Alteryx]
EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'WIP Location Summary (MH) Alteryx','WIP Location Summary (MH)'

select count(*) from [ops-datascience-5026].[WIPQuantities]

SELECT top 10 FIXED_LEAD_TIME AS "Fixed LT",
ITEM_DESCRIPTION AS "Item Description",
ITEM_NUMBER AS "Item Number",
ITEM_TYPE AS "Item Type",
ITEMS$AGILE_ITEM__PART__CATEGO AS "Agile PC",
ORGANIZATION_CODE AS "Org", 
PLANNING_MAKE_BUY_CODE AS "Make Buy",
WIP_SUPPLY_TYPE AS "Wip Supply Type" FROM [ops-datascience-5026].[INVG0_Items_Vsat]

SELECT * FROM [ops-datascience-5026].[VR Depot] 

select count(*) from [ops-datascience-5026].[INVG0_Items_Vsat - MRPearly]

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'INVG0_Items_Vsat - MRPearl Alteryx','INVG0_Items_Vsat - MRPearly'

select * from [ops-datascience-5026].[EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'INVG0_Items_Vsat - MRPearl Alteryx','INVG0_Items_Vsat - MRPearly'] where [Assembly] = '1006173'

SELECT ORGANIZATION_CODE ,count(*) from [ops-datascience-5026].[INVG0_Item_Revisions]
group by ORGANIZATION_CODE

select count(*) from [ops-datascience-5026].[INVG0_Item_Revisions] where CURRENT_REVISION_FLAG = 'Y' and
ORGANIZATION_CODE = 'MAS' and IMPLEMENTATION_DATE >= '01-JAN-2013'

select count(*) from [ops-datascience-5026].[Indented BOM -(non-Mas) - MRPearly]

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'Indented BOM -(non-Mas) - MRPearly Alteryx','Indented BOM -(non-Mas) - MRPearly'

select count(*) from [ops-datascience-5026].[VR Depot]

select  * FROM  [ops-datascience-5026].[VR Depot] where [Job Name RO] = '50204-M401338' and [Operation Description] = 'Final Inspection'
-- except
select * FROM  [ops-datascience-5026].[depot-tableau-alteryx-output] where [Job Name RO] = '50204-M401338' and [Operation Description] = 'Final Inspection'

select count(*) from [ops-datascience-5026].[Indented BOM - MRP - MRPearly]

select count(*) from [ops-datascience-5026].[Indented BOM - MRP - MRPearly Alteryx]

select top 100 * from [ops-datascience-5026].[Duluth Labor Loading]

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'MRP Workbench with Onhand - MRPearly Alteryx','MRP Workbench with Onhand - MRPearly'

select [JOB Name],[Actual Start Date]  FROM  [ops-datascience-5026].[VR Depot] --where [JOB Name]='R50204-1035'
except
select [JOB Name],[Actual Start Date] FROM  [ops-datascience-5026].[VR Depot Alteryx] --where [JOB Name]='R50204-1035'

select DISTINCT a.[JOB Name],a.[Actual Start Date] as synapse_dt,b.[Actual Start Date] as Altrey_dt from [ops-datascience-5026].[VR Depot] a join [ops-datascience-5026].[VR Depot Alteryx] b 
on a.[JOB Name]=b.[JOB Name] and a.[JOB Name] IN (select [JOB Name] from (select [JOB Name],[Actual Start Date]  FROM  [ops-datascience-5026].[VR Depot] 
except
select [JOB Name],[Actual Start Date]  FROM  [ops-datascience-5026].[VR Depot Alteryx]) p )

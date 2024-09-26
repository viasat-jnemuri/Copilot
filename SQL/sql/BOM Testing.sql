


select 'Alteryx',* from [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx]
 where [Change Notice]='REQ-132990'
union
select 'ADF',*
 FROM [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly] 
 where [Change Notice]='REQ-132990'


select [Change Notice] from [ops-datascience-5026].[MRP Workbench with Onhand - MRPearly Alteryx] where [PO Price] is not null


[Indented BOM - MRP - MRPearly Alteryx]
[Indented BOM -(non-Mas) - MRPearly Alteryx]
[BOM MRP Alteryx]

[ops-datascience-5026].[INVG0_Items_Vsat - MRPearly]
[ops-datascience-5026].[Indented BOM -(non-Mas) - MRPearly]
[ops-datascience-5026].[Indented BOM - MRP - MRPearly]


EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Indented BOM -(non-Mas) - MRPearly Alteryx','Indented BOM -(non-Mas) - MRPearly'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','BOM MRP Alteryx','Indented BOM - MRP - MRPearly'
EXEC dbo.sp_DF_Compare 'ops-datascience-5026','Indented BOM - MRP - MRPearly Alteryx','INVG0_Items_Vsat - MRPearly'



select  count(*)  FROM [ops-datascience-5026].[Indented BOM - MRP - MRPearly Alteryx] where  [(Demand) Type]='Planned order demand'--5574014
      and [(Demand) Using Assy]='VA-012750-0002' and Date='2024-11-22'
      and [Level 1]='1234961 '
     -- and [(Demand) WO Number]='ASB3759924' 
      order by Assembly

select count(*) FROM [ops-datascience-5026].[Indented BOM - MRP - MRPearly] where  [(Demand) Type]='Planned order demand' ---940534
      and [(Demand) Using Assy]='VA-012750-0002' and Date='2024-11-22'
      and [Level 1]='1234961 '
     -- and [(Demand) WO Number]='ASB3759924' 
      order by Assembly


      select  count(*) as 'AlteryxCnt',[(Demand) Type]  FROM [ops-datascience-5026].[Indented BOM - MRP - MRPearly Alteryx]
      GROUP BY [(Demand) Type]
      select  count(*) as 'ADFCnt',[(Demand) Type]  FROM [ops-datascience-5026].[Indented BOM - MRP - MRPearly]
      GROUP BY [(Demand) Type]

      select  count(*) as 'AlteryxCnt',[Item Type]  FROM [ops-datascience-5026].[Indented BOM -(non-Mas) - MRPearly Alteryx]
      GROUP BY [Item Type]
      select  count(*) as 'ADFCnt',[Item Type]  FROM [ops-datascience-5026].[Indented BOM -(non-Mas) - MRPearly]
      GROUP BY [Item Type]


 select  count(*) as 'AlteryxCnt',[(Demand) Type]   FROM [ops-datascience-5026].[BOM MRP Alteryx]
      GROUP BY [(Demand) Type] 
      select  count(*) as 'ADFCnt',[(Demand) Type]   FROM [ops-datascience-5026].[Indented BOM - MRP - MRPearly]
      GROUP BY [(Demand) Type] 

select * from [ops-datascience-5026].[BOM MRP Alteryx]  where [(Demand) Using Assy]='VA-012750-0002' and  [(Demand) WO Number]='VM2984498BP' and Assembly='006517-0000' 
select * from [ops-datascience-5026].[Indented BOM - MRP - MRPearly]where [(Demand) Using Assy]='VA-012750-0002' and [(Demand) WO Number]='VM2984498BP' and Assembly='006517-0000' 


select * from [ops-datascience-5026].[BOM MRP Alteryx]  where [(Demand) Using Assy]='1320621' and  [(Demand) WO Number]='ASB3759924' and Assembly='1242634' 
select * from [ops-datascience-5026].[Indented BOM - MRP - MRPearly] where [(Demand) Using Assy]='1320621' and [(Demand) WO Number]='ASB3759924' and Assembly='1242634'


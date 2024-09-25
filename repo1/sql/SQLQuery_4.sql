SELECT * FROM [ops-datascience-5026].[pte_inventory_turns]

select  * from [ops-datascience-5026].[Indented BOM - MRP - MRPearly Alteryx]
 where [Assembly] = '1414600' and [(Demand) Using Assy] = '1452064' and [Change Notice] = 'REQ-004617'

 select  * from [ops-datascience-5026].[Indented BOM - MRP - MRPearly]
 where [Assembly] = '1414600' and [(Demand) Using Assy] = '1452064' and [Change Notice] = 'REQ-004617'

[ops-datascience-5026].[Indented BOM -(non-Mas) - MRPearly]

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'Indented BOM - MRP - MRPearly Alteryx','Indented BOM - MRP - MRPearly' 

EXEC dbo.sp_DF_Compare 'ops-datascience-5026', 'Indented BOM -(non-Mas) - MRPearly Alteryx','Indented BOM -(non-Mas) - MRPearly'


select * from [ops-datascience-5026].[WIPG0_ALL_JOBS] where [JOB_NAME] IN ('PTE2516654', 'STE2448024', 'STE2454427')


SELECT count(*) FROM [ops-datascience-5026].[Duluth Labor Loading] WHERE [Project Number] = '2602157' AND [Department] = '810' AND [Job Description] = 'ENGINEERING UNITS'

SELECT * FROM [ops-datascience-5026].[Duluth Labor Loading Alteryx]  WHERE [Project Number] = '2602157' AND [Department] = '810' AND [Job Description] = 'ENGINEERING UNITS'

select count(*) from [ops-datascience-5026].[multirow_MRP_Bom_adf]

select count(*) from (SELECT *FROM ( SELECT *, CASE WHEN [Level] > 0 AND [BuyParentLevel] IS NOT NULL THEN 'Yes'ELSE 'No'END AS [Child of Buy] FROM [ops-datascience-5026].[multirow_MRP_Bom_adf] ) a WHERE a.[Child of Buy] = 'No'AND (a.[Extended Quantity] > 0 OR a.[Level] = 0) AND LOWER(a.[Item Type]) != 'reference item'AND a.[Qty] IS NOT NULL)

SELECT COUNT(*)
FROM (
    SELECT *,
        CASE 
            WHEN [Level] > 0 AND [BuyParentLevel] IS NOT NULL THEN 'Yes'
            ELSE 'No'
        END AS [Child of Buy]
    FROM [ops-datascience-5026].[multirow_MRP_Bom_adf]
) a
WHERE 
    a.[Child of Buy] = 'No'
    AND (a.[Extended Quantity] > 0 OR a.[Level] = 0)
    AND LOWER(a.[Item Type]) != 'reference item'
    AND a.[Qty] IS NOT NULL;

 
SELECT count(*) FROM [ops-datascience-5026].[INVG0_Lot_Transactions] --"COUNT(*)": 2749055

select * from [ops-datascience-5026].[pte_onhand_inventory]

/* Total Count
*/

-- [Organization Code] in ('L10','L16','L30') 
select COUNT(*)
from [ops-datascience-5026].Item_Revisions_Early
where [Organization Code] in ('L10','L16','L30') 
--120001 (ADF)
--120002 (Alteryx)


select count(*)
from [ops-datascience-5026].INVG0_ITEMS_VSAT_Additional

--2895912 (ADF)

--2895835 (Alteryx)



select *
from [ops-datascience-5026].Item_Revisions_Early
where [Organization Code] in ('L10','L16','L30') 
and [Sv$Part Number]='1159012'
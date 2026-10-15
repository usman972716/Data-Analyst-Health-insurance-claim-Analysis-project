
select * from [dbo].[insurance_cleaned]

-- 1. Total no.of Individuals
select count(*) [Total no.of individuals]
from insurance_cleaned

-- 2. Average charges by age group
select age_group, avg(charges) [avg charges]
from insurance_cleaned
group by age_group
order by [avg charges] desc


-- 3. Compare insurance charges for smokers and non-smokers
select smoker,sum(charges) [total charges]
from insurance_cleaned
group by smoker


-- 4. Average charges by BMI group
select bmi_group, avg(charges) as [avg charges]
from insurance_cleaned
group by bmi_group
order by [avg charges] desc


-- 5. Compare insurance charges across regions
select region,
ROUND(avg(charges), 2) AS average_charges,
ROUND(sum(charges), 2) AS total_charges
from insurance_cleaned
group by  region
order by  average_charges desc


-- 6. which region with highest insurance charge

with cte as
(select *, DENSE_RANK() over(order by charges desc)
[highest_charges] from insurance_cleaned)
select region,charges from cte
where [highest_charges] = 1
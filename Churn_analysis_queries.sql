-- Calculateing the overall churn rate as a percentage of total customers
select round(sum(case when customer_status='Churned' then 1 else 0 end)*100.0/(select count(customer_id) from stg_churn),2) as churn_rate
from stg_churn

-- Calculateing the percentage distribution of customers by gender
select gender, count(gender) as TotalCount,
round(count(gender)*100.0/(select count(*) from stg_churn),2) as Percentage
from stg_churn
group by gender

-- Calculateing the overall churn rate as a percentage of Gender
select gender, count(gender) as TotalCount,
round(sum(case when customer_status='Churned' then 1 else 0 end)*100.0/(select count(gender) from stg_churn),2) as Percentage
from stg_churn
group by gender

-- Calculateing churn rate for each contract type
select Contract, count(Contract) as TotalCount, sum(case when customer_status='Churned' then 1 else 0 end)*100.0/count(contract) as churn_rate_by_contract
from stg_churn
group by Contract

-- Calculateing churn rate for each state
select State, count(State) as TotalCount,
round(sum(case when customer_status='Churned' then 1 else 0 end)*100.0/count(State),2) as Churn_rate
from stg_churn
group by State
order by Churn_rate desc

-- Calculateing total revenue by customer status (Churned, Stayed, etc.)
select customer_status,count(customer_status) as Total_count,sum(total_revenue) as Total_revenue,
sum(total_revenue)*100.0/(select sum(total_revenue) from stg_churn) as Percentage
from stg_churn
group by customer_status
order by percentage desc

-- Calculateing the average monthly charge for churned vs retained customers
select customer_status,avg(Monthly_Charge) as Monthlycharge
from stg_churn
group by customer_status

-- Aggregateing churned customers by churn category
select churn_category,count(*) as Total_count, sum(total_revenue) as Revenue_lost
from stg_churn
where Customer_Status='Churned'
group by churn_category;

-- Segments churned customers by tenure bucket and contract type
with cte1 as (
select *,case when tenure_in_months < 6 then '<6 months' when tenure_in_months <= 12 then '6-12 months' when tenure_in_months <= 24 then '13-24 months' else '>24 months' end as tenure_segment
from stg_churn
where customer_status='Churned'
)

select tenure_segment,contract,count(*) as churned_customers,sum(total_revenue) as revenue_lost
from cte1
where customer_status = 'churned'
group by tenure_segment,contract
order by revenue_lost desc;

-- Segments customers based on add-on subscription status
with cte2 as (
select *,case when Online_Security='Yes' and Premium_Support='Yes' then 'Online + Premium' else 'Partial Subscription' end as addons
from stg_churn
where Customer_Status in ('Churned','Stayed')
)
select addons,count(addons) as total_count,sum(case when Customer_Status='Churned' then 1 else 0 end) Churned_customers , 
round(sum(case when customer_status='Churned' then total_revenue else 0 end),2) as revenue_loss_due_to_churn
from cte2
group by addons

-- Checking for null values

select 
    sum(case when customer_id is null then 1 else 0 end) as customer_id_null_count,
    sum(case when gender is null then 1 else 0 end) as gender_null_count,
    sum(case when age is null then 1 else 0 end) as age_null_count,
    sum(case when married is null then 1 else 0 end) as married_null_count,
    sum(case when state is null then 1 else 0 end) as state_null_count,
    sum(case when number_of_referrals is null then 1 else 0 end) as number_of_referrals_null_count,
    sum(case when tenure_in_months is null then 1 else 0 end) as tenure_in_months_null_count,
    sum(case when value_deal is null then 1 else 0 end) as value_deal_null_count,
    sum(case when phone_service is null then 1 else 0 end) as phone_service_null_count,
    sum(case when multiple_lines is null then 1 else 0 end) as multiple_lines_null_count,
    sum(case when internet_service is null then 1 else 0 end) as internet_service_null_count,
    sum(case when internet_type is null then 1 else 0 end) as internet_type_null_count,
    sum(case when online_security is null then 1 else 0 end) as online_security_null_count,
    sum(case when online_backup is null then 1 else 0 end) as online_backup_null_count,
    sum(case when device_protection_plan is null then 1 else 0 end) as device_protection_plan_null_count,
    sum(case when premium_support is null then 1 else 0 end) as premium_support_null_count,
    sum(case when streaming_tv is null then 1 else 0 end) as streaming_tv_null_count,
    sum(case when streaming_movies is null then 1 else 0 end) as streaming_movies_null_count,
    sum(case when streaming_music is null then 1 else 0 end) as streaming_music_null_count,
    sum(case when unlimited_data is null then 1 else 0 end) as unlimited_data_null_count,
    sum(case when contract is null then 1 else 0 end) as contract_null_count,
    sum(case when paperless_billing is null then 1 else 0 end) as paperless_billing_null_count,
    sum(case when payment_method is null then 1 else 0 end) as payment_method_null_count,
    sum(case when monthly_charge is null then 1 else 0 end) as monthly_charge_null_count,
    sum(case when total_charges is null then 1 else 0 end) as total_charges_null_count,
    sum(case when total_refunds is null then 1 else 0 end) as total_refunds_null_count,
    sum(case when total_extra_data_charges is null then 1 else 0 end) as total_extra_data_charges_null_count,
    sum(case when total_long_distance_charges is null then 1 else 0 end) as total_long_distance_charges_null_count,
    sum(case when total_revenue is null then 1 else 0 end) as total_revenue_null_count,
    sum(case when customer_status is null then 1 else 0 end) as customer_status_null_count,
    sum(case when churn_category is null then 1 else 0 end) as churn_category_null_count,
    sum(case when churn_reason is null then 1 else 0 end) as churn_reason_null_count
from stg_churn;

--Handling missing values

select 
    customer_id,
    gender,
    age,
    married,
    state,
    number_of_referrals,
    tenure_in_months,
    isnull(value_deal,'none') as value_deal,
    phone_service,
    isnull(multiple_lines,'no') as multiple_lines,
    internet_service,
    isnull(internet_type,'none') as internet_type,
    isnull(online_security,'no') as online_security,
    isnull(online_backup,'no') as online_backup,
    isnull(device_protection_plan,'no') as device_protection_plan,
    isnull(premium_support,'no') as premium_support,
    isnull(streaming_tv,'no') as streaming_tv,
    isnull(streaming_movies,'no') as streaming_movies,
    isnull(streaming_music,'no') as streaming_music,
    isnull(unlimited_data,'no') as unlimited_data,
    contract,
    paperless_billing,
    payment_method,
    monthly_charge,
    total_charges,
    total_refunds,
    total_extra_data_charges,
    total_long_distance_charges,
    total_revenue,
    customer_status,
    isnull(churn_category,'others') as churn_category,
    isnull(churn_reason ,'others') as churn_reason

into [db_churn].[dbo].[prod_churn]
from [db_churn].[dbo].[stg_churn];

--Creating Views

create view vw_churndata as
	select * from prod_churn where Customer_Status in ('Churned','Stayed')

create view vw_joined as
	select * from prod_churn where Customer_Status in ('Joined')
with

opp_acct_contact as (
    select * from {{ ref('opportunities_accounts_contacts_details') }}
    where company_name is not null
),

final as (
    select
        company_name,
        contact_full_name,
        sum(amount) as opportunity_amount
    from opp_acct_contact
    group by company_name, contact_full_name
)

select * from final
with

opp_acct_contact as (
    select * from {{ ref('opportunities_accounts_contacts_details') }}
    where state is not null
),

final as (
    select
        state,
        sum(amount) as opportunity_amount
    from opp_acct_contact
    group by state
)

select * from final
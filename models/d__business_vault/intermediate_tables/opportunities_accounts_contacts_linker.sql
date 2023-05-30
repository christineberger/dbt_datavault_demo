with 

hub_opp as (
    select * from {{ ref('hub_opportunities') }}
),

link_opp_acct as (
    select * from {{ ref('link_opportunity_account') }}
),

link_contact_acct as (
    select * from {{ ref('link_contact_account') }}
),

linked_hubs as (
    select
        hub_opp.oppurtunity_pk_hash,
        hub_opp.oppurtunityid,
        link_opp_acct.account_pk_hash,
        link_contact_acct.contact_pk_hash
    from hub_opp
    left join link_opp_acct
        on hub_opp.oppurtunity_pk_hash = link_opp_acct.oppurtunity_pk_hash
    left join link_contact_acct
        on link_opp_acct.account_pk_hash = link_contact_acct.account_pk_hash
)

Select * from linked_hubs
    
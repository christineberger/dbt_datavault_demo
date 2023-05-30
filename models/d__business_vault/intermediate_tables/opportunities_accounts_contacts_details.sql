with 

opp_acct_contact_link as (
    select * from {{ ref('opportunities_accounts_contacts_linker') }}
),

sat_opp as (
    select * from {{ ref('sat_opportunity_details') }}
),

sat_contact as (
    select * from {{ ref('sat_contact_details') }}
),

sat_acct as (
    select * from {{ ref('sat_account_details') }}
),

linked_hubs_w_details as (
    select
        opp_acct_contact_link.oppurtunity_pk_hash,
        opp_acct_contact_link.account_pk_hash,
        opp_acct_contact_link.contact_pk_hash,
        opp_acct_contact_link.oppurtunityid,

        sat_acct.company_name,
        sat_acct.city,
        sat_acct.state,

        sat_opp.amount,
        sat_opp.project_name,
        sat_opp.oppurtunity_name,
        sat_opp.stage,
        sat_opp.close_date,

        sat_contact.contactid,
        sat_contact.first_name,
        sat_contact.last_name,
        sat_contact.email,
        sat_contact.country,
        concat_ws(
            ' ', 
            sat_contact.first_name, 
            sat_contact.last_name
        ) as contact_full_name

    from opp_acct_contact_link
    left join sat_opp 
        on opp_acct_contact_link.oppurtunity_pk_hash = sat_opp.oppurtunity_pk_hash
    left join sat_contact
        on opp_acct_contact_link.contact_pk_hash = sat_contact.contact_pk_hash
    left join sat_acct
        on opp_acct_contact_link.account_pk_hash = sat_acct.account_pk_hash
)

Select * from linked_hubs_w_details
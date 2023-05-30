
{%- set source_model = ["v_salesforce_accounts"] -%}

{%- set src_pk = "ACCOUNT_PK_HASH" -%}
{%- set src_nk = "ACCOUNTID" -%}
{%- set src_ldts = "DATECREATED" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(
    src_pk=src_pk, 
    src_nk=src_nk, 
    src_ldts=src_ldts,
    src_source=src_source, source_model=source_model
) }}
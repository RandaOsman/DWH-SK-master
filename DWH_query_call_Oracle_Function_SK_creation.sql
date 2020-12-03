
/*
FOR EXAMPLE:
BUSINESS KEY = ACCOUNT_KEY
ACCOUNT_SK=ACCOUNT_ID
FUNCTION NAME: DWH_FN_SK
*/
case
  when ACCOUNT_ID is not null then  ACCOUNT_ID /* check if this key entered before in the target DWH tables  during previous loads; we got these IDs by joining the source table with the DWH target table using the business key to get the corresponding SK (ex:account_id) */
    when lag(ACCOUNT_KEY) over(order by ACCOUNT_KEY) is null
   or  ACCOUNT_KEY  <> lag(ACCOUNT_KEY ) over(order by ACCOUNT_KEY )
    then DWH_FN_SK (1) /* if this key doesnt exist within the same batch trigger the nextval for the created sequence to generate SK*/
    else DWH_FN_SK (0) /* if this key exists in the same batch and got a SK then the same SK will be assigned for the repeated key */
  end as ACCOUNT_ID

# DWH-SK
Consistency in Data Ware House keys for non-unique business keys

The surrogate key will be created in the  Data Ware House based n the business key that coming from source table if this business key is repeated on the same batch with a different transaction this will cause inconsistency in mapping the created surrogate key to the source business key 

to solve this issue:

1. open your DB engine (I used Oracle but it is the same concept on all DataBase engines)

2. create oracle function to handle current and next values by going to the DWH-SK file master branch > then copy the function from "Oracle_Function.sql" and paste the content into Oracle query window to create an Oracle function that handles the DWH surrogate key creation this function will have 2 indicators one to keep the current value and one to trigger the next value for new business keys.


3. call the created functions by going to the DWH-SK file master branch > then copy the case when statment from "DWH_query_call_Oracle_Function_SK_creation.sql" and paste it inside the SQL query that will run to get the daily basis data for DWH processing


    Note:
    the same mechanism can be applied on any DB engine 

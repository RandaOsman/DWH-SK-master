/*
the integer sequence shoulld be created first to generate the incremental value
for each nextval() trigger
create sequence SK_SEQUENCE start with 1 INCREMENT by 1 ;
*/
create or replace function DWH_FN_SK(
    pi_indicator integer)
  return number
as
begin
  if pi_indicator = 1 then
    return (SK_SEQUENCE.nextval);
  else
    return (SK_SEQUENCE.currval);
  end if;
end DWH_FN_SK ;

declare cursor c1 is select  * from temp_subve  where dflag is null and eflag is NOT null and length(name) < 70 order by id;
msubscriber_no number(10);

begin
            for xxx in  c1
loop   
begin       
select subscribeR_no into msubscriber_no from subscriber_client where UPPER(fullname) = UPPER(xxx.name);
exception 
when too_many_rows then
warn (xxx.name||'dupli'||xxx.id);
end;
update subscriber_client set cust_type = XXX.CATEGORY WHERE  SUBSCRIBER_NO = MSUBSCRIBER_NO;
END LOOP;
end;
/
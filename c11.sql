declare cursor c1 is select * from temp_subvep where 
mflag = 'de' ;
mcount number(10);

begin
mcount := 0;
for xxx in c1
loop
begin
dbms_output.put_line('ttt'||xxx.name);
select nvl(count(*),0) into mcount from subscriber_client 
where  upper(fullname) = upper(xxx.name) and substr(upper(res_address1),1,10) = substr(upper(xxx.add_),1,10);
dbms_output.put_line('aaa'||mcount);
exception
when no_data_Found then
update temp_subvep set  flag  = 'nf' where id = xxx.id;

end;

dbms_output.put_line('eezzz'||mcount);
if mcount  = 1 then
update temp_subvep set  flag  = '1e' where id = xxx.id;
else if mcount > 1 then
update temp_subvep set   flag  = mcount where id = xxx.id;
else if mcount = 0 then
update temp_subvep set   flag  = '0e' where id = xxx.id;
end if;
end if;
end if;
end loop;

end;
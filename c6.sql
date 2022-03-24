declare cursor c1 is select * from temp_subvep where 
mflag = 's' ;
mcount number(10);

begin
mcount := 0;
for xxx in c1
loop
select count(*) into mcount from subscriber_client 
where  upper(fullname) = upper(xxx.name)  and res_postcode = xxx.pin;

if mcount  = 1 then
update temp_subvep set  flag  = '1e' where id = xxx.id;
else if mcount > 1 then
update temp_subvep set   flag  = '2e' where id = xxx.id;
end if;
end if;
end loop;

end;
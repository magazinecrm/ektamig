declare cursor c1 is select * from subscriber_client where mdesc like '%plut%';
mphone varchar2(100);
begin
for xxx in c1

loop
select phone into mphone from temp_subvep where id = xxx.id;
update subscriber_client set phone = mphone where id = xxx.id;
end loop;
end;
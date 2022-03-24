declare cursor c1 is select * from subscriber_client where id is not null;
MCOUNT NUMBER(10);
begin
MCOUNT := 0;
for xxx in c1
loop

select count(fullname) INTO MCOUNT from subscriber_client where  UPPER(fullname) = UPPER(xxx.fullname) and id is null ;
if mcount  > 0 then
delete from subscriber_client where id = xxx.id;
update temp_subv set Mflag =  'S' WHERE ID = XXX.ID;
END IF;
end loop;

end;
declare cursor c1 is select * from temp_subvep where eflag is null;
MCOUNT NUMBER(10);
begin
MCOUNT := 0;
for xxx in c1
loop

select count(fullname) INTO MCOUNT from subscriber_client where  UPPER(fullname) = UPPER(xxx.name) ;
if mcount  > 0 then

update temp_subvep set Mflag =  'Y' WHERE ID = XXX.ID;
END IF;
end loop;

end;
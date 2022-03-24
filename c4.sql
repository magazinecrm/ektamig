declare cursor c1 is select * from temp_subvep where mflag is not null;
MCOUNT NUMBER(10);
mpin temp_subvep.pIn%type;
begin
MCOUNT := 0;
for xxx in c1
loop
BEGIN
select res_postcode  INTO mpin  from subscriber_client where  UPPER(fullname) = UPPER(xxx.name)  AND RES_POSTCODE = XXX.PIN;
EXCEPTION
WHEN NO_DATA_fOUND THEN 
update temp_subvep set Mflag ='D' WHERE ID = XXX.ID;
WHEN TOO_MANY_ROWS THEN
update temp_subvep set Mflag ='M' WHERE ID = XXX.ID;

END;


if mpin=xxx.pin  then

update temp_subvep set Mflag ='s' WHERE ID = XXX.ID;
else if mpin !=xxx.pin then
updatE temp_subvep set mflaG ='d' where id=xxX.id;
end iF;
END IF;

end loop;

end;
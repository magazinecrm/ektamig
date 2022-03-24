declare cursor c1 is select  * from temp_subvep  where mflag is null order by id;
msubscribe_no number(10);
mcontactno number(10);
mctn_no number(10);
begin
            for xxx in  c1
            loop
CONT_FILLNEW('OLDER','INR','RESIDENTIAL','SUBSCRIBER',NULL,
NULL,NULL,XXX.NAME,null,null,NULL,
NULL,NULL,
NULL,NULL,NULL,
NULL,XXX.ADD_,NULL,xxx.city,xxx.pin,
xxx.state,'INDIA',NULL,NULL,
NULL,XXX.PHONE,XXX.PHONE,null,
null,msubscribe_no,'e',
null,
null,
null,
null,
null,null,null,null,
mcontactno);

select g_ctn_no.currval  into mctn_no from dual;

insert into subscriber_client
(id,mdesc,AGENT_CODE,AGENT_NAME,agent_disc_percent,agent_rdisc_percent,ctn_No,
contact_no,magazine_no,company,fullname,phone,cellphone,designation,source,
tag,email,website,sex,sub_cat,
billing_address,shipping_address,bill_to,
off_address1,off_ADDRESS2,off_city,off_state,off_country,off_postcode,
res_address1,res_ADDRESS2,res_city,res_state,res_country,res_postcode,
other_address1,other_ADDRESS2,other_city,other_state,other_country,other_postcode,
CURRENCY)
values
(xxx.id,'expiredpluto',null,null,null,null,mctn_no,
null,2303,null,xxx.name,xxx.phone,null,null,'migration',
null,xxx.email,null,null,'LOCAL',
'RESIDENTIAL','RESIDENTIAL',null,
NULL,NULL,NULL,NULL,NULL,NULL,
XXX.ADD_,NULL,XXX.CITY,XXX.STATE,'INDIA',XXX.PIN,
NULL,NULL,NULL,NULL,NULL,NULL,
'INR');

END LOOP;
end;
/

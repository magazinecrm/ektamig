declare cursor c1 is 
select  * from temp_subcomp where mflag  = 'er' order by id;
msubscribe_no number(10);
msubscriber_no number(10);
mcontactno number(10);
mctn_no number(10);
mtarea varchar2(1000);
mres_add1 varchar2(1000);
mres_add2 varchar2(1000);
mres_city varchar2(1000);
mres_state varchar2(1000);
mres_postcode varchar2(1000);
mres_Country varchar2(1000);
mpostal varchar2(1000);
mcompany varchar2(1000);
mfullname varchar2(1000);
moffer subscribers.offer%type;
mcust_Type varchar2(100);
mtnof number(10);
mno varchar2(100);
msno varchar2(20);
mstartissue number(10);


begin
            for xxx in  c1
            loop
               warn('zzzzz');
                msubscriber_no  := find_sno(upper(xxx.name));  
                select cust_type,ctn_no,company,fullname,postal,tarea,res_address1,res_address2,res_city,res_state,res_postcode,res_country into
                mcust_type,mctn_no,mcompany,mfullname,mpostal,mtarea,mres_add1,mres_add2,mres_city,mres_state,mres_postcode,mres_Country
                from subscriber_client where subscriber_no = msubscriber_no;
                
                moffer := '3YEARCOMPLI';
               
            

            insert into subscribers
  (id,mdesc,paid_date,manual_pid,cust_Type,ctn_no,postal,ono,sub_status,membership_number,tran_type,subscriber_no,subscriber_type,company,fullname,res_address1,
                     res_address2,res_city,res_state,res_country,res_postcode,magazine_no,offer,
                     start_issue,end_issue,no_of_issues,no_of_Copies,tarea)
                     values 
(xxx.id,'acticyleCOMPLI',null,null,mcust_Type,mctn_no,mpostal,null,'ACTIVE','axmno',null,msubscriber_no,'COMPLI',mCOMPANY,mfullname,mres_add1,
                     mres_add2,mres_city,mres_state,mres_country,mres_postcode,2223,moffer,
                     25,
42,18,1,mtarea);
select gtino.currval into mtnof from dual;
select  d_subscription_seq2223.currval into msubscribe_no from dual;
create_member_er(mtnof,2223,'PAID','AUTOMATIC',NULL,NULL,Mctn_no,NULL,MNO,msno);
update subscribers set membership_number = mno where tno = mtnof;
--sub_ins(mtnof,2223,msubscribe_no,mstartissue,XXX.issues);
null;


 
END LOOP;
end;
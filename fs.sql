declare cursor c1 is 
select  * from temp_subvep where mflag = 'z' and name is  not null  order by id;
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
                select subscriber_no into msubscriber_no from subscriber_client 
where  upper(fullname) = upper(xxx.name) and upper(res_postcode) = upper(xxx.pin) and substr(res_address1,1,10) = substr(xxx.add_,1,10);
              --  msubscriber_no  := find_snopin(upper(xxx.name),upper(xxx.pin));  
                select cust_type,ctn_no,company,fullname,postal,tarea,res_address1,res_address2,res_city,res_state,res_postcode,res_country into
                mcust_type,mctn_no,mcompany,mfullname,mpostal,mtarea,mres_add1,mres_add2,mres_city,mres_state,mres_postcode,mres_Country
                from subscriber_client where subscriber_no = msubscriber_no;
                if  xxx.issues =  6 then
                moffer := '1YEAR425';
                ELSE IF XXX.ISSUEs = 12 THEN
                MOFFER := '2YEAR850';
                ELSE IF  XXX.ISSUEs = 18 THEN
                MOFFER := '3YEAR1250';
               END IF;
               END IF;
               END IF;
 /*
paid_date,


*/          

  
            insert into subscribers
  (paid_date,id,mdesc,manual_pid,cust_Type,ctn_no,postal,ono,sub_status,membership_number,tran_type,subscriber_no,subscriber_type,company,fullname,res_address1,
                     res_address2,res_city,res_state,res_country,res_postcode,magazine_no,offer,
                     start_issue,end_issue,no_of_issues,no_of_Copies,tarea)
                     values 
(to_date(xxx.receipt_date,'yyyy-mm-dd'),xxx.id,'expiredplutoforoes',xxx.SUB__REC__BILL_NO,mcust_Type,mctn_no,mpostal,null,'ACTIVE','axmno',null,msubscriber_no,'PAID',mCOMPANY,mfullname,mres_add1,
                     mres_add2,mres_city,mres_state,mres_country,mres_postcode,2303,moffer,
                     FINDISSUENO(SUBSTR(upper(xxx.START_ISSUE),5,3)||SUBSTR(upper(xxx.START_ISSUE),9,4),2303),
FINDISSUENO(SUBSTR(upper(xxx.END_ISSUE),5,3)||SUBSTR(upper(xxx.end_ISSUE),9,4),2303),XXX.issues,xxx.copies,mtarea);
select gtino.currval into mtnof from dual;
select  d_subscription_seq2303.currval into msubscribe_no from dual;
create_member_er(mtnof,2303,'PAID','AUTOMATIC',NULL,NULL,Mctn_no,NULL,MNO,msno);
update subscribers set membership_number = mno where tno = mtnof;
--sub_ins(mtnof,2303,msubscribe_no,mstartissue,XXX.issues);


 
END LOOP;
end;
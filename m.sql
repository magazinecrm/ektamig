 select id  ,mflag ,name,pin,add_ from temp_subvep where id in  (select id from temp_subvep
 minus
 select id from subscribers where mdesc like '%plut%')
/

declare cursor c1 is select * from subscribers where start_issue is not null and magazine_no =  2303;

begin
for xxx in c1
loop

sub_ins(xxx.tno,2303,xxx.subscribe_no,xxx.start_issue,XXX.no_of_issues);
end loop;


end;
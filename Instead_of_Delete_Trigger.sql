select * from tblworkers
select * from tblworkerDept

select * from vWworkerDetails

create trigger tr_vWworkerDetails_InsteadOfDelete
on vWworkerDetails
instead of delete
as
begin
		delete tblworkers
		from   tblworkers
		join   deleted
		on	   tblworkers.Id = deleted.Id

		-- using subQuerry
		-- delete from tblworkers
		-- where Id in (Select Id from deleted)
end

delete from vWworkerDetails where Id in (6,7)
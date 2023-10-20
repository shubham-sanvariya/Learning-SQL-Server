select * from vWworkerDetails
select * from tblworkerDept
select * from tblworkers

create trigger tr_vWworkerDetails_InsteadOfUpdate
on vWworkerDetails
instead of update
as
begin
		-- if employeeId is updated
		if(update(Id))
		begin
			Raiserror('Id cannot be changed', 16, 1)
			return
		end

		-- if DeptName is updated
		if(update(DeptName))
		begin
			declare @DeptId int

			select @DeptId = DeptId
			from	tblworkerDept
			join	inserted
			on		inserted.DeptName = tblworkerDept.DeptName

			if(@DeptId is null)
			begin
				Raiserror('Invalid Department Name', 16, 1)
				return
			end

			update tblworkers set DepartmentId = @DeptId
			from	inserted
			join	tblworkers
			on		tblworkers.Id = inserted.Id
		end

		-- if gender is updated
		if(UPDATE(Gender))
		begin
			update tblworkers set Gender = inserted.Gender
			from    inserted
			join	tblworkers
			on		tblworkers.Id = inserted.Id
		end

		-- if name is updated
		if(UPDATE(Name))
		begin
			update tblworkers set Name = inserted.Name
			from	inserted
			join	tblworkers
			on		tblworkers.Id = inserted.Id
		end
end

update vWworkerDetails set Name = 'Johnny', Gender = 'Female',
DeptName = 'IT' where Id = 1
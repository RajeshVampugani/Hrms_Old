USE [ABMauriLive]
GO
/****** Object:  StoredProcedure [dbo].[sp_Rb_insert_payhead]    Script Date: 07/31/2015 17:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_Rb_insert_payhead]
	(
	@payheadname varchar(50),
	@description varchar(50),
	@isattach int,
	@createby varchar(50),
	@category int
	)
AS
BEGIN
if not exists (select * from tbl_Rb_PayHead where Name=@payheadname and Type=@category and Status=1)
insert into tbl_Rb_PayHead (Type,Name,Description,IsAttach,CreatedBy,CreatedDate,Status)
values(@category,@payheadname,@description,@isattach,@createby,GETDATE(),1)
END

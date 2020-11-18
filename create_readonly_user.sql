--Create Read_only_Access_Role
USE dgodb;
CREATE ROLE [Read_Only_Access] AUTHORIZATION dbo
GO
GRANT SELECT ON SCHEMA ::dbo TO Read_Only_Access
GO

--Create read_only_login
USE MASTER;
GO
CREATE LOGIN [dgo_readonly_login] WITH PASSWORD=N'Ch@nge@o20'
GO

--Create read_only_user
USE dgodb;
CREATE USER dgo_readonly_user
	FOR LOGIN dgo_readonly_login
	WITH DEFAULT_SCHEMA = dbo
GO

--Add user to readonly role
USE dgodb;
GO
EXEC sp_addrolemember N'Read_Only_Access', N'dgo_readonly_user'
GO

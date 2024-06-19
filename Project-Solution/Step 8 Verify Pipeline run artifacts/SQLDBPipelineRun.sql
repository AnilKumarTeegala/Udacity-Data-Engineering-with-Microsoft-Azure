select '[dbo].[NYC_Payroll_AGENCY_MD]', count(*) from [dbo].[NYC_Payroll_AGENCY_MD]
UNION
select '[dbo].[NYC_Payroll_EMP_MD]', count(*) from [dbo].[NYC_Payroll_EMP_MD]
UNION
select '[dbo].[NYC_Payroll_TITLE_MD]', count(*) from [dbo].[NYC_Payroll_TITLE_MD]
UNION
select '[dbo].[NYC_Payroll_Data_2020]', count(*) from [dbo].[NYC_Payroll_Data_2020]
UNION
select '[dbo].[NYC_Payroll_Data_2021]', count(*) from [dbo].[NYC_Payroll_Data_2021]



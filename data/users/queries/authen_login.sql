DECLARE @return_value int,
@outputNumber int,
@outputResult nvarchar(50) EXEC @return_value = [dbo].[LoginProcedure] @inputUsername = @paramUserName,
@inputPassword = @paramPassWord,
@outputNumber = @outputNumber OUTPUT,
@outputResult = @outputResult OUTPUT
SELECT
    @outputNumber as N'outputNumber',
    @outputResult as N'outputResult';

SELECT
    'Return Value' = @return_value;

SELECT
    @outputNumber as N'outputNumber',
    @outputResult as N'outputResult';

SELECT
    dbo.[UserLogin].username,
    dbo.[UserLogin].pswd,
    dbo.[UserLogin].ngay_tao,
    Self_1.adress,
    Self_1.create_date,
    Self_1.date_of_birth,
    Self_1.document_issue_date,
    Self_1.document_number,
    Self_1.document_type,
    Self_1.email,
    Self_1.employee_image,
    Self_1.employees_code,
    Self_1.gender,
    Self_1.is_active,
    Self_1.is_follow,
    Self_1.is_working,
    Self_1.layoff_date,
    Self_1.position_code,
    Self_1.start_work_date,
    Self_1.telephone,
    Employees_1.employees_code,
    Employees_1.email,
    Employees_1.employees_name,
    Employees_1.telephone
FROM
    [DSGAppraisalSoftwareX].[dbo].[UserLogin]
    LEFT JOIN [DSGAppraisalSoftwareX].[dbo].[Employees] AS Self_1 ON [DSGAppraisalSoftwareX].[dbo].[UserLogin].[ma_nhan_vien] = Self_1.[employees_code]
    LEFT JOIN [DSGAppraisalSoftwareX].[dbo].[Employees] AS Employees_1 ON [DSGAppraisalSoftwareX].[dbo].[UserLogin].[nguoi_them] = Employees_1.[employees_code]
WHERE
    [dbo].[UserLogin].username = @outputResult;

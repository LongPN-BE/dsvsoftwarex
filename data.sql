
use master 

go 
IF DB_ID('DSGAppraisalSoftwareX') IS NOT NULL
    DROP DATABASE DSGAppraisalSoftwareX;

go
--create database DSGAppraisalSoftware
create database DSGAppraisalSoftwareX

go
--use DSGAppraisalSoftware
use DSGAppraisalSoftwareX

go
create table AssetTypes
(
	ID int identity(1,1) primary key,
	asset_type_code nvarchar(20) not null unique,
	asset_type_name nvarchar(255) not null,	
	descriptionz text,
	is_follow bit not null default 1, 
	create_date date not null default getdate(),
)

go 
insert into AssetTypes (asset_type_code,asset_type_name,descriptionz)
values		('AT001',N'Bất động sản',N'Bao gồm đất, nhà, công trình xây dựng...'),
			('AT002',N'Tài sản cố định',N'Gồm máy móc, thiết bị, phương tiện vận tải, tài sản hữu hình khác.'),
			('AT003',N'Tài sản tài chính',N'Cổ phiếu, trái phiếu, các giấy tờ có giá...'),
			('AT004',N'Tài sản vô hình',N'Bao gồm bản quyền, thương hiệu, phần mềm...'),
			('AT005',N'Tài sản khác',N'Các tài sản còn lại không thuộc các nhóm trên.');

	--('AT001',N'Bất động sản',N'Bất động sản (Real Estate)'),
	--('AT001',N'Bất động sản',N'Bất động sản (Real Estate)'),
	--('AT002',N'Tài sản vô hình',N'Tài sản vô hình (Intangible Assets)'),
	--('AT003',N'Tài sản tài chính',N'Tài sản tài chính (Financial Assets)'),
	--('AT004',N'Tài sản cố định',N'Tài sản cố định (Fixed Assets)'),
	--('AT005',N'Tài sản thương mại',N'Tài sản thương mại (Commercial Assets)'),
	--('AT006',N'Tài sản tiêu dùng',N'Tài sản tiêu dùng (Consumer Goods)'),
	--('AT007',N'Tài sản tự nhiên',N'Tài sản tự nhiên (Natural Assets)'),
	--('AT008',N'Tài sản tài chính',N'Tài sản tài chính (Financial Assets)'),
	--('AT009',N'Tài sản tư pháp',N'Tài sản tư pháp (Legal Assets)'),
	--('AT010',N'Tài sản sản xuất',N'Tài sản sản xuất (Production Assets)'),
	--('AT011',N'Tài sản không tài chính',N'Tài sản không tài chính (Non-financial Assets)'),

go

go
create table Vocative -- xưng hô 
(
	ID int identity(1,1) primary key,
	vocative_code nvarchar(20) not null unique,
	vocative_name nvarchar(255) not null,	
	descriptionz text,
	is_follow bit not null default 1, 
	create_date date not null default getdate(),
)

go 
insert into Vocative(vocative_code,vocative_name)
values	('VC001',N'Ông'),
		('VC002',N'Bà'),
		('VC003',N'Anh'),
		('VC004',N'Chị'),
		('VC005',N'Bạn'),
		('VC006',N'Mr'),
		('VC007',N'Miss'),
		('VC008',N'Mrs'),
		('VC009',N'Ông bà'),
		('VC010',N'Anh chị');

go
create table EmployeePosioson
( 
    ID int identity(1,1) primary key,
    position_code nvarchar(20) not null unique,
    position_name nvarchar(255) not null,
    descriptions nvarchar(255),
	is_follow bit not null default 1, 
	create_date date not null default getdate(),
);

go
insert into EmployeePosioson(position_code,position_name,descriptions) 
	values
		('EP000',N'Admin',N'Admin'),
		('EP001',N'Chuyên Viên Thẩm Định (Appraiser)',N''),
		('EP002',N'Quản Lý Thẩm Định (Appraisal Manager)',N''),
		('EP003',N'Chuyên Gia Thẩm Định Bất Động Sản (Real Estate Appraisal Specialist)',N''),
		('EP004',N'Chuyên Gia Thẩm Định Tài Sản Cố Định (Fixed Asset Appraisal Specialist)',N''),
		('EP005',N'Chuyên Gia Thẩm Định Tài Sản Tài Chính (Financial Asset Appraisal Specialist)',N''),
		('EP006',N'Quản Lý Rủi Ro (Risk Manager)',N''),
		('EP007',N'Chuyên Gia Pháp Lý (Legal Expert)',N''),
		('EP008',N'Chuyên Gia Thẩm Định Tài Sản Vô Hình (Intangible Asset Appraisal Specialist)',N''),
		('EP009',N'Quản Lý Thẩm Định Chi Nhánh (Branch Appraisal Manager)',N''),
		('EP010',N'Chuyên Gia Thẩm Định Chuỗi Cung Ứng (Supply Chain Appraisal Specialist)',N'');	

go
create table Employees
(
	ID int identity(1,1) primary key,
	employees_code nvarchar(20) not null unique,
	employees_name nvarchar(255) not null,
	document_type nvarchar(20),
    document_number nvarchar(255),
	document_issue_date date default null,
	email nvarchar(100),
	adress nvarchar(max),
	gender bit not null default 1,
	telephone nvarchar(20),
	date_of_birth date default null,
	
	-- nếu làm cho quỹ tín dụng thì không cần ngân hàng, vì bên đó có pm kế toán riêng rồi 
    --bank_code nvarchar(20),
    --bank_account_number nvarchar(20),
    --bank_account_holder_name nvarchar(max),
    --bank_branch_name nvarchar(200),

	position_code nvarchar(20) not null, 
	employee_image varbinary(max) default null,
	is_active bit not null default 1,
	is_working bit not null default 1,
	is_follow bit not null default 1,
	create_date date not null default getdate(),
	start_work_date date default null,
	layoff_date date default null, 

	foreign key (position_code) references EmployeePosioson(position_code),
)
go 
INSERT INTO Employees (employees_code, employees_name, document_type, document_number, document_issue_date, email, adress, gender, telephone, date_of_birth, position_code)
VALUES
('NV000', N'Admin', NULL, NULL, NULL, NULL, NULL, 1, NULL, getdate(), 'EP000'),
('NV001', N'Nguyễn Văn A', 'CCCD', '0123456789', '2020-01-01', 'anguyena@gmail.com', N'Hà Nội', 1, '0123456789', '1990-01-01', 'EP009'),
('NV002', N'Trần Thị B', 'CCCD', '0223456788', '2018-05-05', 'btranthib@gmail.com', N'HCM', 0, '0987654321', '1995-03-03', 'EP010'),
('NV003', N'Lê Văn C', N'Hộ chiếu', '0323456789', '2022-02-15', 'lecvan@gmail.com', N'Đà Nẵng', 1, '0911122233', '1988-07-07', 'EP007');

go 
create table CustomerTypes
(
	ID int identity(1,1) primary key,
	customer_type_code nvarchar(20) not null unique,
    customer_type_name nvarchar(255) not null, 
	descriptions text,
	is_defaulit  bit not null default 0,
	is_follow bit not null default 1, 
	create_date date not null default getdate(),
) 

go 
insert into CustomerTypes(customer_type_code,customer_type_name,descriptions)
values 
		('CT001',N'Khách vãng lai',N''),
		('CT002',N'Khách mới',N''),
		('CT003',N'Khách hàng thường xuyên',N''),
		('CT004',N'Khách hàng VIP',N''),
		('CT005',N'Khách hàng chính phủ và tổ chức phi lợi nhuận',N''),
		('CT006',N'Khách hàng chuyên nghiệp',N''),
		('CT007',N'Khách hàng doanh nghiệp',N''),
		('CT008',N'Khách hàng thương mại',N''),
		('CT000',N'Khách hàng cá nhân',N'');

go
CREATE TABLE PriorityLevels
(
	ID int identity(1,1) primary key,
	priority_code nvarchar(20) not null unique,
	priority_name nvarchar(255) not null,
	descriptions nvarchar(500),
);

-- Thêm dữ liệu mẫu
INSERT INTO PriorityLevels (priority_code, priority_name, descriptions)
VALUES	('PL001',N'Độ ưu tiên thấp',N''), 
		('PL002',N'Độ ưu tiên khá thấp',N''),
		('PL003',N'Độ ưu tiên trung bình',N''),
		('PL004',N'Độ ưu tiên khá cao',N''),
		('PL005',N'Độ ưu tiên cao',N''),
		('PL006',N'Độ ưu tiên rất cao',N''),
		('PL007',N'Độ ưu tiên rất gấp',N'');

go
create table Customer
(
	ID int identity(1,1) primary key,
	customer_code nvarchar(20) not null unique,
    customer_name nvarchar(255) not null, 
	descriptions text,
	email nvarchar(50),
	tax_code nvarchar(20),
	adress nvarchar(max),
	vocative nvarchar(20) not null,

	-- khách hàng cá nhân
	personal_documents_type nvarchar(20),
    personal_document_number nvarchar(255),
	personal_document_issue_date date,
	gender bit not null default 1,
	telephone nvarchar(20),
	date_of_birth date,

	-- nếu làm cho quỹ tín dụng thì không cần ngân hàng, vì bên đó có pm kế toán riêng rồi 
    --bank_code nvarchar(20),
    --bank_account_number nvarchar(20),
    --bank_account_holder_name nvarchar(max),
    --bank_branch_name nvarchar(200),
	 
	 -- khách hàng doanh nghiệp
	fax nvarchar(20), 
	website nvarchar(255), 
	customer_type nvarchar(20) not null,
	is_organize bit not null default 0,
	contact_person  nvarchar(255), 
	contact_person_telephone nvarchar(20),


	is_working bit not null default 1,
	is_follow bit not null default 1, 
	create_date date not null default getdate(),
	employee_added nvarchar(20) not null,

	foreign key (vocative) references Vocative(vocative_code),
	foreign key (customer_type) references CustomerTypes(customer_type_code),
	foreign key (employee_added) references Employees(employees_code),
)


go
create table nguoi_mo_gioi 
(
	ID int identity(1,1) primary key,
	ma_tai_san nvarchar(20) not null unique,
    ten_tai_san nvarchar(255) not null, 

	loai_giay_to nvarchar(20),
    so_giay_to nvarchar(255),
	ngay_cap date default null,
	email nvarchar(100),
	dia_chi nvarchar(max),
	gioi_tinh bit not null default 1,
	dien_thoai nvarchar(20),
	ngay_sinh date default null,
	
	-- nếu làm cho quỹ tín dụng thì không cần ngân hàng, vì bên đó có pm kế toán riêng rồi 
    --bank_code nvarchar(20),
    --bank_account_number nvarchar(20),
    --bank_account_holder_name nvarchar(max),
    --bank_branch_name nvarchar(200),
	  
	is_active bit not null default 1,
	is_working bit not null default 1,
	is_follow bit not null default 1,
	create_date date not null default getdate()
)
go

-- Thêm 5 dòng dữ liệu mẫu vào bảng nguoi_mo_gioi
INSERT INTO nguoi_mo_gioi (ma_tai_san, ten_tai_san, loai_giay_to, so_giay_to, ngay_cap, email, dia_chi, gioi_tinh, dien_thoai, ngay_sinh)
VALUES
    ('NMG001', N'Môi giới 001', 'CMND', '123456789', '2020-01-01', 'email1@example.com', 'Địa chỉ 1', 1, '0123456789', '1990-01-01'),
    ('NMG002', N'Môi giới 002', 'CCCD', '987654321', '2021-02-02', 'email2@example.com', 'Địa chỉ 2', 0, '0987654321', '1985-02-02'),
    ('NMG003', N'Môi giới 003', 'CMND', '111222333', '2019-03-03', 'email3@example.com', 'Địa chỉ 3', 1, '0111222333', '1995-03-03'),
    ('NMG004', N'Môi giới 004', 'CCCD', '444555666', '2022-04-04', 'email4@example.com', 'Địa chỉ 4', 0, '0444555666', '1980-04-04'),
    ('NMG005', N'Môi giới 005', 'CMND', '777888999', '2020-05-05', 'email5@example.com', 'Địa chỉ 5', 1, '0777888999', '1998-05-05'),
    ('NMG006', N'Môi giới 006', 'CMND', '123456789', '2020-01-01', 'email1@example.com', 'Địa chỉ 6', 1, '0123456789', '1990-01-01'),
    ('NMG007', N'Môi giới 007', 'CCCD', '987654321', '2021-02-02', 'email2@example.com', 'Địa chỉ 7', 0, '0987654321', '1985-02-02'),
    ('NMG008', N'Môi giới 008', 'CMND', '111222333', '2019-03-03', 'email3@example.com', 'Địa chỉ 8', 1, '0111222333', '1995-03-03'),
    ('NMG009', N'Môi giới 009', 'CCCD', '444555666', '2022-04-04', 'email4@example.com', 'Địa chỉ 9', 0, '0444555666', '1980-04-04'),
    ('NMG010', N'Môi giới 010', 'CMND', '777888999', '2020-05-05', 'email5@example.com', 'Địa chỉ 10', 1, '0777888999', '1998-05-05');


go
create table TaiSan
(
	ID int identity(1,1) primary key,
	ma_tai_san nvarchar(20) not null unique,
    ten_tai_san nvarchar(255) not null, 
	mo_ta nvarchar(255),
	ngay_dinh_gia date not null default getdate(),
	chu_so_huu nvarchar(20) not null,
	loai_tai_san nvarchar(20) not null, 

	is_follow bit not null default 1,
	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),

	
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (chu_so_huu) references Customer (customer_code),
	foreign key (loai_tai_san) references AssetTypes (asset_type_code)
)

go
create table hinh_anh_tai_san 
(
	ID int identity(1,1) primary key,
	ma_hinh_anh nvarchar(20) not null unique,
	ten_hinh_anh nvarchar(255) not null, 
	ma_tai_san  nvarchar(20) not null,
	mo_ta nvarchar(255),
	hinh_anh varbinary(max),

	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),	
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (ma_tai_san) references TaiSan(ma_tai_san),-- nvarchar(20) not null unique,
)

--AssetTypes (asset_type_code,
go
create table loai_ke_hoach_tham_dinh
(
	ID int identity(1,1) primary key,
	ma_loai_ke_hoach nvarchar(20) not null unique,
    ten_loai_ke_hoach nvarchar(255) not null, 
	loai_tai_san nvarchar(20) not null,
	mo_ta nvarchar(255),

	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (loai_tai_san) references AssetTypes (asset_type_code),
)


go
-- Thêm dữ liệu mẫu vào bảng loai_ke_hoach_tham_dinh
INSERT INTO 
	loai_ke_hoach_tham_dinh (ma_loai_ke_hoach, ten_loai_ke_hoach, loai_tai_san, mo_ta, nguoi_them)
VALUES
	-- bất động sản 
	('LKHTD001', N'Xem xét giấy tờ pháp lý, quyền sở hữu',		N'AT001', N'Xem xét giấy tờ pháp lý, quyền sở hữu',			N'NV001'),
	('LKHTD002', N'Đánh giá vị trí, khu vực',					N'AT001', N'Đánh giá vị trí, khu vực',						N'NV001'),
	('LKHTD003', N'Xác định diện tích sử dụng',					N'AT001', N'Xác định diện tích sử dụng',					N'NV001'),
	('LKHTD004', N'Định giá theo giá thị trường',				N'AT001', N'Định giá theo giá thị trường',					N'NV002'),
	('LKHTD005', N'Định giá theo diện tích xây dựng',			N'AT001', N'Định giá theo diện tích xây dựng',				N'NV002'),
	('LKHTD006', N'Định giá theo hạ tầng xung quanh',			N'AT001', N'Định giá theo hạ tầng xung quanh',				N'NV002'),
	('LKHTD007', N'Định giá theo chi phí xây dựng...',			N'AT001', N'Định giá theo chi phí xây dựng...',				N'NV002'),
	('LKHTD008', N'Xác định đặc điểm địa hình ',				N'AT001', N'Xác định đặc điểm địa hình ',					N'NV003'),
	('LKHTD009', N'Xác định quy hoạch sử dụng đất',				N'AT001', N'Xác định quy hoạch sử dụng đất',				N'NV003'),
	('LKHTD010', N'Xác định chất lượng xây dựng',				N'AT001', N'Xác định chất lượng xây dựng',					N'NV003'),
	('LKHTD011', N'Xác định tuổi đời của công trình',			N'AT001', N'Xác định tuổi đời của công trình',				N'NV003'),
	('LKHTD012', N'Xác định tiện ích xung quanh',				N'AT001', N'Xác định tiện ích xung quanh',					N'NV003'),
	('LKHTD013', N'Xác định giấy tờ pháp lý',					N'AT001', N'Xác định giấy tờ pháp lý',						N'NV003'),
	('LKHTD014', N'So sánh với khu vực lân cận',				N'AT001', N'So sánh với khu vực lân cận',					N'NV001'),

	--Tài sản cố định 
	('LKHTD015', N'Xác định năm sản xuất',						N'AT002', N'Xác định năm sản xuất',							N'NV002'),
	('LKHTD016', N'Xác định tình trạng sử dụng',				N'AT002', N'Xác định tình trạng sử dụng',					N'NV003'),
	('LKHTD017', N'Tính toán mức độ hư hỏng',					N'AT002', N'Tính toán mức độ hư hỏng',						N'NV003'),
	('LKHTD018', N'Tính toán tỷ lệ hao mòn',					N'AT002', N'Tính toán tỷ lệ hao mòn',						N'NV003'),
	('LKHTD019', N'So sánh với giá trị thiết bị tương đương',	N'AT002', N'So sánh với giá trị thiết bị tương đương',		N'NV001'),
	('LKHTD020', N'Ước tính giá trị còn lại có thể sử dụng',	N'AT002', N'Ước tính giá trị còn lại có thể sử dụng',		N'NV001'),
	('LKHTD021', N'Định giá theo giá thị trường',				N'AT002', N'Định giá theo giá thị trường',					N'NV002'),
	('LKHTD022', N'Đánh giá hiệu quả sử dụng',					N'AT002', N'Đánh giá hiệu quả sử dụng',						N'NV003'),

	--: chứng khoán, cổ phiếu, trái phiếu
	--Tài sản tài chính
	('LKHTD023', N'Xác định loại hình tài sản',						N'AT003', N'Xác định loại hình tài sản',					N'NV002'),
	('LKHTD024', N'Đánh giá tình hình tài chính tổ chức phát hành',	N'AT003', N'Đánh giá tình hình tài chính tổ chức phát hành',N'NV002'),
	('LKHTD025', N'Tham khảo giá giao dịch thị trường',				N'AT003', N'Tham khảo giá giao dịch thị trường',			N'NV003'),
	('LKHTD026', N'Xác định giá trị thực tế quyền lợi nắm giữ',		N'AT003', N'Xác định giá trị thực tế quyền lợi nắm giữ',	N'NV003'),
	('LKHTD027', N'Xác định dòng cổ tức hoặc lãi suất',				N'AT003', N'Xác định dòng cổ tức hoặc lãi suất',			N'NV002'),
	('LKHTD028', N'Xác định giá trị thực của các giấy tờ đầu tư',	N'AT003', N'Xác định giá trị thực của các giấy tờ đầu tư',	N'NV002'),
	('LKHTD029', N'Xác định danh mục đầu tư',						N'AT003', N'Xác định danh mục đầu tư',						N'NV003'),
	('LKHTD030', N'Đánh giá triển vọng ngành',						N'AT003', N'Đánh giá triển vọng ngành',						N'NV002'),
	('LKHTD031', N'So sánh với cổ phiếu/trái phiếu tương đương',	N'AT003', N'So sánh với cổ phiếu/trái phiếu tương đương',	N'NV002'),

	--Tài sản vô hình
	('LKHTD032', N'Giấy tờ pháp lý',								N'AT004', N'Giấy tờ pháp lý',								N'NV003'),
	('LKHTD033', N'Thời hạn còn lại',								N'AT004', N'Thời hạn còn lại',								N'NV003'),
	('LKHTD034', N'Giá trị thương mại',								N'AT004', N'Giá trị thương mại',							N'NV002'),
	('LKHTD035', N'Phương pháp bảo vệ',								N'AT004', N'Phương pháp bảo vệ',							N'NV003'),
	('LKHTD036', N'Giá trị thực tế quyền lợi nắm giữ',				N'AT004', N'Giá trị thực tế quyền lợi nắm giữ',				N'NV003'),
	('LKHTD037', N'Giá giao dịch thị trường của tài sản',			N'AT004', N'Giá giao dịch thị trường của tài sản',			N'NV003'),
	('LKHTD038', N'Kiểm tra giấy tờ pháp lý',						N'AT004', N'Kiểm tra giấy tờ pháp lý',						N'NV003'),
	('LKHTD039', N'Định giá mức độ độc quyền, thị phần',			N'AT004', N'Định giá dựa trên mức độ độc quyền, thị phần',	N'NV003'),
	('LKHTD040', N'Xác định khả năng sinh lời, thu nhập',			N'AT004', N'Xác định khả năng sinh lời, thu nhập',			N'NV003'),
	('LKHTD041', N'So sánh với các tài sản vô hình tương tự',		N'AT004', N'So sánh với các tài sản vô hình tương tự',		N'NV003'),
	('LKHTD042', N'Đánh giá giá trị thương hiệu, uy tín',			N'AT004', N'Đánh giá giá trị thương hiệu, uy tín',			N'NV003'),

	--Tài sản khác
	('LKHTD043', N'Ý kiến đánh giá',								N'AT005', N'Ý kiến đánh giá',								N'NV003'), 
	('LKHTD044', N'Số tờ, thửa đất',								N'AT001', N'Số tờ, thửa đất',								N'NV003'),
	('LKHTD045', N'Định vị',										N'AT001', N'Định vị',										N'NV003'),
	('LKHTD046', N'Mục đích sử dụng',								N'AT001', N'Mục đích sử dụng',								N'NV003');

go
create table HoSoThamDinh
(
	ID int identity(1,1) primary key,
	ma_ho_so nvarchar(20) not null unique,
	tieu_de_ho_so nvarchar(20) default null,
	mo_ta nvarchar(500) default null, 
	muc_dich_tham_dinh nvarchar(300),
	hinh_anh_thong_bao_tham_dinh varbinary(max),
	thoi_gian_tham_dinh date not null default getdate(),
	da_duyet bit not null default 0,
	nguoi_duyet nvarchar(20) not null, 
	
	do_uu_tien_ho_so nvarchar(20) not null default 'PL003',
	nhan_vien_tiep_nhan_ho_so nvarchar(20) not null,

	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),
	foreign key (nguoi_duyet) references Employees(employees_code),
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (nhan_vien_tiep_nhan_ho_so) references Employees(employees_code),
	foreign key (do_uu_tien_ho_so) references PriorityLevels(priority_code),--('PL001',
);

go 
create table ChiTietHoSoThamDinh
(
	ID int identity(1,1) primary key,
	ma_chi_tiet nvarchar(20) not null unique,
	mo_ta nvarchar(255),
	ma_ho_so nvarchar(20) not null,
	ma_tai_san nvarchar(20) not null,
	so_tien decimal not null default 0,
	chi_phi_tham_dinh decimal not null default 0,
	foreign key (ma_ho_so) references HoSoThamDinh(ma_ho_so),
	foreign key (ma_tai_san) references TaiSan(ma_tai_san),
)

go 
create table NguoiThamDinhTheoHoSo
(
	ID int identity(1,1) primary key,
	ma_ho_so nvarchar(20) not null,
	mo_ta nvarchar(20) not null,
	nguoi_tham_dinh nvarchar(20) not null,
	
	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),
	foreign key (ma_ho_so) references HoSothamDinh(ma_ho_so),
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (nguoi_tham_dinh) references Employees(employees_code),
)
go

create table NguonThamKhao
(
	ID int identity(1,1) primary key,
	ma_tham_khao nvarchar(20) not null,
	mo_ta nvarchar(20) not null,
	tinh_trang nvarchar(20), 
	nguoi_cung_cap_thong_tin nvarchar(255),
	sdt_nguoi_cung_cap nvarchar(20),
	ngay_thu_thap_thong_tin date not null default getdate(),
	link_nguon_thao_khao text,
	gia_tri decimal not null default 0,
	ma_tai_san nvarchar(20) not null,

	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (ma_tai_san) references TaiSan(ma_tai_san),
)

go

-- để thêm vào danh sách các tiêu chí để thẩm định cho 1 sản phẩm 
create table KeHoachThamDinh
(
	ID int identity(1,1) primary key,
	ma_ke_hoach nvarchar(20) not null unique,
	ten_ke_hoach nvarchar(200),
	mo_ta_ke_hoach nvarchar(200),

	ma_tai_san nvarchar(20) not null,
	loai_ke_hoach nvarchar(20) not null,

	da_tham_dinh bit not null default 0, 
	duoc_duyet bit not null default 0,

	gia_tri decimal not null default 0,
	ket_qua text default null,

	dat_chuan bit not null default 0,
	is_huy_bo bit not null default 0,

	so_tien_dinh_gia_cho_ke_hoach decimal not null default 0,
	so_tien_tru_hao_do_hu_hao decimal not null default 0,
	
	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),
	

	foreign key (loai_ke_hoach) references loai_ke_hoach_tham_dinh (ma_loai_ke_hoach),
	foreign key (ma_tai_san) references TaiSan(ma_tai_san),
	foreign key (nguoi_them) references Employees(employees_code),
)

go 
create table ChiTietKeHoachThamDinh
(
	ID int identity(1,1) primary key,
	ma_ho_so nvarchar(20) not null,
	ma_ke_hoach nvarchar(20) not null,

	foreign key (ma_ke_hoach) references KeHoachThamDinh(ma_ke_hoach),
	foreign key (ma_ho_so) references HoSoThamDinh(ma_ho_so),
)

go
create table phieu_yeu_cau_tham_dinh
(
	ID int identity(1,1) primary key,
	ma_yeu_cau_tham_dinh nvarchar(20) not null unique,
	customer_code nvarchar(20) not null,
	ma_tai_san nvarchar(20) not null,
	giay_uy_quyen varbinary(MAX),
	so_luong_tai_san int not null default 1,
	ngay_yeu_cau date not null default getdate(), 

	trang_thai bit not null default 1,
	da_duyet bit not null default 0,

	is_follow bit not null default 1, 
	nguoi_them nvarchar(20) not null,
	create_date date not null default getdate(),

	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (customer_code) references Customer (customer_code),
	foreign key (ma_tai_san) references TaiSan (ma_tai_san),
)

--select * from Vocative
--select * from EmployeePosioson
--select * from Employees
--select * from CustomerTypes
--select * from AssetTypes
--select * from loai_ke_hoach_tham_dinh

---- thêm các giá trị này 
--select * from AssetTypes
--select * from CustomerTypes
--select * from Employees
--select * from Customer
--select * from TaiSan
--select * from loai_ke_hoach_tham_dinh
--select * from HoSoThamDinh

--select * from KeHoachThamDinh
--select * from ChiTietHoSoThamDinh
--select * from ChiTietKeHoachThamDinh

go 
-- Thêm dữ liệu mẫu vào bảng Customer
INSERT INTO Customer 
		(customer_code, customer_name,  descriptions, email, tax_code, adress, 
		 vocative, personal_documents_type, 
		 personal_document_number, personal_document_issue_date, 
		 gender, telephone, 
		 date_of_birth, fax, 
		 website, customer_type, 
		 is_organize, contact_person, contact_person_telephone, is_working,  is_follow, create_date, employee_added)
VALUES
		('CUST001', 'ABC Company', 'Description for ABC Company', 'abc@example.com', '123456789', '123 Main Street, City A', 
		'VC006', 'ID Card', 
		'123456789', '2022-01-01', 
		1, '123456789', 
		'1990-01-01', '123456789', 
		'www.abc.com', 'CT001', 1, 'John Doe', '987654321', 1, 1, GETDATE(), 'NV001'),
		
		('CUST002', 'XYZ Corporation', 'Description for XYZ Corporation', 'xyz@example.com', '987654321', '456 Oak Street, City B', 
		'VC007', 'Passport', 
		'987654321', '2022-02-01',
		0, '987654321', 
		'1985-05-15', '987654321', 
		'www.xyzcorp.com', 'CT002', 1, 'Jane Smith', '123456789', 1, 1, GETDATE(), 'NV002');

go
-- Tạo dữ liệu cho bảng Customer
INSERT INTO Customer (customer_code, customer_name, descriptions, email, tax_code, adress, vocative,
                      personal_documents_type, personal_document_number, personal_document_issue_date, gender, telephone, date_of_birth,
                      fax, website, customer_type, is_organize, contact_person, contact_person_telephone, employee_added)
		VALUES
		('CUST003', 'Customer 1', 'Description 1', 'email1@example.com', '1234567890', 'Address 1', 'VC006',
		 'CMND', '123456789', '2022-01-01', 1, '0123456789', '1990-01-01', '1234', 'www.customer1.com', 'CT003', 0, 'Contact Person 1', '0987654321', 'NV001'),
		('CUST004', 'Customer 2', 'Description 2', 'email2@example.com', '9876543210', 'Address 2', 'VC007',
		 'CCCD', '987654321', '2022-02-02', 0, '0987654321', '1985-02-15', '5678', 'www.customer2.com', 'CT004', 1, 'Contact Person 2', '0369852147', 'NV002'),
		('CUST005', 'Customer 3', 'Description 3', 'email3@example.com', '9871236540', 'Address 3', 'VC006',
		 'CMND', '987123654', '2022-03-03', 1, '0369852147', '2000-05-20', '7890', 'www.customer3.com', 'CT005', 0, 'Contact Person 3', '0368745123', 'NV001'),
		('CUST006', 'Customer 4', 'Description 4', 'email4@example.com', '4567890120', 'Address 4', 'VC007',
		 'CCCD', '456789012', '2022-04-04', 0, '0368745123', '1988-10-10', '2345', 'www.customer4.com', 'CT003', 1, 'Contact Person 4', '0987412365', 'NV002'),
		('CUST007', 'Customer 5', 'Description 5', 'email5@example.com', '3216549870', 'Address 5', 'VC006',
		 'CMND', '321654987', '2022-05-05', 1, '0987412365', '1995-12-25', '6789', 'www.customer5.com', 'CT004', 0, 'Contact Person 5', '0369852147', 'NV001'),
		('CUST008', 'Customer 6', 'Description 6', 'email6@example.com', '6547890120', 'Address 6', 'VC007',
		 'CCCD', '654789012', '2022-06-06', 0, '0368745123', '1986-06-06', '4567', 'www.customer6.com', 'CT003', 1, 'Contact Person 6', '0987412365', 'NV002'),
		('CUST009', 'Customer 7', 'Description 7', 'email7@example.com', '7890123450', 'Address 7', 'VC006',
		 'CMND', '789012345', '2022-07-07', 1, '0987412365', '1997-07-07',  '5678', 'www.customer7.com', 'CT005', 0, 'Contact Person 7', '0369852147', 'NV001'),
		('CUST010', 'Customer 8', 'Description 8', 'email8@example.com', '8901234560', 'Address 8', 'VC007',
		 'CCCD', '890123456', '2022-08-08', 0, '0368745123', '1988-08-08', '7890', 'www.customer8.com', 'CT004', 1, 'Contact Person 8', '0987412365', 'NV002'),
		('CUST011', 'Customer 9', 'Description 9', 'email9@example.com', '0123456781', 'Address 9', 'VC006',
		 'CMND', '012345678', '2022-09-09', 1, '0987412365', '1999-09-09', '2345', 'www.customer9.com', 'CT006', 0, 'Contact Person 9', '0369852147', 'NV001'),
		('CUST012', 'Customer 10', 'Description 10', 'email10@example.com', '3456789012', 'Address 10', 'VC007',
		 'CCCD', '345678901', '2022-10-10', 0, '0368745123', '1980-10-10', '4567', 'www.customer10.com', 'CT002', 1, 'Contact Person 10', '0987412365', 'NV002');


go
-- Thêm dữ liệu mẫu vào bảng TaiSan
-- Thêm dữ liệu mẫu cho mỗi loại tài sản
-- Loại tài sản: Bất động sản (AT001)
INSERT INTO TaiSan (ma_tai_san, ten_tai_san, mo_ta, ngay_dinh_gia, chu_so_huu, loai_tai_san, is_follow, nguoi_them, create_date)
VALUES
('TS001', N'Nhà phố quận 1', N'Nhà phố đẹp, khu vực trung tâm', '2022-01-15', 'CUST001', 'AT001', 1, 'NV001', GETDATE()),
('TS002', N'Đất nền Biên Hòa', N'Đất nền gần khu công nghiệp', '2022-01-20', 'CUST002', 'AT001', 1, 'NV002', GETDATE());

go
-- Loại tài sản: Tài sản cố định (AT002)
INSERT INTO TaiSan (ma_tai_san, ten_tai_san, mo_ta, ngay_dinh_gia, chu_so_huu, loai_tai_san, is_follow, nguoi_them, create_date)
VALUES
('TS003', N'Máy CNC', N'Máy CNC chuyên dụng', '2022-02-10', 'CUST001', 'AT002', 1, 'NV001', GETDATE()),
('TS004', N'Xe tải Hyundai', N'Xe tải chở hàng, tải trọng 10 tấn', '2022-02-15', 'CUST002', 'AT002', 1, 'NV002', GETDATE());

go
-- Loại tài sản: Tài sản tài chính (AT003)
INSERT INTO TaiSan (ma_tai_san, ten_tai_san, mo_ta, ngay_dinh_gia, chu_so_huu, loai_tai_san, is_follow, nguoi_them, create_date)
VALUES
('TS005', N'Cổ phiếu ABC', N'Cổ phiếu công ty ABC', '2022-03-05', 'CUST001', 'AT003', 1, 'NV001', GETDATE()),
('TS006', N'Trái phiếu XYZ', N'Trái phiếu công ty XYZ', '2022-03-10', 'CUST002', 'AT003', 1, 'NV002', GETDATE());

go
-- Loại tài sản: Tài sản vô hình (AT004)
INSERT INTO TaiSan (ma_tai_san, ten_tai_san, mo_ta, ngay_dinh_gia, chu_so_huu, loai_tai_san, is_follow, nguoi_them, create_date)
VALUES
('TS007', N'Bản quyền phần mềm ABC', N'Bản quyền phần mềm độc quyền', '2022-04-01', 'CUST001', 'AT004', 1, 'NV001', GETDATE()),
('TS008', N'Thương hiệu XYZ', N'Thương hiệu nổi tiếng', '2022-04-05', 'CUST002', 'AT004', 1, 'NV002', GETDATE());

go
-- Loại tài sản: Tài sản khác (AT005)
INSERT INTO TaiSan (ma_tai_san, ten_tai_san, mo_ta, ngay_dinh_gia, chu_so_huu, loai_tai_san, is_follow, nguoi_them, create_date)
VALUES
('TS009', N'Máy pha cà phê', N'Máy pha cà phê chuyên nghiệp', '2022-05-01', 'CUST001', 'AT005', 1, 'NV001', GETDATE()),
('TS010', N'Bức tranh nghệ thuật', N'Bức tranh độc đáo của nghệ sĩ nổi tiếng', '2022-05-10', 'CUST002', 'AT005', 1, 'NV002', GETDATE());

go
INSERT INTO HoSoThamDinh (ma_ho_so, hinh_anh_thong_bao_tham_dinh, thoi_gian_tham_dinh, da_duyet, nguoi_duyet, muc_dich_tham_dinh, nhan_vien_tiep_nhan_ho_so, nguoi_them)
VALUES
('HSTD001', NULL, '2023-02-15', 0, 'NV002', N'Hồ sơ thẩm định nhà đất',				'NV003', 'NV001'),
('HSTD002', NULL, '2023-02-20', 0, 'NV003', N'Hồ sơ thẩm định máy móc thiết bị',	'NV003', 'NV002'),  
('HSTD003', NULL, '2023-02-22', 0, 'NV001', N'Hồ sơ thẩm định cổ phiếu',			'NV003', 'NV001'),
('HSTD004', NULL, '2023-02-25', 1, 'NV002', N'Hồ sơ thẩm định nhãn hiệu',			'NV003', 'NV003'),
('HSTD005', NULL, '2023-03-01', 0, 'NV001', N'Hồ sơ thẩm định bằng sáng chế',		'NV003', 'NV002');

go
INSERT INTO HoSoThamDinh (ma_ho_so, hinh_anh_thong_bao_tham_dinh, thoi_gian_tham_dinh, da_duyet, nguoi_duyet, muc_dich_tham_dinh, nhan_vien_tiep_nhan_ho_so, nguoi_them)
VALUES
('HSTD006', NULL, '2023-03-01', 0, 'NV001', N'Thẩm định nhà phố', 'NV002', 'NV003'),
('HSTD007', NULL, '2023-03-05', 0, 'NV002', N'Thẩm định máy móc', 'NV003', 'NV001'),
('HSTD008', NULL, '2023-03-10', 0, 'NV003', N'Thẩm định cổ phiếu', 'NV001', 'NV002'),  
('HSTD009', NULL, '2023-03-15', 1, 'NV001', N'Thẩm định thương hiệu', 'NV002', 'NV003'),
('HSTD010', NULL, '2023-03-20', 0, 'NV003', N'Thẩm định bằng sáng chế', 'NV003', 'NV001');
--
go
INSERT INTO KeHoachThamDinh (ma_ke_hoach, ten_ke_hoach, mo_ta_ke_hoach, ma_tai_san, loai_ke_hoach, nguoi_them)
VALUES
('KH001', N'Kiểm tra giấy tờ pháp lý', N'Kiểm tra tính hợp pháp của giấy tờ', 'TS001', 'LKHTD013', 'NV001'), 
('KH002', N'Đánh giá vị trí địa lý', N'Đánh giá vị trí địa lý của nhà phố', 'TS001', 'LKHTD002', 'NV001'),
('KH003', N'1', N'5', 'TS001', 'LKHTD003', 'NV001'), 
('KH004', N'2', N'6', 'TS001', 'LKHTD006', 'NV001'), 
('KH005', N'3', N'7', 'TS001', 'LKHTD005', 'NV001'), 
('KH006', N'4', N'8', 'TS001', 'LKHTD004', 'NV001');

go
INSERT INTO ChiTietHoSoThamDinh (ma_chi_tiet, ma_ho_so, ma_tai_san, so_tien, chi_phi_tham_dinh)
VALUES  
('CTHSTD001', 'HSTD006', 'TS001', 2000000, 500000);

go
INSERT INTO ChiTietHoSoThamDinh (ma_chi_tiet, ma_ho_so, ma_tai_san, so_tien, chi_phi_tham_dinh)
VALUES  
('CTHSTD002', 'HSTD006', 'TS002', 1020000, 200000),
('CTHSTD003', 'HSTD006', 'TS007', 1020000, 200000),
('CTHSTD004', 'HSTD006', 'TS009', 1540000, 800000),
('CTHSTD005', 'HSTD006', 'TS003', 66000000, 500000);

go
INSERT INTO ChiTietHoSoThamDinh (ma_chi_tiet, ma_ho_so, ma_tai_san, so_tien, chi_phi_tham_dinh)
VALUES   
('CTHSTD006', 'HSTD001', 'TS003', 1540000, 800000),
('CTHSTD007', 'HSTD002', 'TS005', 66000000, 500000), 
('CTHSTD008', 'HSTD003', 'TS007', 1540000, 800000),
('CTHSTD009', 'HSTD004', 'TS009', 66000000, 500000);

go
INSERT INTO ChiTietKeHoachThamDinh (ma_ho_so, ma_ke_hoach)
VALUES
('HSTD006', 'KH003'),
('HSTD006', 'KH004'),
('HSTD006', 'KH005'),
('HSTD006', 'KH001'),
('HSTD006', 'KH002');

go
--select * from Employees


go
create table UserLogin 
(
	ID int identity(1,1) primary key,
	username nvarchar(255) not null unique,
	pswd nvarchar(max) not null,
	ma_nhan_vien nvarchar(20) not null,

	nguoi_them nvarchar(20) not null,
	ngay_tao date not null default getdate(),
	
	foreign key (nguoi_them) references Employees(employees_code),
	foreign key (ma_nhan_vien) references Employees(employees_code),
)
go 
INSERT INTO UserLogin (username, pswd, ma_nhan_vien, nguoi_them)
VALUES
    ('nv000', 'nv000', 'NV000', 'NV000'),
    ('nv001', 'nv001', 'NV001', 'NV000'),
    ('nv002', 'nv002', 'NV002', 'NV000'),
    ('nv003', 'nv003', 'NV003', 'NV000');
go

CREATE PROCEDURE LoginProcedure
    @inputUsername NVARCHAR(255),
    @inputPassword NVARCHAR(MAX),
    @outputNumber int OUTPUT,
    @outputResult NVARCHAR(50) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
	
    BEGIN TRY
		--
		DECLARE @dbPassword NVARCHAR(MAX), @isActive BIT, @isWorking BIT;

		-- Kiểm tra xem username có tồn tại không
		IF EXISTS (SELECT 1 FROM UserLogin WHERE username = @inputUsername)
		BEGIN
			-- Lấy mật khẩu từ database
			SELECT @dbPassword = pswd FROM UserLogin WHERE username = @inputUsername;
			 
			-- Lấy giá trị is_active và is_working từ bảng nhân viên
			SELECT @isActive = is_active, @isWorking = is_working FROM Employees WHERE employees_code = @inputUsername;

			-- Bị đình chỉ 
			IF @isActive = 0
			BEGIN
				set @outputNumber = 1;
				SET @outputResult = N'Tài khoản vô hiệu hóa';
				RETURN;
			END

			-- Nghỉ việc
			IF @isWorking = 0
			BEGIN
            set @outputNumber = 2;
			SET @outputResult = N'Tài khoản không tồn tại!'--N'Lỗi tài khoản, vui lòng liên hệ ADMIN để xử lý';
			RETURN;
        END
			-- Kiểm tra mật khẩu
			IF @inputPassword = @dbPassword
			BEGIN
				set @outputNumber = 0;
				SET @outputResult = @inputUsername;
				RETURN;
			END
			ELSE
			BEGIN
				set @outputNumber = 3;
				SET @outputResult = N'Mật khẩu không đúng';
				RETURN;
			END
		END
		ELSE
		BEGIN
			set @outputNumber = 4;
			SET @outputResult = N'Tài khoản không tồn tại';
		END
		--
	END TRY
	BEGIN CATCH 
		--
		set @outputNumber = 99;
		SET @outputResult = N'Đã có lỗi xảy ra. Mã lỗi: ' + ERROR_MESSAGE();
		--
	END CATCH
END;

/*
chia mã mỗi 
0 => đăng nhập thành công
1 => tài khoản bị vô hiệu hóa 
2 => tài khoản bị xóa do sa thải hoặc nghỉ việc 
3 => mật khẩu không đúng
4 => tài khoản chưa có trong hệ thống 
5 =>
6 =>
7 => 
99 => lỗi try catch ( đọc error logs )
*/
-- chi tiết hồ sơ thẩm định 
go
SELECT        dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], dbo.HoSoThamDinh.thoi_gian_tham_dinh AS [Thời gian thẩm định], dbo.KeHoachThamDinh.ten_ke_hoach AS [Kế hoạch], dbo.TaiSan.ten_tai_san AS [Tài sản], 
                         dbo.Customer.customer_name AS [Tên chủ], dbo.loai_ke_hoach_tham_dinh.ten_loai_ke_hoach AS [Loại kế hoạch], dbo.AssetTypes.asset_type_name AS [Loại tài sản], dbo.KeHoachThamDinh.da_tham_dinh AS [Đã thẩm định], 
                         dbo.KeHoachThamDinh.mo_ta_ke_hoach AS [Mô tả kế hoạch], dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so AS [Người tiếp nhận], dbo.KeHoachThamDinh.dat_chuan AS [Đạt chuẩn], dbo.KeHoachThamDinh.is_huy_bo AS [Hủy bỏ], 
                         dbo.KeHoachThamDinh.duoc_duyet AS [Được duyệt], dbo.HoSoThamDinh.da_duyet AS [Đã duyệt], dbo.HoSoThamDinh.nguoi_duyet AS [Người duyệt]
FROM            dbo.HoSoThamDinh INNER JOIN
                         dbo.ChiTietKeHoachThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietKeHoachThamDinh.ma_ho_so INNER JOIN
                         dbo.KeHoachThamDinh ON dbo.ChiTietKeHoachThamDinh.ma_ke_hoach = dbo.KeHoachThamDinh.ma_ke_hoach INNER JOIN
                         dbo.TaiSan ON dbo.KeHoachThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san INNER JOIN
                         dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code INNER JOIN
                         dbo.loai_ke_hoach_tham_dinh ON dbo.KeHoachThamDinh.loai_ke_hoach = dbo.loai_ke_hoach_tham_dinh.ma_loai_ke_hoach INNER JOIN
                         dbo.AssetTypes ON dbo.TaiSan.loai_tai_san = dbo.AssetTypes.asset_type_code INNER JOIN
                         dbo.Employees ON dbo.HoSoThamDinh.nguoi_duyet = dbo.Employees.employees_code

--select * from ChiTietHoSoThamDinh
go
-- xem ds hồ sơ thẩm định
SELECT        dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], dbo.HoSoThamDinh.mo_ta AS [Mô tả], dbo.HoSoThamDinh.muc_dich_tham_dinh AS [Mục đích thẩm định], dbo.HoSoThamDinh.thoi_gian_tham_dinh AS [Thời gian thẩm định], 
                         dbo.Employees.employees_name AS [Người duyệt], Employees_1.employees_name AS [Người tiếp nhận], dbo.HoSoThamDinh.create_date AS [Ngày tạo], dbo.HoSoThamDinh.da_duyet AS [Đã duyệt], 
                         dbo.HoSoThamDinh.do_uu_tien_ho_so AS [Độ ưu tiên]
FROM            dbo.HoSoThamDinh INNER JOIN
                         dbo.Employees ON dbo.HoSoThamDinh.nguoi_duyet = dbo.Employees.employees_code INNER JOIN
                         dbo.Employees AS Employees_1 ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = Employees_1.employees_code


go
-- xem hồ sơ thẩm định ( list tất cả ra xong where mã hồ sơ )
CREATE VIEW View_Xem_Chi_Tiet_Ho_So_Tham_Dinh
AS 
SELECT        dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], dbo.HoSoThamDinh.mo_ta AS [Thông tin], dbo.HoSoThamDinh.da_duyet AS [Đã duyệt], dbo.HoSoThamDinh.create_date AS [Ngày tạo hồ sơ], 
                         dbo.HoSoThamDinh.muc_dich_tham_dinh AS [Mục đích thẩm định], dbo.Employees.employees_name AS [Người tiếp nhận], dbo.ChiTietHoSoThamDinh.chi_phi_tham_dinh AS [Chi phí thẩm định], 
                         dbo.TaiSan.ten_tai_san AS [Tên tài sản], dbo.AssetTypes.asset_type_name AS [Loại tài sản], dbo.Customer.customer_name AS [Chủ sở hữu], dbo.Customer.is_organize AS [Cá nhân], 
                         dbo.HoSoThamDinh.do_uu_tien_ho_so AS [Độ ưu tiên]
FROM            dbo.HoSoThamDinh INNER JOIN
                         dbo.ChiTietHoSoThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietHoSoThamDinh.ma_ho_so INNER JOIN
                         dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san INNER JOIN
                         dbo.AssetTypes ON dbo.TaiSan.loai_tai_san = dbo.AssetTypes.asset_type_code INNER JOIN
                         dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code INNER JOIN
                         dbo.Employees ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = dbo.Employees.employees_code
go 
select * from View_Xem_Chi_Tiet_Ho_So_Tham_Dinh
where View_Xem_Chi_Tiet_Ho_So_Tham_Dinh.[Mã hồ sơ] = 'HSTD006';
go


--select * from View_Xem_Danh_Sach_Ho_So_Tham_Dinh
go
-- danh sách hồ sơ thẩm định ( bao gồm hồ sơ, tên, mã, tổng số tài sản )
CREATE VIEW View_Xem_Danh_Sach_Ho_So_Tham_Dinh
AS
SELECT
    dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ thẩm định],
    dbo.HoSoThamDinh.mo_ta AS [Mô tả],
    dbo.HoSoThamDinh.thoi_gian_tham_dinh AS [Thời gian thẩm định],
    dbo.HoSoThamDinh.muc_dich_tham_dinh AS [Mục đích thẩm định],
    dbo.Employees.employees_name AS [Người tiếp nhận],
    COUNT(dbo.ChiTietHoSoThamDinh.ma_tai_san) AS [Tổng số tài sản],
    dbo.HoSoThamDinh.do_uu_tien_ho_so AS [Độ ưu tiên hồ sơ],
    dbo.HoSoThamDinh.da_duyet AS [Đã duyệt],
    Employees_1.employees_name AS [Người duyệt]
FROM
    dbo.ChiTietHoSoThamDinh
INNER JOIN dbo.HoSoThamDinh ON dbo.ChiTietHoSoThamDinh.ma_ho_so = dbo.HoSoThamDinh.ma_ho_so
INNER JOIN dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san
INNER JOIN dbo.AssetTypes ON dbo.TaiSan.loai_tai_san = dbo.AssetTypes.asset_type_code
INNER JOIN dbo.Employees ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = dbo.Employees.employees_code
INNER JOIN dbo.Employees AS Employees_1 ON dbo.HoSoThamDinh.nguoi_duyet = Employees_1.employees_code
GROUP BY
    dbo.HoSoThamDinh.ma_ho_so,
    dbo.HoSoThamDinh.thoi_gian_tham_dinh,
    dbo.HoSoThamDinh.muc_dich_tham_dinh,
    dbo.HoSoThamDinh.mo_ta,
    dbo.Employees.employees_name,
    dbo.HoSoThamDinh.do_uu_tien_ho_so,
    Employees_1.employees_name,
    dbo.HoSoThamDinh.da_duyet;

go
--drop view View_Xem_Nhan_Vien
go

CREATE VIEW View_Xem_Nhan_Vien
AS
SELECT	dbo.Employees.employees_code AS [Mã nhân viên], 
		dbo.Employees.employees_name AS [Tên nhân viên], 
		dbo.Employees.email AS Email, 
		dbo.Employees.adress AS [Địa chỉ], 
		case when dbo.Employees.gender = 1 then N'Nam' else N'Nữ' end AS [Giới tính], 
		--dbo.Employees.gender AS [Giới tính], 
                         dbo.Employees.telephone AS [Điện thoại], dbo.EmployeePosioson.position_name AS [Chức vụ], dbo.Employees.is_active AS [Hoạt động], dbo.Employees.is_working AS [Đang làm việc]
FROM            dbo.Employees INNER JOIN
                         dbo.EmployeePosioson ON dbo.Employees.position_code = dbo.EmployeePosioson.position_code


go
--- tạo xem khách hàng
CREATE VIEW View_Xem_Khach_Hang
AS
SELECT	dbo.Customer.customer_code AS [Mã khách hàng], 
		dbo.CustomerTypes.customer_type_name AS [Loại khách hàng], 
		dbo.Customer.customer_name AS [Tên khách hàng], 
		dbo.Vocative.vocative_name AS [Xưng hô], 
		dbo.Customer.is_organize AS [Tổ chức], 
		dbo.Customer.is_working AS [Làm việc], 
		COUNT(dbo.TaiSan.ma_tai_san) AS [Tổng tài sản], 
		dbo.Employees.employees_name AS [Người thêm]
FROM            dbo.Customer INNER JOIN
                         dbo.CustomerTypes ON dbo.Customer.customer_type = dbo.CustomerTypes.customer_type_code INNER JOIN
                         dbo.TaiSan ON dbo.Customer.customer_code = dbo.TaiSan.chu_so_huu INNER JOIN
                         dbo.Vocative ON dbo.Customer.vocative = dbo.Vocative.vocative_code INNER JOIN
                         dbo.Employees ON dbo.Customer.employee_added = dbo.Employees.employees_code
GROUP BY	dbo.Customer.customer_code, 
			dbo.Customer.customer_name, 
			dbo.Customer.is_organize, 
			dbo.Customer.is_working, 
			dbo.CustomerTypes.customer_type_name, 
			dbo.Vocative.vocative_name, 
			dbo.Employees.employees_name

go
--drop view View_Xem_Nguoi_Mo_Gioi
go
--- tạo xem khách hàng
CREATE VIEW View_Xem_Nguoi_Mo_Gioi
AS
SELECT	ma_tai_san AS [Mã người môi giới], 
		ten_tai_san AS Tên, 
		loai_giay_to AS [Giấy tờ], 
		dia_chi AS [Địa chỉ], 
		case when gioi_tinh = 0 then N'Nam' else N'Nữ' end [Giới tính], 
		dien_thoai AS [Điện thoại]
FROM	dbo.nguoi_mo_gioi

go
create view View_Xem_Loai_Ke_Hoach_Tham_Dinh
as
SELECT	dbo.loai_ke_hoach_tham_dinh.ma_loai_ke_hoach AS Mã, 
		dbo.loai_ke_hoach_tham_dinh.ten_loai_ke_hoach AS Tên, 
		dbo.AssetTypes.asset_type_name AS [Loại tài sản], 
		dbo.loai_ke_hoach_tham_dinh.mo_ta AS [Mô tả], 
		dbo.Employees.employees_name AS [Người thêm], 
		dbo.loai_ke_hoach_tham_dinh.create_date AS [Người tạo]
FROM	dbo.loai_ke_hoach_tham_dinh INNER JOIN
		dbo.AssetTypes ON dbo.loai_ke_hoach_tham_dinh.loai_tai_san = dbo.AssetTypes.asset_type_code INNER JOIN
		dbo.Employees ON dbo.loai_ke_hoach_tham_dinh.nguoi_them = dbo.Employees.employees_code


go 
create view View_Xem_Tai_San
as
SELECT        dbo.TaiSan.ma_tai_san AS [Mã tài sản], dbo.TaiSan.ten_tai_san AS [Tên tài sản], dbo.AssetTypes.asset_type_name AS [Loại tài sản], dbo.TaiSan.mo_ta AS [Mô tả], dbo.Customer.customer_name AS [Khách hàng], 
                         dbo.Employees.employees_name AS [Người thêm], dbo.TaiSan.create_date AS [Ngày tạo]
FROM            dbo.TaiSan INNER JOIN
                         dbo.AssetTypes ON dbo.TaiSan.loai_tai_san = dbo.AssetTypes.asset_type_code INNER JOIN
                         dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code INNER JOIN
                         dbo.Employees ON dbo.TaiSan.nguoi_them = dbo.Employees.employees_code

go
create view View_Xem_Toan_Bo_Khach_Hang
as
SELECT        dbo.Customer.customer_code AS [Mã khách hàng], dbo.Customer.customer_name AS [Tên khách hàng], dbo.Vocative.vocative_name AS [Xưng hô], dbo.CustomerTypes.customer_type_name AS Loại, 
                         dbo.Customer.descriptions AS [Mô tả], dbo.Employees.employees_name AS [Người thêm], dbo.Customer.email AS Email
FROM            dbo.Customer INNER JOIN
                         dbo.CustomerTypes ON dbo.Customer.customer_type = dbo.CustomerTypes.customer_type_code INNER JOIN
                         dbo.Employees ON dbo.Customer.employee_added = dbo.Employees.employees_code INNER JOIN
                         dbo.Vocative ON dbo.Customer.vocative = dbo.Vocative.vocative_code
go
go
go

create view View_Xem_Danh_Sach_Ho_So
as
SELECT	dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], 
		dbo.HoSoThamDinh.mo_ta AS [Mô tả], 
		dbo.HoSoThamDinh.muc_dich_tham_dinh AS [Mục đích thẩm định], 
		dbo.HoSoThamDinh.thoi_gian_tham_dinh AS [Thời gian thẩm định], 
        dbo.Employees.employees_name AS [Người duyệt], 
		Employees_1.employees_name AS [Người tiếp nhận], 
		dbo.HoSoThamDinh.create_date AS [Ngày tạo], 
		dbo.HoSoThamDinh.da_duyet AS [Đã duyệt], 
        dbo.HoSoThamDinh.do_uu_tien_ho_so AS [Độ ưu tiên]
FROM	dbo.HoSoThamDinh INNER JOIN
        dbo.Employees ON dbo.HoSoThamDinh.nguoi_duyet = dbo.Employees.employees_code INNER JOIN
        dbo.Employees AS Employees_1 ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = Employees_1.employees_code

go
go 
create table cac_tieu_chi_tin_dung_noi_bo
(
	ID int identity(1,1) primary key,
	ma_loai_tieu_chi nvarchar(20) not null unique,
	loai_tieu_chi nvarchar(255) not null unique
)

go 
insert into cac_tieu_chi_tin_dung_noi_bo(ma_loai_tieu_chi,loai_tieu_chi)
						values	('LCT001',N'Tiêu chí cá nhân'),
								('LCT002',N'Tiêu chí quan hệ xã hội'),
								('LCT003',N'Tiêu chí thân nhân'),
								('LCT004',N'Tiêu chí quan hệ tín dụng')

go
create table cac_tieu_chi_tin_dung_noi_bo_cha
(
	ID int identity(1,1) primary key,
	ma_loai_tieu_chi nvarchar(20) not null unique,
	loai_tieu_chi nvarchar(255) not null unique,
	diem_ty_trong int not null default 5,
	ma_loai_tieu_chi_tin_dung nvarchar(20) not null,

	isSingle bit not null default 0,
	isChecked bit not null default 0,
	foreign key (ma_loai_tieu_chi_tin_dung) references cac_tieu_chi_tin_dung_noi_bo(ma_loai_tieu_chi)
)

go
insert into cac_tieu_chi_tin_dung_noi_bo_cha
		(
			ma_loai_tieu_chi,
			loai_tieu_chi,
			diem_ty_trong,
			ma_loai_tieu_chi_tin_dung,
			isSingle
		)
values	('ID_001',N'Tuổi',5,'LCT001',0),
		('ID_002',N'Trình độ học vấn',5,'LCT001',0),
		('ID_003',N'Tình trạng sở hữu tài sản',10,'LCT001',0),
		('ID_004',N'Thu nhập chính',10,'LCT001',0),
		('ID_005',N'Chi tiêu hàng tháng',10,'LCT001',0),
		('ID_006',N'Chức vụ/nghề nghiệp/Chủ cơ sở',5,'LCT002',0),
		('ID_007',N'Thời gian làm việc/ kinh doanh',8,'LCT002',0),
		('ID_008',N'Thu nhập khác',7,'LCT002',0),
		('ID_009',N'Thu nhập của người đồng trách nhiệm',5,'LCT002',0),
		('ID_010',N'Liên kết xã hội, cộng đồng',5,'LCT002',0),
		('ID_011',N'Thời gian ở địa chỉ hiện tại',5,'LCT003',0),
		('ID_012',N'Số người phụ thuộc',5,'LCT003',0),
		('ID_013',N'Sinh sống tại nhà riêng/Cùng gia đình/Thuê',5,'LCT003',0),
		('ID_014',N'Người bảo lãnh/Đồng trách nhiệm',5,'LCT003',0),
		('ID_015',N'Chưa vay',7,'LCT004',1),
		('ID_016',N'Vay tại các tổ chức tín dụng',10,'LCT004',0),
		('ID_017',N'Lịch sử nợ quá hạn',-5,'LCT004',1),
		('ID_018',N'Lịch sử nợ xấu',-10,'LCT004',1)

go
create table Tieu_chi_tin_dung_noi_bo_con
(
	ID int identity(1,1) primary key,
	ma_tieu_chi nvarchar(20) not null unique,
	ten_tieu_chi nvarchar(255) not null, 
	diem_ty_trong float not null default 0,
	isChecked bit not null default 0,

	ma_loai_tieu_chi nvarchar(20) not null,
	foreign key (ma_loai_tieu_chi) references cac_tieu_chi_tin_dung_noi_bo_cha(ma_loai_tieu_chi),
)

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_001', N'Từ 20 đến 24', 7, 'ID_001'),
			('ID_C_002',N'Từ 25 đến 34',9,'ID_001'),
			('ID_C_003',N'Từ 35 đến 54',10,'ID_001'),
			('ID_C_004',N'Từ 55 đến 70',8,'ID_001')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_005',N'Trên Đại học',10,'ID_002'),
			('ID_C_006',N'Đại học',9,'ID_002'),
			('ID_C_007',N'Cao đẳng/Trung cấp',8,'ID_002'),
			('ID_C_008',N'Phổ thông',7,'ID_002'),
			('ID_C_009',N'Khác',5,'ID_002')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_010',N'Bất động sản',10,'ID_003'),
			('ID_C_011',N'Xe ô tô, sổ tiết kiệm',9,'ID_003'),
			('ID_C_012',N'Giấy phép kinh doanh/Giấy chứng nhận cổ phiếu',8,'ID_003'),
			('ID_C_013',N'Tài sản khác (Sạp chợ, Hợp đồng ủy quyền, xe máy,...)',7,'ID_003')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_014',N'Trên 15.000.000',10,'ID_004'),
			('ID_C_015',N'Từ 10.000.000 - 15.000.000',9,'ID_004'),
			('ID_C_016',N'Từ 6.000.000 - 10.000.000',7,'ID_004'),
			('ID_C_017',N'Dưới 6.000.000',5,'ID_004')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_018',N'Trên 12.000.000',10,'ID_005'),
			('ID_C_019',N'Từ 10.000.000 - 12.000.000',9,'ID_005'),
			('ID_C_020',N'Từ 6.000.000 - 10.000.000',7,'ID_005'),
			('ID_C_021',N'Dưới 5.000.000',5,'ID_005')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_022',N'Cấp quản lý, điều hành/ Chủ cơ sở',10,'ID_006'),
			('ID_C_023',N'Cấp chuyên viên, Cán bộ, Viên chức',8,'ID_006'),
			('ID_C_024',N'Lao động được đào tạo nghề, công nhân',6,'ID_006'),
			('ID_C_025',N'Kinh doanh tự do',5,'ID_006')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_026',N'Trên 5 năm',10,'ID_007'),
			('ID_C_027',N'Từ 3 - 5 năm',9,'ID_007'),
			('ID_C_028',N'Từ 1- 3 năm',7,'ID_007'),
			('ID_C_029',N'< 1 năm',5,'ID_007')


go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_030',N'Cho thuê nhà, đất',10,'ID_008'),
			('ID_C_031',N'Cho thuê xe,Sổ tiết kiệm',9,'ID_008'),
			('ID_C_032',N'Khác',7,'ID_008')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_033',N'Cho thuê nhà, cho thuê xe',10,'ID_009'),
			('ID_C_034',N'Lương và phụ cấp',8,'ID_009'),
			('ID_C_035',N'Kinh doanh tự do',6,'ID_009'),
			('ID_C_036',N'Khác',5,'ID_009')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_037',N'Sử dụng email/Zalo/Viber/Facbook,…',6,'ID_010'),
			('ID_C_038',N'Thành viên trong các hội, đoàn, Nhóm,…',8,'ID_010'),
			('ID_C_039',N'Thông qua UBND Phường, CTV, đầu mối,…',10,'ID_010')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_040',N'Trên 5 năm',10,'ID_011'),
			('ID_C_041',N'Từ 2 - 5 năm',8,'ID_011'),
			('ID_C_042',N'< 2 năm',6,'ID_011')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_043', N'0', 8, 'ID_012'),
			('ID_C_044', N'1', 9, 'ID_012'),
			('ID_C_045', N'2', 10, 'ID_012'),
			('ID_C_046', N'3', 5, 'ID_012')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_047',N'Nhà riêng',10,'ID_013'),
			('ID_C_048',N'Sống cùng gia đình',8,'ID_013'),
			('ID_C_049',N'Nhà cơ quan',7,'ID_013'),
			('ID_C_050',N'Nhà thuê',5,'ID_013')


go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_051',N'Vợ/chồng',10,'ID_014'),
			('ID_C_052',N'Ba/Mẹ',8,'ID_014'),
			('ID_C_053',N'Con/Anh chị Em ruột',7,'ID_014'),
			('ID_C_054',N'Người quen',5,'ID_014')

go
insert into Tieu_chi_tin_dung_noi_bo_con
			(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_055',N'Một NH',10,'ID_016'),
			('ID_C_056',N'Hai NH',8,'ID_016'),
			('ID_C_057',N'Trên 2 NH',6,'ID_016')


insert into Tieu_chi_tin_dung_noi_bo_con
	(ma_tieu_chi,ten_tieu_chi,diem_ty_trong,ma_loai_tieu_chi)
	values	('ID_C_058',N'Chưa vay',7,'ID_015'), 
			('ID_C_059',N'Lịch sử nợ quá hạn',-5,'ID_017'),
			('ID_C_060',N'Lịch sử nợ xấu',-10,'ID_018')


go
--drop table DanhSachTieuChi
create table DanhSachTieuChi
(
	ID int identity(1,1) primary key,
	ma_tieu_chi nvarchar(20) not null,
	ma_ho_so  nvarchar(20) not null,
	checked bit not null default 1,
	foreign key (ma_tieu_chi) references Tieu_chi_tin_dung_noi_bo_con(ma_tieu_chi), 
	foreign key (ma_ho_so) references HoSoThamDinh(ma_ho_so),
)
--insert into DanhSachTieuChi(ma_tieu_chi,ma_ho_so) values (@ma_tieu_chi, @ma_ho_so)
--select * from DanhSachTieuChi
--ma_khach_hang nvarchar(20) not null,
--ma_nhan_vien nvarchar(20) not null,
--foreign key (ma_khach_hang) references Customer (customer_code),

select ChiTietHoSoThamDinh.ma_chi_tiet from ChiTietHoSoThamDinh
go
SELECT	dbo.cac_tieu_chi_tin_dung_noi_bo.ma_loai_tieu_chi AS [Mã tiêu chí], 
		dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi AS [Hệ thống tiêu chí], 
		dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi AS [Loại tiêu chí], 
		dbo.cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong AS [Tỉ trọng], 
		dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi AS [Chi tiết], 
		dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong AS [Điểm số]
FROM	dbo.cac_tieu_chi_tin_dung_noi_bo INNER JOIN
		dbo.cac_tieu_chi_tin_dung_noi_bo_cha ON dbo.cac_tieu_chi_tin_dung_noi_bo.ma_loai_tieu_chi = dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi_tin_dung INNER JOIN
		dbo.Tieu_chi_tin_dung_noi_bo_con ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi = dbo.Tieu_chi_tin_dung_noi_bo_con.ma_loai_tieu_chi
go
select sub.customer_code,sub.customer_name,sub.ma_tai_san,sub.ten_tai_san,sub.ma_ho_so from 
(
	SELECT	dbo.HoSoThamDinh.ma_ho_so, 
			dbo.TaiSan.ma_tai_san, 
			dbo.TaiSan.ten_tai_san, 
			dbo.Customer.customer_code, 
			dbo.Customer.customer_name
	FROM	dbo.TaiSan INNER JOIN
			dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code INNER JOIN
			dbo.ChiTietHoSoThamDinh ON dbo.TaiSan.ma_tai_san = dbo.ChiTietHoSoThamDinh.ma_tai_san INNER JOIN
			dbo.HoSoThamDinh ON dbo.ChiTietHoSoThamDinh.ma_ho_so = dbo.HoSoThamDinh.ma_ho_so
		
) as sub

select * from HoSoThamDinh

--select Customer.customer_code,Customer.customer_name from Customer
--SELECT	dbo.Customer.customer_code AS [Mã khách hàng], 
--		dbo.Customer.customer_name AS [Tên khách hàng], 
--		dbo.TaiSan.ten_tai_san AS [Tên tài sản], 
--		dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ],
--		dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi AS [Danh mục], 
--		dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi AS [Tiêu chí], 
--		dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi AS [Tiêu chí phụ]
--FROM	dbo.DanhSachTieuChi INNER JOIN
--		dbo.HoSoThamDinh INNER JOIN
--		dbo.ChiTietHoSoThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietHoSoThamDinh.ma_ho_so INNER JOIN
--		dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san INNER JOIN
--		dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code ON dbo.DanhSachTieuChi.ma_ho_so = dbo.HoSoThamDinh.ma_ho_so INNER JOIN
--		dbo.cac_tieu_chi_tin_dung_noi_bo_cha INNER JOIN
--		dbo.cac_tieu_chi_tin_dung_noi_bo ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi_tin_dung = dbo.cac_tieu_chi_tin_dung_noi_bo.ma_loai_tieu_chi INNER JOIN
--		dbo.Tieu_chi_tin_dung_noi_bo_con ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi = dbo.Tieu_chi_tin_dung_noi_bo_con.ma_loai_tieu_chi ON 
--		dbo.DanhSachTieuChi.ma_tieu_chi = dbo.Tieu_chi_tin_dung_noi_bo_con.ma_tieu_chi

--drop proc OnCalculatePersionPoint
go
create procedure OnCalculatePersionPoint
    @tuoi NVARCHAR(20), 
    @hocvan NVARCHAR(20), 
    @sohuutaisan NVARCHAR(20), 
    @thunhapchinh NVARCHAR(20), 
    @chitieuhangthang NVARCHAR(20), 
    @nghenghiep NVARCHAR(20), 
    @thoigianlamviec NVARCHAR(20), 
    @thunhapkhac NVARCHAR(20), 
    @thunhapnguoidongtrachnhiem NVARCHAR(20), 
    @lienketxahoi NVARCHAR(20), 
    @thoigiansinhsong NVARCHAR(20), 
    @nguoiphuthuoc NVARCHAR(20), 
    @loaihinhsinhsong NVARCHAR(20),     
	@nguoibaolanh NVARCHAR(20), 
    @quanhentindung NVARCHAR(20),  
    @outputResult NVARCHAR(500) OUTPUT
AS
BEGIN
    declare
    @tytrongtuoi float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_001'),
    @tytronghocvan float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_002'),
    @tytrongsohuutaisan float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_003'),
    @tytrongthunhapchinh float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_004'),
    @tytrongchitieuhangthang float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_005'),
    @tytrongnghenghiep float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_006'),
    @tytrongthoigianlamviec float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_007'),
    @tytrongthunhapkhac float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_008'),
    @tytrongthunhapnguoidongtrachnhiem float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_009'),
    @tytronglienketxahoi float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_010'),
    @tytrongthoigiansinhsong float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_011'),
    @tytrongnguoiphuthuoc float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_012'),
    @tytrongloaihinhsinhsong float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_013'),
    @tytrongnguoibaolanh float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_014'),
    @tytrongquanhentindung float = 10;

    declare
    @Pointtuoi float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @tuoi),
    @Pointhocvan float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @hocvan), 
    @Pointsohuutaisan float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @sohuutaisan), 
    @Pointthunhapchinh float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thunhapchinh), 
    @Pointchitieuhangthang float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @chitieuhangthang), 
    @Pointnghenghiep float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @nghenghiep), 
    @Pointthoigianlamviec float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thoigianlamviec), 
    @Pointthunhapkhac float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thunhapkhac), 
    @Pointthunhapnguoidongtrachnhiem float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thunhapnguoidongtrachnhiem), 
    @Pointlienketxahoi float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @lienketxahoi), 
    @Pointthoigiansinhsong float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thoigiansinhsong), 
    @Pointnguoiphuthuoc float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @nguoiphuthuoc), 
    @Pointloaihinhsinhsong float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @loaihinhsinhsong),     
    @Pointnguoibaolanh float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @nguoibaolanh), 
    @Pointquanhentindung float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @quanhentindung);

    set @Pointtuoi = (@tytrongtuoi*@Pointtuoi) / 10;  
    set @Pointhocvan = (@tytronghocvan * @Pointhocvan) / 10;
    set @Pointsohuutaisan = (@tytrongsohuutaisan * @Pointsohuutaisan) / 10;
    set @Pointthunhapchinh = (@tytrongthunhapchinh * @Pointthunhapchinh) / 10;
    set @Pointchitieuhangthang = (@tytrongchitieuhangthang * @Pointchitieuhangthang) / 10;
    set @Pointnghenghiep = (@tytrongnghenghiep * @Pointnghenghiep) / 10;
    set @Pointthoigianlamviec = (@tytrongthoigianlamviec * @Pointthoigianlamviec) / 10;
    set @Pointthunhapkhac = (@tytrongthunhapkhac * @Pointthunhapkhac) / 10;
    set @Pointthunhapnguoidongtrachnhiem = (@tytrongthunhapnguoidongtrachnhiem * @Pointthunhapnguoidongtrachnhiem) / 10;
    set @Pointlienketxahoi = (@tytronglienketxahoi * @Pointlienketxahoi) / 10;
    set @Pointthoigiansinhsong = (@tytrongthoigiansinhsong * @Pointthoigiansinhsong) / 10;
    set @Pointnguoiphuthuoc = (@tytrongnguoiphuthuoc * @Pointnguoiphuthuoc) / 10;
    set @Pointloaihinhsinhsong = (@tytrongloaihinhsinhsong * @Pointloaihinhsinhsong) / 10;
    set @Pointnguoibaolanh = (@tytrongnguoibaolanh * @Pointnguoibaolanh) / 10;
    --set @Pointquanhentindung = (@tytrongquanhentindung * @Pointquanhentindung) / 10;

	IF (@Pointquanhentindung > 0) 
		SET @Pointquanhentindung = (@tytrongquanhentindung * @Pointquanhentindung) / 10;  

	DECLARE @SUM FLOAT = (@Pointtuoi  + @Pointhocvan + @Pointsohuutaisan  + @Pointthunhapchinh + @Pointchitieuhangthang + 
				@Pointnghenghiep + @Pointthoigianlamviec  + @Pointthunhapkhac  + @Pointthunhapnguoidongtrachnhiem + 
				@Pointlienketxahoi + @Pointthoigiansinhsong + @Pointnguoiphuthuoc  + 
				@Pointloaihinhsinhsong + @Pointnguoibaolanh + @Pointquanhentindung);
	
    set @outputResult = N'Tổng điểm: ' + CONVERT(NVARCHAR(MAX), @SUM) + N',' + 
                        N'Tuổi: ' + CONVERT(NVARCHAR(MAX), @Pointtuoi) + '/' + CONVERT(NVARCHAR(MAX), @tytrongtuoi) + N',' + 
                        N'Trình độ học vấn: ' + CONVERT(NVARCHAR(MAX), @Pointhocvan) + '/' + CONVERT(NVARCHAR(MAX), @tytronghocvan) + N',' + 
                        N'Tình trạng sở hữu tài sản: ' + CONVERT(NVARCHAR(MAX), @Pointsohuutaisan) + '/' + CONVERT(NVARCHAR(MAX), @tytrongsohuutaisan) + N',' + 
                        N'Thu nhập chính: ' + CONVERT(NVARCHAR(MAX), @Pointthunhapchinh) + '/' + CONVERT(NVARCHAR(MAX), @tytrongthunhapchinh) + N',' + 
                        N'Chi tiêu hàng tháng: ' + CONVERT(NVARCHAR(MAX), @Pointchitieuhangthang) + '/' + CONVERT(NVARCHAR(MAX), @tytrongchitieuhangthang) + N',' + 
                        N'Chức vụ/nghề nghiệp/Chủ cơ sở: ' + CONVERT(NVARCHAR(MAX), @Pointnghenghiep) + '/' + CONVERT(NVARCHAR(MAX), @tytrongnghenghiep) + N',' + 
                        N'Thời gian làm việc/ kinh doanh: ' + CONVERT(NVARCHAR(MAX), @Pointthoigianlamviec) + '/' + CONVERT(NVARCHAR(MAX), @tytrongthoigianlamviec) + N',' + 
                        N'Thu nhập khác: ' + CONVERT(NVARCHAR(MAX), @Pointthunhapkhac) + '/' + CONVERT(NVARCHAR(MAX), @tytrongthunhapkhac) + N',' + 
                        N'Thu nhập của người đồng trách nhiệm: ' + CONVERT(NVARCHAR(MAX), @Pointthunhapnguoidongtrachnhiem) + '/' + CONVERT(NVARCHAR(MAX), @tytrongthunhapnguoidongtrachnhiem) + N',' + 
                        N'Liên kết xã hội, cộng đồng: ' + CONVERT(NVARCHAR(MAX), @Pointlienketxahoi) + '/' + CONVERT(NVARCHAR(MAX), @tytronglienketxahoi) + N',' + 
                        N'Thời gian ở địa chỉ hiện tại: ' + CONVERT(NVARCHAR(MAX), @Pointthoigiansinhsong) + '/' + CONVERT(NVARCHAR(MAX), @tytrongthoigiansinhsong) + N',' + 
                        N'Số người phụ thuộc: ' + CONVERT(NVARCHAR(MAX), @Pointnguoiphuthuoc) + '/' + CONVERT(NVARCHAR(MAX), @tytrongnguoiphuthuoc) + N',' + 
                        N'Sinh sống tại nhà riêng/Cùng gia đình/Thuê: ' + CONVERT(NVARCHAR(MAX), @Pointloaihinhsinhsong) + '/' + CONVERT(NVARCHAR(MAX), @tytrongloaihinhsinhsong) + N',' + 
                        N'Người bảo lãnh/Đồng trách nhiệm: ' + CONVERT(NVARCHAR(MAX), @Pointnguoibaolanh) + '/' + CONVERT(NVARCHAR(MAX), @tytrongnguoibaolanh) + N',' + 
                        (case 
                            when @Pointquanhentindung > 0 
                            then (N'Tiêu chí quan hệ tín dụng: ' + CONVERT(NVARCHAR(MAX), @Pointquanhentindung) + '/' + CONVERT(NVARCHAR(MAX), @tytrongquanhentindung)) 
                            else (N'Tiêu chí quan hệ tín dụng: ' + CONVERT(NVARCHAR(MAX), @Pointquanhentindung))
                        end);
END
go
/*
declare
    @tuoi NVARCHAR(20) = 'ID_C_004', 
    @hocvan NVARCHAR(20) = 'ID_C_007', 
    @sohuutaisan NVARCHAR(20) = 'ID_C_010',  
    @thunhapchinh NVARCHAR(20) = 'ID_C_014', 
    @chitieuhangthang NVARCHAR(20) = 'ID_C_018', 
    @nghenghiep NVARCHAR(20) = 'ID_C_022', 
    @thoigianlamviec NVARCHAR(20) = 'ID_C_026', 
    @thunhapkhac NVARCHAR(20) = 'ID_C_030', 
    @thunhapnguoidongtrachnhiem NVARCHAR(20) = 'ID_C_033', 
    @lienketxahoi NVARCHAR(20) = 'ID_C_037', 
    @thoigiansinhsong NVARCHAR(20) = 'ID_C_042', 
    @nguoiphuthuoc NVARCHAR(20) = 'ID_C_043', 
    @loaihinhsinhsong NVARCHAR(20) = 'ID_C_047',     
	@nguoibaolanh NVARCHAR(20) = 'ID_C_054', 
    @quanhentindung NVARCHAR(20) = 'ID_C_057';

    declare
    @tytrongtuoi float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_001'),
    @tytronghocvan float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_002'),
    @tytrongsohuutaisan float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_003'),
    @tytrongthunhapchinh float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_004'),
    @tytrongchitieuhangthang float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_005'),
    @tytrongnghenghiep float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_006'),
    @tytrongthoigianlamviec float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_007'),
    @tytrongthunhapkhac float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_008'),
    @tytrongthunhapnguoidongtrachnhiem float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_009'),
    @tytronglienketxahoi float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_010'),
    @tytrongthoigiansinhsong float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_011'),
    @tytrongnguoiphuthuoc float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_012'),
    @tytrongloaihinhsinhsong float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_013'),
    @tytrongnguoibaolanh float = (select diem_ty_trong from cac_tieu_chi_tin_dung_noi_bo_cha where ma_loai_tieu_chi = 'ID_014'),
    @tytrongquanhentindung float = 10;

	--select @tytrongnguoibaolanh, @tytrongquanhentindung;

    declare
    @Pointtuoi float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @tuoi),
    @Pointhocvan float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @hocvan), 
    @Pointsohuutaisan float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @sohuutaisan), 
    @Pointthunhapchinh float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thunhapchinh), 
    @Pointchitieuhangthang float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @chitieuhangthang), 
    @Pointnghenghiep float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @nghenghiep), 
    @Pointthoigianlamviec float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thoigianlamviec), 
    @Pointthunhapkhac float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thunhapkhac), 
    @Pointthunhapnguoidongtrachnhiem float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thunhapnguoidongtrachnhiem), 
    @Pointlienketxahoi float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @lienketxahoi), 
    @Pointthoigiansinhsong float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @thoigiansinhsong), 
    @Pointnguoiphuthuoc float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @nguoiphuthuoc), 
    @Pointloaihinhsinhsong float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @loaihinhsinhsong),     
    @Pointnguoibaolanh float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @nguoibaolanh), 
    @Pointquanhentindung float = (select diem_ty_trong from Tieu_chi_tin_dung_noi_bo_con where ma_tieu_chi = @quanhentindung);

	--select @tytrongquanhentindung,@Pointquanhentindung;
	--select * from Tieu_chi_tin_dung_noi_bo_con

    set @Pointtuoi = (@tytrongtuoi*@Pointtuoi) / 10;  
    set @Pointhocvan = (@tytronghocvan * @Pointhocvan) / 10;
    set @Pointsohuutaisan = (@tytrongsohuutaisan * @Pointsohuutaisan) / 10;
    set @Pointthunhapchinh = (@tytrongthunhapchinh * @Pointthunhapchinh) / 10;
    set @Pointchitieuhangthang = (@tytrongchitieuhangthang * @Pointchitieuhangthang) / 10;
    set @Pointnghenghiep = (@tytrongnghenghiep * @Pointnghenghiep) / 10;
    set @Pointthoigianlamviec = (@tytrongthoigianlamviec * @Pointthoigianlamviec) / 10;
    set @Pointthunhapkhac = (@tytrongthunhapkhac * @Pointthunhapkhac) / 10;
    set @Pointthunhapnguoidongtrachnhiem = (@tytrongthunhapnguoidongtrachnhiem * @Pointthunhapnguoidongtrachnhiem) / 10;
    set @Pointlienketxahoi = (@tytronglienketxahoi * @Pointlienketxahoi) / 10;
    set @Pointthoigiansinhsong = (@tytrongthoigiansinhsong * @Pointthoigiansinhsong) / 10;
    set @Pointnguoiphuthuoc = (@tytrongnguoiphuthuoc * @Pointnguoiphuthuoc) / 10;
    set @Pointloaihinhsinhsong = (@tytrongloaihinhsinhsong * @Pointloaihinhsinhsong) / 10;
    set @Pointnguoibaolanh = (@tytrongnguoibaolanh * @Pointnguoibaolanh) / 10;
    --set @Pointquanhentindung = (@tytrongquanhentindung * @Pointquanhentindung) / 10;

	IF (@Pointquanhentindung > 0) 
		SET @Pointquanhentindung = (@tytrongquanhentindung * @Pointquanhentindung) / 10;  

	DECLARE @SUM FLOAT = (@Pointtuoi  + @Pointhocvan + @Pointsohuutaisan  + @Pointthunhapchinh + @Pointchitieuhangthang + 
				@Pointnghenghiep + @Pointthoigianlamviec  + @Pointthunhapkhac  + @Pointthunhapnguoidongtrachnhiem + 
				@Pointlienketxahoi + @Pointthoigiansinhsong + @Pointnguoiphuthuoc  + 
				@Pointloaihinhsinhsong + @Pointnguoibaolanh + @Pointquanhentindung);
	
	--select @SUM as [Tổng];
go
*/

--declare @out nvarchar(500);
--exec OnCalculatePersionPoint --OnAddDataToSQL @mahoso = 'HSTD001',
--    @tuoi = 'ID_C_004', 
--    @hocvan = 'ID_C_007', 
--    @sohuutaisan = 'ID_C_010',  
--    @thunhapchinh = 'ID_C_014', 
--    @chitieuhangthang = 'ID_C_018', 
--    @nghenghiep = 'ID_C_022', 
--    @thoigianlamviec = 'ID_C_026', 
--    @thunhapkhac = 'ID_C_030', 
--    @thunhapnguoidongtrachnhiem = 'ID_C_033', 
--    @lienketxahoi = 'ID_C_037', 
--    @thoigiansinhsong = 'ID_C_042', 
--    @nguoiphuthuoc = 'ID_C_043', 
--    @loaihinhsinhsong = 'ID_C_047',     
--    @nguoibaolanh = 'ID_C_054', 
--    @quanhentindung = 'ID_C_057',
--	@outputResult =  @out output;
--select @out;

go
--drop table OnAddDataToSQL
go
create procedure OnAddDataToSQL
	@mahoso nvarchar(20),
    @tuoi NVARCHAR(20), 
    @hocvan NVARCHAR(20), 
    @sohuutaisan NVARCHAR(20), 
    @thunhapchinh NVARCHAR(20), 
    @chitieuhangthang NVARCHAR(20), 
    @nghenghiep NVARCHAR(20), 
    @thoigianlamviec NVARCHAR(20), 
    @thunhapkhac NVARCHAR(20), 
    @thunhapnguoidongtrachnhiem NVARCHAR(20), 
    @lienketxahoi NVARCHAR(20), 
    @thoigiansinhsong NVARCHAR(20), 
    @nguoiphuthuoc NVARCHAR(20), 
    @loaihinhsinhsong NVARCHAR(20),     
	@nguoibaolanh NVARCHAR(20), 
    @quanhentindung NVARCHAR(20),  
    @outputResult NVARCHAR(500) OUTPUT
AS
BEGIN
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @tuoi);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @hocvan);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @sohuutaisan);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @thunhapchinh);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @chitieuhangthang);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @nghenghiep);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @thoigianlamviec);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @thunhapkhac);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @thunhapnguoidongtrachnhiem);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @lienketxahoi);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @thoigiansinhsong);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @nguoiphuthuoc);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @loaihinhsinhsong);-- NVARCHAR(20),     
	insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @nguoibaolanh);-- NVARCHAR(20), 
    insert into DanhSachTieuChi(ma_ho_so, ma_tieu_chi) values (@mahoso, @quanhentindung);-- NVARCHAR(20), 

	set @outputResult = N'Done';
END
--go
--declare @out nvarchar(500);
--exec OnAddDataToSQL 
--	@mahoso = 'HSTD001',
--    @tuoi = 'ID_C_004', 
--    @hocvan = 'ID_C_007', 
--    @sohuutaisan = 'ID_C_010',  
--    @thunhapchinh = 'ID_C_014', 
--    @chitieuhangthang = 'ID_C_018', 
--    @nghenghiep = 'ID_C_022', 
--    @thoigianlamviec = 'ID_C_026', 
--    @thunhapkhac = 'ID_C_030', 
--    @thunhapnguoidongtrachnhiem = 'ID_C_033', 
--    @lienketxahoi = 'ID_C_037', 
--    @thoigiansinhsong = 'ID_C_042', 
--    @nguoiphuthuoc = 'ID_C_043', 
--    @loaihinhsinhsong = 'ID_C_047',     
--    @nguoibaolanh = 'ID_C_054', 
--    @quanhentindung = 'ID_C_057',
--	@outputResult =  @out output;
--select @out;

--Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong
--cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong

--SELECT	dbo.Customer.customer_name AS [Tên khách hàng], 
--		dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], 
--		dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi AS [Tiêu chí lớn], 
--		dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi AS [Tiêu chí phụ], 
--		dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi AS [Tiêu chí con], 
--		dbo.cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong AS [Tỷ trọng %], 
--		(case
--			when
--			dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong >= 0 then 
--				(dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong * cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong ) / 10
--			else dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong
--
--		end) AS [Đánh giá ( theo thang điểm 10 )]
--FROM	dbo.cac_tieu_chi_tin_dung_noi_bo_cha INNER JOIN
--		dbo.cac_tieu_chi_tin_dung_noi_bo ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi_tin_dung = dbo.cac_tieu_chi_tin_dung_noi_bo.ma_loai_tieu_chi INNER JOIN
--		dbo.Tieu_chi_tin_dung_noi_bo_con ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi = dbo.Tieu_chi_tin_dung_noi_bo_con.ma_loai_tieu_chi INNER JOIN
--		dbo.DanhSachTieuChi ON dbo.Tieu_chi_tin_dung_noi_bo_con.ma_tieu_chi = dbo.DanhSachTieuChi.ma_tieu_chi INNER JOIN
--		dbo.HoSoThamDinh ON dbo.DanhSachTieuChi.ma_ho_so = dbo.HoSoThamDinh.ma_ho_so INNER JOIN
--		dbo.ChiTietHoSoThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietHoSoThamDinh.ma_ho_so INNER JOIN
--		dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san INNER JOIN
--		dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code

/*
SELECT        dbo.Customer.customer_name AS [Tên khách hàng], dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi AS [Tiêu chí lớn], 
                         dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi AS [Tiêu chí phụ], dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi AS [Tiêu chí con], dbo.cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong AS [Tỷ trọng %], 
                         (CASE WHEN dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong >= 0 THEN (dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong * cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong) 
                         / 10 ELSE dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong END) AS [Đánh giá ( theo thang điểm 10 )]
FROM            dbo.cac_tieu_chi_tin_dung_noi_bo_cha INNER JOIN
                         dbo.cac_tieu_chi_tin_dung_noi_bo ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi_tin_dung = dbo.cac_tieu_chi_tin_dung_noi_bo.ma_loai_tieu_chi INNER JOIN
                         dbo.Tieu_chi_tin_dung_noi_bo_con ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi = dbo.Tieu_chi_tin_dung_noi_bo_con.ma_loai_tieu_chi INNER JOIN
                         dbo.DanhSachTieuChi ON dbo.Tieu_chi_tin_dung_noi_bo_con.ma_tieu_chi = dbo.DanhSachTieuChi.ma_tieu_chi INNER JOIN
                         dbo.HoSoThamDinh ON dbo.DanhSachTieuChi.ma_ho_so = dbo.HoSoThamDinh.ma_ho_so INNER JOIN
                         dbo.ChiTietHoSoThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietHoSoThamDinh.ma_ho_so INNER JOIN
                         dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san INNER JOIN
                         dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code
GROUP BY	dbo.Customer.customer_name, dbo.HoSoThamDinh.ma_ho_so, 
			dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi, 
			dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi, 
			dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi, 
            dbo.cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong,
			dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong
*/


select sub.[Mã hồ sơ],sub.[Tên khách hàng] ,SUM(sub.[Đánh giá ( theo thang điểm 10 )]) as [Số điểm trên thang 100]
from 
(
	SELECT        dbo.Customer.customer_name AS [Tên khách hàng], dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ], dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi AS [Tiêu chí lớn], 
							 dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi AS [Tiêu chí phụ], dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi AS [Tiêu chí con], dbo.cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong AS [Tỷ trọng %], 
							 (CASE WHEN dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong >= 0 THEN (dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong * cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong) 
							 / 10 ELSE dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong END) AS [Đánh giá ( theo thang điểm 10 )]
	FROM            dbo.cac_tieu_chi_tin_dung_noi_bo_cha INNER JOIN
							 dbo.cac_tieu_chi_tin_dung_noi_bo ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi_tin_dung = dbo.cac_tieu_chi_tin_dung_noi_bo.ma_loai_tieu_chi INNER JOIN
							 dbo.Tieu_chi_tin_dung_noi_bo_con ON dbo.cac_tieu_chi_tin_dung_noi_bo_cha.ma_loai_tieu_chi = dbo.Tieu_chi_tin_dung_noi_bo_con.ma_loai_tieu_chi INNER JOIN
							 dbo.DanhSachTieuChi ON dbo.Tieu_chi_tin_dung_noi_bo_con.ma_tieu_chi = dbo.DanhSachTieuChi.ma_tieu_chi INNER JOIN
							 dbo.HoSoThamDinh ON dbo.DanhSachTieuChi.ma_ho_so = dbo.HoSoThamDinh.ma_ho_so INNER JOIN
							 dbo.ChiTietHoSoThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietHoSoThamDinh.ma_ho_so INNER JOIN
							 dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san INNER JOIN
							 dbo.Customer ON dbo.TaiSan.chu_so_huu = dbo.Customer.customer_code
	GROUP BY dbo.Customer.customer_name, dbo.HoSoThamDinh.ma_ho_so, dbo.cac_tieu_chi_tin_dung_noi_bo.loai_tieu_chi, dbo.cac_tieu_chi_tin_dung_noi_bo_cha.loai_tieu_chi, dbo.Tieu_chi_tin_dung_noi_bo_con.ten_tieu_chi, 
							 dbo.Tieu_chi_tin_dung_noi_bo_con.diem_ty_trong, dbo.cac_tieu_chi_tin_dung_noi_bo_cha.diem_ty_trong
) as sub
group by sub.[Mã hồ sơ],sub.[Tên khách hàng] 

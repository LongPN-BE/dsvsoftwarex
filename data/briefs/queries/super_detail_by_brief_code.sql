SELECT
    --	HoSoThamDinh
    dbo.HoSoThamDinh.[ID] as id_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[ma_ho_so] as ma_ho_so_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[tieu_de_ho_so] as tieu_de_ho_so_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[mo_ta] as mo_ta_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[muc_dich_tham_dinh] as muc_dich_tham_dinh_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[hinh_anh_thong_bao_tham_dinh] as hinh_anh_thong_bao_tham_dinh_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[thoi_gian_tham_dinh] as thoi_gian_tham_dinh_ho_so_tham_dinh,
    dbo.HoSoThamDinh.[da_duyet] as da_duyet_ho_so_tham_dinh,
    -- dbo.HoSoThamDinh.[nguoi_duyet] as nguoi_duyet,
    -- dbo.HoSoThamDinh.[do_uu_tien_ho_so] as do_uu_tien_ho_so,
    -- dbo.HoSoThamDinh.[nhan_vien_tiep_nhan_ho_so] as nhan_vien_tiep_nhan_ho_so,
    -- dbo.HoSoThamDinh.[nguoi_them] as nguoi_them,
    dbo.HoSoThamDinh.[create_date] as create_date,
    --	Employees [nguoi_duyet]
    nguoi_duyet.[employees_code] as employees_code_nguoi_duyet,
    nguoi_duyet.[employees_name] as employees_name_nguoi_duyet,
    nguoi_duyet.[document_type] as document_type_nguoi_duyet,
    nguoi_duyet.[document_number] as document_number_nguoi_duyet,
    nguoi_duyet.[document_issue_date] as document_issue_date_nguoi_duyet,
    nguoi_duyet.[email] as email_nguoi_duyet,
    nguoi_duyet.[adress] as adress_nguoi_duyet,
    nguoi_duyet.[gender] as gender_nguoi_duyet,
    nguoi_duyet.[telephone] as telephone_nguoi_duyet,
    nguoi_duyet.[date_of_birth] as date_of_birth_nguoi_duyet,
    -- nguoi_duyet.[position_code] as position_code_nguoi_duyet,
    nguoi_duyet.[employee_image] as employee_image_nguoi_duyet,
    nguoi_duyet.[is_active] as is_active_nguoi_duyet,
    nguoi_duyet.[is_working] as is_working_nguoi_duyet,
    nguoi_duyet.[is_follow] as is_follow_nguoi_duyet,
    nguoi_duyet.[create_date] as create_date_nguoi_duyet,
    nguoi_duyet.[start_work_date] as start_work_date_nguoi_duyet,
    nguoi_duyet.[layoff_date] as layoff_date_nguoi_duyet,
    --	Employees [nhan_vien_tiep_nhan_ho_so]
    nhan_vien_tiep_nhan_ho_so.[employees_code] as employees_code_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[employees_name] as employees_name_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[document_type] as document_type_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[document_number] as document_number_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[document_issue_date] as document_issue_date_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[email] as email_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[adress] as adress_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[gender] as gender_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[telephone] as telephone_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[date_of_birth] as date_of_birth_nhan_vien_tiep_nhan_ho_so,
    -- nhan_vien_tiep_nhan_ho_so.[position_code] as position_code__nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[employee_image] as employee_image_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[is_active] as is_active_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[is_working] as is_working_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[is_follow] as is_follow_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[create_date] as create_date_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[start_work_date] as start_work_date_nhan_vien_tiep_nhan_ho_so,
    nhan_vien_tiep_nhan_ho_so.[layoff_date] as layoff_date_nhan_vien_tiep_nhan_ho_so,
    --	Employees [nguoi_them]
    nguoi_them.[employees_code] as employees_code_nguoi_them,
    nguoi_them.[employees_name] as employees_name_nguoi_them,
    nguoi_them.[document_type] as document_type_nguoi_them,
    nguoi_them.[document_number] as document_number_nguoi_them,
    nguoi_them.[document_issue_date] as document_issue_date_nguoi_them,
    nguoi_them.[email] as email_nguoi_them,
    nguoi_them.[adress] as adress_nguoi_them,
    nguoi_them.[gender] as gender_nguoi_them,
    nguoi_them.[telephone] as telephone_nguoi_them,
    nguoi_them.[date_of_birth] as date_of_birth_nguoi_them,
    -- nguoi_them.[position_code] as position_code__nhan_vien_tiep_nhan_ho_so,
    nguoi_them.[employee_image] as employee_image_nguoi_them,
    nguoi_them.[is_active] as is_active_nguoi_them,
    nguoi_them.[is_working] as is_working_nguoi_them,
    nguoi_them.[is_follow] as is_follow_nguoi_them,
    nguoi_them.[create_date] as create_date_nguoi_them,
    nguoi_them.[start_work_date] as start_work_nguoi_them,
    nguoi_them.[layoff_date] as layoff_date_nguoi_them,
    --	PriorityLevels độ ưu tiên
    dbo.PriorityLevels.priority_code as priority_code,
    dbo.PriorityLevels.priority_name as priority_name,
    dbo.PriorityLevels.descriptions as priority_descriptions,
    --	NguoiThamDinhTheoHoSo
    nguoi_tham_dinh.[employees_code] as employees_code_nguoi_tham_dinh,
    nguoi_tham_dinh.[employees_name] as employees_name_nguoi_tham_dinh,
    nguoi_tham_dinh.[document_type] as document_type_nguoi_tham_dinh,
    nguoi_tham_dinh.[document_number] as document_number_nguoi_tham_dinh,
    nguoi_tham_dinh.[document_issue_date] as document_issue_date_nguoi_tham_dinh,
    nguoi_tham_dinh.[email] as email_nguoi_tham_dinh,
    nguoi_tham_dinh.[adress] as adress_nguoi_tham_dinh,
    nguoi_tham_dinh.[gender] as gender_nguoi_tham_dinh,
    nguoi_tham_dinh.[telephone] as telephone_nguoi_tham_dinh,
    nguoi_tham_dinh.[date_of_birth] as date_of_birth_nguoi_tham_dinh,
    nguoi_tham_dinh.[position_code] as position_code_nguoi_tham_dinh,
    nguoi_tham_dinh.[employee_image] as employee_image_nguoi_tham_dinh,
    nguoi_tham_dinh.[is_active] as is_active_nguoi_tham_dinh,
    nguoi_tham_dinh.[is_working] as is_working_nguoi_tham_dinh,
    nguoi_tham_dinh.[is_follow] as is_follow,
    nguoi_tham_dinh.[create_date] as create_date_nguoi_tham_dinh,
    nguoi_tham_dinh.[start_work_date] as start_work_date_nguoi_tham_dinh,
    nguoi_tham_dinh.[layoff_date] as layoff_date_nguoi_tham_dinh,
    --	ChiTietHoSoThamDinh
    dbo.ChiTietHoSoThamDinh.[ma_chi_tiet] as ma_chi_tiet_chi_tiet_ho_so_tham_dinh,
    dbo.ChiTietHoSoThamDinh.[mo_ta] as mo_ta_chi_tiet_ho_so_tham_dinh,
    dbo.ChiTietHoSoThamDinh.[ma_ho_so] as ma_ho_so_chi_tiet_ho_so_tham_dinh,
    dbo.ChiTietHoSoThamDinh.[ma_tai_san] as ma_tai_san_chi_tiet_ho_so_tham_dinh,
    dbo.ChiTietHoSoThamDinh.[so_tien] as so_tien_chi_tiet_ho_so_tham_dinh,
    dbo.ChiTietHoSoThamDinh.[chi_phi_tham_dinh] as chi_phi_tham_dinh_chi_tiet_ho_so_tham_dinh,
    --	TaiSan
    dbo.TaiSan.[ma_tai_san] as ma_tai_san,
    dbo.TaiSan.[ten_tai_san] as ten_tai_san,
    dbo.TaiSan.[mo_ta] as mo_ta_tai_san,
    dbo.TaiSan.[ngay_dinh_gia] as ngay_dinh_gia_tai_san,
    -- dbo.TaiSan.[chu_so_huu] as chu_so_huu_tai_san,
    -- dbo.TaiSan.[loai_tai_san] as loai_tai_san,
    dbo.TaiSan.[is_follow] as is_follow_tai_san,
    -- dbo.TaiSan.[nguoi_them] as nguoi_them_tai_san,
    dbo.TaiSan.[create_date] as create_date_tai_san,
    -- khach hang
    khach_hang.[customer_code] as customer_code,
    khach_hang.[customer_name] as customer_name,
    khach_hang.[descriptions] as customer_descriptions,
    khach_hang.[email] as customer_email,
    khach_hang.[tax_code] as customer_tax_code,
    khach_hang.[adress] as customer_adress,
    -- khach_hang.[vocative],
    khach_hang.[personal_documents_type] as customer_personal_documents_type,
    khach_hang.[personal_document_number] as customer_personal_document_number,
    khach_hang.[personal_document_issue_date] as customer_personal_document_issue_date,
    khach_hang.[gender] as customer_gender,
    khach_hang.[telephone] as customer_telephone,
    khach_hang.[date_of_birth] as customer_date_of_birth,
    khach_hang.[fax] as customer_fax,
    khach_hang.[website] as customer_website,
    -- khach_hang.[customer_type],
    khach_hang.[is_organize] as customer_is_organize,
    khach_hang.[contact_person] as customer_contact_person,
    khach_hang.[contact_person_telephone] as customer_contact_person_telephone,
    khach_hang.[is_working] as customer_is_working,
    khach_hang.[is_follow] as customer_is_follow,
    khach_hang.[create_date] as customer_create_date,
    -- loai_khach_hang.
    -- loai_khach_hang.[customer_type_code],
    loai_khach_hang.[customer_type_name],
    loai_khach_hang.[descriptions] -- loai_khach_hang.[is_defaulit],
    -- loai_khach_hang.[is_follow],
    -- loai_khach_hang.[create_date]
FROM
    dbo.HoSoThamDinh
    INNER JOIN dbo.Employees AS nguoi_duyet ON dbo.HoSoThamDinh.nguoi_duyet = nguoi_duyet.employees_code
    INNER JOIN dbo.Employees AS nhan_vien_tiep_nhan_ho_so ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = nhan_vien_tiep_nhan_ho_so.employees_code
    INNER JOIN dbo.Employees AS nguoi_them ON dbo.HoSoThamDinh.nguoi_them = nguoi_them.employees_code
    INNER JOIN dbo.PriorityLevels ON dbo.HoSoThamDinh.do_uu_tien_ho_so = dbo.PriorityLevels.priority_code
    LEFT JOIN dbo.NguoiThamDinhTheoHoSo AS nguoi_tham_dinh_theo_ho_so ON dbo.HoSoThamDinh.ma_ho_so = nguoi_tham_dinh_theo_ho_so.ma_ho_so
    LEFT JOIN dbo.Employees AS nguoi_tham_dinh ON nguoi_tham_dinh_theo_ho_so.nguoi_them = nguoi_them.employees_code
    LEFT JOIN dbo.ChiTietHoSoThamDinh ON dbo.HoSoThamDinh.ma_ho_so = dbo.ChiTietHoSoThamDinh.ma_ho_so
    LEFT JOIN dbo.TaiSan ON dbo.ChiTietHoSoThamDinh.ma_tai_san = dbo.TaiSan.ma_tai_san
    LEFT JOIN dbo.Customer AS khach_hang ON dbo.TaiSan.chu_so_huu = khach_hang.customer_code
    INNER JOIN [DSGAppraisalSoftwareX].[dbo].[CustomerTypes] AS loai_khach_hang ON khach_hang.customer_type = loai_khach_hang.customer_type_code
WHERE
    dbo.HoSoThamDinh.ma_ho_so = @input;
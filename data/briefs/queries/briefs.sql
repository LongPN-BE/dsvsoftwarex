SELECT
    dbo.HoSoThamDinh.ma_ho_so,
    dbo.HoSoThamDinh.mo_ta,
    dbo.HoSoThamDinh.muc_dich_tham_dinh,
    dbo.HoSoThamDinh.thoi_gian_tham_dinh,
    dbo.Employees.employees_name,
    Employees_1.employees_name,
    dbo.HoSoThamDinh.create_date,
    dbo.HoSoThamDinh.da_duyet,
    dbo.HoSoThamDinh.do_uu_tien_ho_so
FROM
    dbo.HoSoThamDinh
    INNER JOIN dbo.Employees ON dbo.HoSoThamDinh.nguoi_duyet = dbo.Employees.employees_code
    INNER JOIN dbo.Employees AS Employees_1 ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = Employees_1.employees_code;

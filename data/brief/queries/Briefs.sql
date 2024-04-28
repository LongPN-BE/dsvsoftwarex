SELECT
    dbo.HoSoThamDinh.ma_ho_so AS [Mã hồ sơ],
    dbo.HoSoThamDinh.mo_ta AS [Mô tả],
    dbo.HoSoThamDinh.muc_dich_tham_dinh AS [Mục đích thẩm định],
    dbo.HoSoThamDinh.thoi_gian_tham_dinh AS [Thời gian thẩm định],
    dbo.Employees.employees_name AS [Người duyệt],
    Employees_1.employees_name AS [Người tiếp nhận],
    dbo.HoSoThamDinh.create_date AS [Ngày tạo],
    dbo.HoSoThamDinh.da_duyet AS [Đã duyệt],
    dbo.HoSoThamDinh.do_uu_tien_ho_so AS [Độ ưu tiên]
FROM
    dbo.HoSoThamDinh
    INNER JOIN dbo.Employees ON dbo.HoSoThamDinh.nguoi_duyet = dbo.Employees.employees_code
    INNER JOIN dbo.Employees AS Employees_1 ON dbo.HoSoThamDinh.nhan_vien_tiep_nhan_ho_so = Employees_1.employees_code;

select
    *
from
    HoSoThamDinh;

select
    *
from
    View_Xem_Danh_Sach_Ho_So_Tham_Dinh;
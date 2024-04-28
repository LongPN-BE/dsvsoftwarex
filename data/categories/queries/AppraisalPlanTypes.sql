SELECT
    dbo.loai_ke_hoach_tham_dinh.ma_loai_ke_hoach AS Mã,
    dbo.loai_ke_hoach_tham_dinh.ten_loai_ke_hoach AS Tên,
    dbo.AssetTypes.asset_type_name AS [Loại tài sản],
    dbo.loai_ke_hoach_tham_dinh.mo_ta AS [Mô tả],
    dbo.Employees.employees_name AS [Người thêm],
    dbo.loai_ke_hoach_tham_dinh.create_date AS [Người tạo]
FROM
    dbo.loai_ke_hoach_tham_dinh
    INNER JOIN dbo.AssetTypes ON dbo.loai_ke_hoach_tham_dinh.loai_tai_san = dbo.AssetTypes.asset_type_code
    INNER JOIN dbo.Employees ON dbo.loai_ke_hoach_tham_dinh.nguoi_them = dbo.Employees.employees_code;

select
    *
from
    loai_ke_hoach_tham_dinh;
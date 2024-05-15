select
    [Mã khách hàng] AS ma_khach_hang,
    [Loại khách hàng] AS loai_khach_hang,
    [Tên khách hàng] AS ten_khach_hang,
    [Xưng hô] AS xung_ho,
    [Tổ chức] AS to_chuc,
    [Làm việc] AS lam_viec,
    [Tổng tài sản] AS tong_tai_san,
    [Người thêm] AS nguoi_them
from
    View_Xem_Khach_Hang;

select
    *
from
    View_Xem_Toan_Bo_Khach_Hang;
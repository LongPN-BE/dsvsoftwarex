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
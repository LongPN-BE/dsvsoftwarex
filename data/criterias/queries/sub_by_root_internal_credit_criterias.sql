SELECT
    [ID],
    [ma_tieu_chi],
    [ten_tieu_chi],
    [diem_ty_trong],
    [isChecked],
    [ma_loai_tieu_chi]
FROM
    [DSGAppraisalSoftwareX].[dbo].[Tieu_chi_tin_dung_noi_bo_con]
WHERE
    [ma_loai_tieu_chi] = @input_ma_loai_tieu_chi;
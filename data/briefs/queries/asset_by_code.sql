SELECT
    [ID],
    [ma_tai_san],
    [ten_tai_san],
    [mo_ta],
    [ngay_dinh_gia],
    [chu_so_huu],
    [loai_tai_san],
    [is_follow],
    [nguoi_them],
    [create_date]
FROM
    [DSGAppraisalSoftwareX].[dbo].[TaiSan]
WHERE 
    [ma_tai_san] = @input;
	
SELECT
    --	TaiSan
    dbo.TaiSan.[ma_tai_san] as ma_tai_san,
    dbo.TaiSan.[ten_tai_san] as ten_tai_san,
    dbo.TaiSan.[mo_ta] as mo_ta_tai_san,
    dbo.TaiSan.[ngay_dinh_gia] as ngay_dinh_gia_tai_san,
    -- loai_tai_san.
    loai_tai_san.[asset_type_code] as asset_type_code,
    loai_tai_san.[asset_type_name] as asset_type_name,
    loai_tai_san.[descriptionz] as descriptionz,
    loai_tai_san.[create_date] as asset_type_create_date,
    -- khach_hang.[customer_type],
    khach_hang.[customer_code] as [customer_code],
    khach_hang.[is_organize] as customer_is_organize,
    khach_hang.[contact_person] as customer_contact_person,
    khach_hang.[contact_person_telephone] as customer_contact_person_telephone,
    -- loai_khach_hang.
    loai_khach_hang.[customer_type_name] as loai_khach_hang,
    loai_khach_hang.[descriptions] as loai_khach_hang_descriptions
FROM
    [DSGAppraisalSoftwareX].[dbo].[TaiSan]
    INNER JOIN [DSGAppraisalSoftwareX].[dbo].[AssetTypes] AS loai_tai_san ON [dbo].[TaiSan].loai_tai_san = loai_tai_san.asset_type_code
    INNER JOIN [DSGAppraisalSoftwareX].[dbo].[Customer] AS khach_hang ON [dbo].[TaiSan].chu_so_huu = khach_hang.customer_code
    INNER JOIN [DSGAppraisalSoftwareX].[dbo].[CustomerTypes] AS loai_khach_hang ON khach_hang.customer_type = loai_khach_hang.customer_type_code
WHERE
    [dbo].[TaiSan].ma_tai_san = @input;
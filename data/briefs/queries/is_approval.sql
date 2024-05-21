SELECT
    dbo.HoSoThamDinh.da_duyet
FROM
    dbo.HoSoThamDinh
WHERE
    ma_ho_so = @input;
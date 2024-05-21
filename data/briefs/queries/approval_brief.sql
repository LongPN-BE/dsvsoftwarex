UPDATE dbo.HoSoThamDinh
SET da_duyet = 1
WHERE dbo.HoSoThamDinh.[ma_ho_so] = @input;
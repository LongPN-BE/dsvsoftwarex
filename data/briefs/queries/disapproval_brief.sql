UPDATE dbo.HoSoThamDinh
SET da_duyet = 0
WHERE dbo.HoSoThamDinh.[ma_ho_so] = @input;
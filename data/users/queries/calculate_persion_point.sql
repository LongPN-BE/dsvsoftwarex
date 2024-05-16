DECLARE @return_value int,
@outputResult nvarchar(500) EXEC @return_value = [dbo].[OnCalculatePersionPoint] @tuoi = @input_tuoi,
@hocvan = @input_hocvan,
@sohuutaisan = @input_sohuutaisan,
@thunhapchinh = @input_thunhapchinh,
@chitieuhangthang = @input_chitieuhangthang,
@nghenghiep = @input_nghenghiep,
@thoigianlamviec = @input_thoigianlamviec,
@thunhapkhac = @input_thunhapkhac,
@thunhapnguoidongtrachnhiem = @input_thunhapnguoidongtrachnhiem,
@lienketxahoi = @input_lienketxahoi,
@thoigiansinhsong = @input_thoigiansinhsong,
@nguoiphuthuoc = @input_nguoiphuthuoc,
@loaihinhsinhsong = @input_loaihinhsinhsong,
@nguoibaolanh = @input_nguoibaolanh,
@quanhentindung = @input_quanhetindung,
@outputResult = @outputResult OUTPUT
SELECT
    @outputResult as N'@outputResult';

SELECT
    'Return Value' = @return_value;
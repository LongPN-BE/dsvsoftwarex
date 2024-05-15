SELECT
  [Mã người môi giới] AS ma_nguoi_moi_gioi,
  [Tên] AS ten,
  [Giấy tờ] AS giay_to,
  [Địa chỉ] AS dia_chi,
  [Giới tính] AS gioi_tinh,
  [Điện thoại] AS dien_thoai
FROM
  [dbo].[View_Xem_Nguoi_Mo_Gioi]
WHERE
  [Mã người môi giới] = @input;
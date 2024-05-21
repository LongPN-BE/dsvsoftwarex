"use strict";

const userData = require("../data/users");

const login = async (req, res) => {
  try {
    const username = req.body.username;
    const password = req.body.password;
    if (!username || !password)
      return res.status(400).send({
        code: -1,
        message: "Vui lòng hãy nhập ký tự. Không đươc bỏ trống",
      });
    const user = await userData.login(username, password);
    if (user[0][0].outputNumber == 0) res.status(200).json(user[3][0]);
    else
      return res.status(404).json({
        code: user[0][0].outputNumber,
        message: user[0][0].outputResult,
      });
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllEmployees = async (req, res) => {
  try {
    const employee_code = req.param("employee_code");
    let data;
    if (employee_code != undefined)
      data = await userData.getEmployeeByCode(employee_code);
    else data = await userData.getAllEmployees();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllCustomers = async (req, res) => {
  try {
    const customer_code = req.param("customer_code");
    let data;
    if (customer_code != undefined)
      data = await userData.getCustomerByCode(customer_code);
    else data = await userData.getAllCustomers();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllCustomerFull = async (req, res) => {
  try {
    const customer_code = req.param("customer_code");
    let data;
    if (customer_code != undefined)
      data = await userData.getCustomerFullByCode(customer_code);
    else data = await userData.getAllCustomerFull();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllBrokers = async (req, res) => {
  try {
    const broker_code = req.param("broker_code");
    let data;
    if (broker_code != undefined)
      data = await userData.getBrokersByCode(broker_code);
    else data = await userData.getAllBrokers();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const onCalculatePersionPoint = async (req, res) => {
  try {
    const input = {
      input_tuoi: req.body.tuoi,
      input_hocvan: req.body.hoc_van,
      input_sohuutaisan: req.body.so_huu_tai_san,
      input_thunhapchinh: req.body.thu_nhap_chinh,
      input_chitieuhangthang: req.body.chi_tieu_hang_thang,
      input_nghenghiep: req.body.nghe_nghiep,
      input_thoigianlamviec: req.body.thoi_gian_lam_viec,
      input_thunhapnguoidongtrachnhiem: req.body.thu_nhap_nguoi_dong_trach_nhiem,
      input_thoigiansinhsong: req.body.thoi_gian_sinh_song,
      input_nguoiphuthuoc: req.body.nguoi_phu_thuoc,
      input_loaihinhsinhsong: req.body.loai_hinh_sinh_song,
      input_quanhetindung: req.body.quan_he_tin_dung,
    };
    let data;
    if (input.input_tuoi == undefined ||
      input.input_hocvan == undefined ||
      input.input_sohuutaisan == undefined ||
      input.input_thunhapchinh == undefined ||
      input.input_chitieuhangthang == undefined ||
      input.input_nghenghiep == undefined ||
      input.input_thoigianlamviec == undefined ||
      input.input_thunhapnguoidongtrachnhiem == undefined ||
      input.input_nguoiphuthuoc == undefined ||
      input.input_loaihinhsinhsong == undefined ||
      input.input_quanhetindung == undefined
    )
      data = ({
        code: -1,
        message: "Vui lòng hãy nhập ký tự. Không đươc bỏ trống",
      });
    else data = await userData.onCalculatePersionPoint(input);
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const onSaveCalculatePersionPoint = async (req, res) => {
  try {
    const input = {
      input_mahoso: req.body.ma_ho_so,
      input_tuoi: req.body.tuoi,
      input_hocvan: req.body.hoc_van,
      input_sohuutaisan: req.body.so_huu_tai_san,
      input_thunhapchinh: req.body.thu_nhap_chinh,
      input_chitieuhangthang: req.body.chi_tieu_hang_thang,
      input_nghenghiep: req.body.nghe_nghiep,
      input_thoigianlamviec: req.body.thoi_gian_lam_viec,
      input_thunhapnguoidongtrachnhiem: req.body.thu_nhap_nguoi_dong_trach_nhiem,
      input_thoigiansinhsong: req.body.thoi_gian_sinh_song,
      input_nguoiphuthuoc: req.body.nguoi_phu_thuoc,
      input_loaihinhsinhsong: req.body.loai_hinh_sinh_song,
      input_quanhetindung: req.body.quan_he_tin_dung,
    };
    let data;
    if (input.input_mahoso == undefined ||
      input.input_tuoi == undefined ||
      input.input_hocvan == undefined ||
      input.input_sohuutaisan == undefined ||
      input.input_thunhapchinh == undefined ||
      input.input_chitieuhangthang == undefined ||
      input.input_nghenghiep == undefined ||
      input.input_thoigianlamviec == undefined ||
      input.input_thunhapnguoidongtrachnhiem == undefined ||
      input.input_nguoiphuthuoc == undefined ||
      input.input_loaihinhsinhsong == undefined ||
      input.input_quanhetindung == undefined
    )
      data = ({
        code: -1,
        message: "Vui lòng hãy nhập ký tự. Không đươc bỏ trống",
      });
    else data = await userData.onSaveCalculatePersionPoint(input);
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

module.exports = {
  login,
  getAllEmployees,
  getAllCustomers,
  getAllBrokers,
  onCalculatePersionPoint,
  onSaveCalculatePersionPoint,
  getAllCustomerFull
};

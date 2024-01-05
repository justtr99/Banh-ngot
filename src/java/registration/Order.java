/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Order {
    
    private int OrdersID;
    private String username;
    private int NhanVienID;
    private Date NgayTao;
    private Date NgayNhan;
    private int TinhTrang;
    private String TenNguoiNhan;
    private String DiaChi;
    private String SDT;
    private int Total;

    public Order() {
    }

    public Order(int OrdersID, String username, int NhanVienID, Date NgayTao, Date NgayNhan, int TinhTrang, String TenNguoiNhan, String DiaChi, String SDT, int Total) {
        this.OrdersID = OrdersID;
        this.username = username;
        this.NhanVienID = NhanVienID;
        this.NgayTao = NgayTao;
        this.NgayNhan = NgayNhan;
        this.TinhTrang = TinhTrang;
        this.TenNguoiNhan = TenNguoiNhan;
        this.DiaChi = DiaChi;
        this.SDT = SDT;
        this.Total = Total;
    }

    public Order(int OrdersID, String username, int NhanVienID, Date NgayTao, Date NgayNhan, int TinhTrang, String TenNguoiNhan, String DiaChi, String SDT) {
        this.OrdersID = OrdersID;
        this.username = username;
        this.NhanVienID = NhanVienID;
        this.NgayTao = NgayTao;
        this.NgayNhan = NgayNhan;
        this.TinhTrang = TinhTrang;
        this.TenNguoiNhan = TenNguoiNhan;
        this.DiaChi = DiaChi;
        this.SDT = SDT;
        
    }

    public int getOrdersID() {
        return OrdersID;
    }

    public void setOrdersID(int OrdersID) {
        this.OrdersID = OrdersID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getNhanVienID() {
        return NhanVienID;
    }

    public void setNhanVienID(int NhanVienID) {
        this.NhanVienID = NhanVienID;
    }

    public Date getNgayTao() {
        return NgayTao;
    }

    public void setNgayTao(Date NgayTao) {
        this.NgayTao = NgayTao;
    }

    public Date getNgayNhan() {
        return NgayNhan;
    }

    public void setNgayNhan(Date NgayNhan) {
        this.NgayNhan = NgayNhan;
    }

    public int getTinhTrang() {
        return TinhTrang;
    }

    public void setTinhTrang(int TinhTrang) {
        this.TinhTrang = TinhTrang;
    }

    public String getTenNguoiNhan() {
        return TenNguoiNhan;
    }

    public void setTenNguoiNhan(String TenNguoiNhan) {
        this.TenNguoiNhan = TenNguoiNhan;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public int getTotal() {
        return Total;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }

    
    
    
}

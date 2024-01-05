/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

import data.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class DAOorder extends DBContext {

    ArrayList<Order> list = new ArrayList<>();
    ArrayList<OrderDetail> listDetail=new ArrayList<>();
    public boolean insertOrder(int OrderID, String username, int TinhTrang, String TenNguoiNhan, String DiaChi, String SDT) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "insert into Orders(OrdersID,username,NgayTao,NgayNhan,TinhTrang,TenNguoiNhan,DiaChi,SDT)\n"
                        + "values(?,?,FORMAT(GETDATE(), 'yyyy-MM-dd'),FORMAT(GETDATE()+3, 'yyyy-MM-dd'),?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, OrderID);
                stm.setString(2, username);
                stm.setInt(3, TinhTrang);
                stm.setString(4, TenNguoiNhan);
                stm.setString(5, DiaChi);
                stm.setString(6, SDT);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
}
        }finally{
            
        }
        return false;
    }
    
    public ArrayList<Order> getAllOrder() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "select * from Orders";
                stm = con.prepareStatement(sql);               
                rs = stm.executeQuery();
                while (rs.next()) {
     int ID = rs.getInt("OrdersID");
     String name = rs.getString("username");
     int NhanVienid = rs.getInt("NhanVienID");
     Date Ngaytao = rs.getDate("NgayTao");
     Date Ngaynhan =rs.getDate("NgayNhan");
     int Tinhtrang =rs.getInt("TinhTrang");
     String TennguoiNhan =rs.getString("TenNguoiNhan");
     String Diachi =rs.getString("DiaChi");
     String sdt =rs.getString("SDT");
     int total=rs.getInt("Total");
     list.add(new Order(ID,name,NhanVienid,Ngaytao,Ngaynhan,Tinhtrang,TennguoiNhan,Diachi,sdt,total));
}
}
        }finally{
            
        }
        return list;
    }
    
    public ArrayList<Order> getAllOrderDaXacNhan() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "select * from Orders where TinhTrang=1";
                stm = con.prepareStatement(sql);               
                rs = stm.executeQuery();
                while (rs.next()) {
     int ID = rs.getInt("OrdersID");
     String name = rs.getString("username");
     int NhanVienid = rs.getInt("NhanVienID");
     Date Ngaytao = rs.getDate("NgayTao");
     Date Ngaynhan =rs.getDate("NgayNhan");
     int Tinhtrang =rs.getInt("TinhTrang");
     String TennguoiNhan =rs.getString("TenNguoiNhan");
     String Diachi =rs.getString("DiaChi");
     String sdt =rs.getString("SDT");
     int total=rs.getInt("Total");
     list.add(new Order(ID,name,NhanVienid,Ngaytao,Ngaynhan,Tinhtrang,TennguoiNhan,Diachi,sdt,total));
}
}
        }finally{
            
        }
        return list;
    }
    public boolean insertOrderDetail(int Ordersid,int Itemid,int Quantity,int TotalPrice) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="insert into Orderdetails(Ordersid,Itemid,Quantity,TotalPrice) " + "values(?,?,?,?)";
                stm=con.prepareStatement(sql);
                stm.setInt(1, Ordersid);
                stm.setInt(2, Itemid);
                stm.setInt(3, Quantity);
                stm.setInt(4, TotalPrice);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        
        return false;
    }
    public boolean deleteOrder(int id) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="delete from Cart " +
"		 where CartId=?";
                stm=con.prepareStatement(sql);
                stm.setInt(1, id);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        
        return false;
    }
    public boolean updateTinhTrang(int ID,int role ) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="update Orders " +
"		 set TinhTrang=? " +
"		 where OrdersID=? ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, role);
                stm.setInt(2, ID);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
    public boolean updateNhanVienID(int ID,String username ) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="update Orders " +
"set NhanvienID=(select NhanvienID from Nhanvien where username=? ) " +
"where OrdersID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setInt(2, ID);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
    public boolean getTotal(int ID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="update Orders " +
"set Total= (SELECT SUM(TotalPrice) as Total " +
"FROM Orderdetails " +
"WHERE Ordersid = ?) " +
"where OrdersID=?";
            stm=con.prepareStatement(sql);
            stm.setInt(1, ID);
            stm.setInt(2, ID);
            int a=stm.executeUpdate();
            if(a>0)
                return true;
            
        }finally{
            
        }
        return false;
    }
    public ArrayList<Order> DoanhThuNam( int nam) throws ClassNotFoundException, SQLException{
        list=new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "select * from Orders " +
"where Year(NgayTao)=? and TinhTrang=1";
                stm = con.prepareStatement(sql);     
                stm.setInt(1, nam);
                rs = stm.executeQuery();
                while (rs.next()) {
     int ID = rs.getInt("OrdersID");
     String name = rs.getString("username");
     int NhanVienid = rs.getInt("NhanVienID");
     Date Ngaytao = rs.getDate("NgayTao");
     Date Ngaynhan =rs.getDate("NgayNhan");
     int Tinhtrang =rs.getInt("TinhTrang");
     String TennguoiNhan =rs.getString("TenNguoiNhan");
     String Diachi =rs.getString("DiaChi");
     String sdt =rs.getString("SDT");
     int total=rs.getInt("Total");
     list.add(new Order(ID,name,NhanVienid,Ngaytao,Ngaynhan,Tinhtrang,TennguoiNhan,Diachi,sdt,total));
}
}
        }finally{
            
        }
        return list;
    }
    public ArrayList<Order> DoanhThuNamThang( int nam,int thang) throws ClassNotFoundException, SQLException{
        list=new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "select * from Orders " +
"where Year(NgayTao)=? and MONTH(NgayTao)=? and TinhTrang=1";
                stm = con.prepareStatement(sql);     
                stm.setInt(1, nam);
                stm.setInt(2, thang);
                rs = stm.executeQuery();
                while (rs.next()) {
     int ID = rs.getInt("OrdersID");
     String name = rs.getString("username");
     int NhanVienid = rs.getInt("NhanVienID");
     Date Ngaytao = rs.getDate("NgayTao");
     Date Ngaynhan =rs.getDate("NgayNhan");
     int Tinhtrang =rs.getInt("TinhTrang");
     String TennguoiNhan =rs.getString("TenNguoiNhan");
     String Diachi =rs.getString("DiaChi");
     String sdt =rs.getString("SDT");
     int total=rs.getInt("Total");
     list.add(new Order(ID,name,NhanVienid,Ngaytao,Ngaynhan,Tinhtrang,TennguoiNhan,Diachi,sdt,total));
}
}
        }finally{
            
        }
        return list;
    }
    
    public ArrayList<Order> DoanhThuNamThangNgay( int nam,int thang,int ngay) throws ClassNotFoundException, SQLException{
        list=new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "select * from Orders " +
"where Year(NgayTao)=? and MONTH(NgayTao)=? and DAY(NgayTao)=? and TinhTrang=1";
                stm = con.prepareStatement(sql);     
                stm.setInt(1, nam);
                stm.setInt(2, thang);
                stm.setInt(3, ngay);
                rs = stm.executeQuery();
                while (rs.next()) {
     int ID = rs.getInt("OrdersID");
     String name = rs.getString("username");
     int NhanVienid = rs.getInt("NhanVienID");
     Date Ngaytao = rs.getDate("NgayTao");
     Date Ngaynhan =rs.getDate("NgayNhan");
     int Tinhtrang =rs.getInt("TinhTrang");
     String TennguoiNhan =rs.getString("TenNguoiNhan");
     String Diachi =rs.getString("DiaChi");
     String sdt =rs.getString("SDT");
     int total=rs.getInt("Total");
     list.add(new Order(ID,name,NhanVienid,Ngaytao,Ngaynhan,Tinhtrang,TennguoiNhan,Diachi,sdt,total));
}
}
        }finally{
            
        }
        return list;
    }
    public ArrayList<OrderDetail> getAllOrderDetail() throws ClassNotFoundException, SQLException{       
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBContext.makeConnection();
            String sql="select * from Orderdetails";
            stm=con.prepareStatement(sql);
            rs=stm.executeQuery();
            while(rs.next()){
                int Ordersid=rs.getInt("Ordersid");
                int Itemid=rs.getInt("Itemid");
                int Quantity=rs.getInt("Quantity");
                int TotalPrice=rs.getInt("TotalPrice");
                listDetail.add(new OrderDetail(Ordersid,Itemid,Quantity,TotalPrice));
            }
        }finally{
            
        }
        return listDetail;
    }
    public boolean deleteDon(int id) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
            String sql="delete from Orders " +
"		 where OrdersID =?";
            stm=con.prepareStatement(sql);
            stm.setInt(1, id);
            int a=stm.executeUpdate();
            if(a>0)
                return true;
            }
        }finally{
            
        }
        return false;
    }
    
    public boolean xoaOrder(int id) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="delete from Orderdetails\n" +
"		 where Ordersid=?\n" +
"		 delete from Orders\n" +
"		 where OrdersID=?";
            stm=con.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, id);
            int a=stm.executeUpdate();
            if(a>0)
                return true;
        }finally{
            
        }
        return false;
    }
}

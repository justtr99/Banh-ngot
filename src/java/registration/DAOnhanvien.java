/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

import data.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class DAOnhanvien extends DBContext {
    ArrayList<NhanVien> list=new ArrayList<>();
    public boolean insertNhanVien(int NhanvienID,String username) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="insert into Nhanvien(NhanvienID,role,username) " +
"values(?,1,?)";
                stm=con.prepareCall(sql);
                stm.setInt(1, NhanvienID);
                stm.setString(2, username);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
    public ArrayList<NhanVien> getAllnv() throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="select * from Nhanvien";
                stm=con.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    int NhanvienID=rs.getInt("NhanvienID");
                    int role=rs.getInt("role");
                    String username=rs.getString("username");
                    list.add(new NhanVien(NhanvienID,role,username));
                }
            }
        }finally{
            
        }
        return list;
    }
    public boolean deleteNhanVien(String username) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="update Orders\n" +
"		 set NhanvienID=1\n" +
"		 where NhanvienID= (select NhanvienID  from Nhanvien where username=?) "
                        + "delete from Nhanvien " +
"where username=? " ;

                stm=con.prepareCall(sql);
                stm.setString(1, username);
                stm.setString(2, username);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
    public int getIDnv(String username){
        int id=0;
        
        
        
        return id;
    }
}

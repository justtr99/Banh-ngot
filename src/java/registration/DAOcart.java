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
public class DAOcart extends DBContext {
    
     ArrayList<Cart> list=new ArrayList<>();
     public boolean insertCart(int CartID,int ItemID,int Quantity,String username) throws ClassNotFoundException, SQLException{
         Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="insert into Cart(CartId,ItemId,Quantity,username) " +
                            "values(?,?,?,?) ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, CartID);
                stm.setInt(2, ItemID);
                stm.setInt(3, Quantity);
                stm.setString(4, username);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
               
            }
        }finally{
            
        }
         return false;
     }
     public ArrayList<Cart> getAllCart() throws SQLException, ClassNotFoundException{
         Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="select Cart.CartId,Cart.ItemId,Cart.Quantity,Cart.username,Item.Img,Item.ItemName,Item.Price\n" +
"from Cart join Item on Cart.ItemId=Item.ID ";
                stm=con.prepareStatement(sql);                
                rs=stm.executeQuery();
                while(rs.next()){
                    int Cart=rs.getInt("CartID");
                    int Item=rs.getInt("ItemId");
                    int quantity=rs.getInt("Quantity");
                    String name=rs.getString("username");
                    String img=rs.getString("Img");
                    String Itemname=rs.getString("ItemName");
                    int price=rs.getInt("Price");
                    list.add(new Cart(Cart,Item,quantity,name,img,Itemname,price));
                }
            }
        }finally{
            
        }
         
         return list;
     }
    public boolean deleteCart(int id) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="delete from Cart where CartID=?";
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
    public boolean updateCart(int id,int quantity) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="update Cart " +
"set Quantity=? " +
"where CartId=?";
                stm=con.prepareStatement(sql);   
                stm.setInt(1, quantity);
                stm.setInt(2, id);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        return false;
        
    }
    
    public boolean deleteCart(String username) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="delete from Cart\n" +
"	where username=?";
            stm=con.prepareStatement(sql);
            stm.setString(1, username);
            int a=stm.executeUpdate();
            if(a>0)
                return true;            
        }finally{
            
        }
        
        return false;
    }
}

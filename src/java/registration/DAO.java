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
public class DAO extends DBContext {
    
    ArrayList<Account> acc=new ArrayList<>();
    ArrayList<Item> listItem=new ArrayList<>();
    public boolean checkLogin (String username, String password)
            throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            //1. Connect DB
            con = DBContext.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="Select username "
                        + "FROM Account "
                        + "WHERE username = ? "
                        + "AND password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if(rs.next()){
                    return true;
                }
            }
        }
        finally{
            
        }
        return false;
    }
    public boolean deleteAccount(String username) throws ClassNotFoundException, SQLException{
       Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="delete from Account " +
"where username=?";
            stm=con.prepareStatement(sql);
            stm.setString(1, username);
            int a=stm.executeUpdate();
            if(a>0)
                return true;
        }finally{
            
        }
               
        return false;
    }
    public Account getAccount(String name) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account acc=null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="select * "
                        + "from Account "
                        + "where username=? ";
                stm=con.prepareStatement(sql);
                stm.setString(1, name);
                rs=stm.executeQuery();
                if(rs.next()){
                    acc=new Account(rs.getString("username"),rs.getString("password"),rs.getString("Email"),rs.getInt("role"));
                    return acc;
                }
                
            }
        }finally{
            
        }
        return null;
    }
    
    public ArrayList<Account> getListAccount() throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="select * "
                        + "from Account";
                stm=con.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String name=rs.getString("username");
                    String pass=rs.getString("password");
                    String email=rs.getString("Email");
                    int role=rs.getInt("role");
                    if(this.acc==null)
                        acc=new ArrayList<>();
                    acc.add(new Account(name,pass,email,role));
                }
            }
        }finally{           
        }
        
        return acc;
    }
    
    public ArrayList<Account> getListAccountByName( String a) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="select * "
                        + "from Account where username like ?";
                stm=con.prepareStatement(sql);
                stm.setString(1, a+"%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String name=rs.getString("username");
                    String pass=rs.getString("password");
                    String email=rs.getString("Email");
                    int role=rs.getInt("role");
                    if(this.acc==null)
                        acc=new ArrayList<>();
                    acc.add(new Account(name,pass,email,role));
                }
            }
        }finally{           
        }
        
        return acc;
    }
    
    public boolean updateRole(String username,int a) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="update Account "
                        + "set role=? "
                        +"where username=? ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, a);
                stm.setString(2, username);
                int row=stm.executeUpdate();
                if(row>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
    
    public boolean updatePassword(String username,String password) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="update Account "
                        + "set password=? "
                        +"where username=? ";
                stm=con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, username);
                int row=stm.executeUpdate();
                if(row>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
    
    public boolean insertAccount(String username,String password,String email) throws ClassNotFoundException, SQLException{
        
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBContext.makeConnection();
            if(con!=null){
                String sql="insert into Account(username,password,Email,role) "
                        + "values(?,?,?,0)";
                stm=con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, email);
                int row=stm.executeUpdate();
                if(row>0)
                    return true;
            }
        }finally{
            
        }
        
        return false;
    }
    
    public ArrayList<Item> getItem() throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            
           con=DBContext.makeConnection();
           String sql="select * from Item";
           stm=con.prepareStatement(sql);
           rs=stm.executeQuery();
           while(rs.next()){
               int ID=rs.getInt("ID");
               String ItemName=rs.getString("ItemName");
               int Price=rs.getInt("Price");
               String Description=rs.getString("Description");
               String Introduction=rs.getString("Introduction");
               int Quantity=rs.getInt("Quantity");
               int TypeID=rs.getInt("TypeID");
               String Img=rs.getString("Img");
               
               if(this.listItem==null)
                   listItem=new ArrayList<>();
               listItem.add(new Item(ID,ItemName,Price,Description,Introduction,Quantity,TypeID,Img));
           }
        }finally{
            
        }
        
        return listItem;
    }
    public ArrayList<Item> getItemByName( String a) throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            
           con=DBContext.makeConnection();
           String sql="select * from Item where ItemName like ?";
           
           stm=con.prepareStatement(sql);
           stm.setString(1, a+"%");
           rs=stm.executeQuery();
           while(rs.next()){
               int ID=rs.getInt("ID");
               String ItemName=rs.getString("ItemName");
               int Price=rs.getInt("Price");
               String Description=rs.getString("Description");
               String Introduction=rs.getString("Introduction");
               int Quantity=rs.getInt("Quantity");
               int TypeID=rs.getInt("TypeID");
               String Img=rs.getString("Img");
               
               if(this.listItem==null)
                   listItem=new ArrayList<>();
               listItem.add(new Item(ID,ItemName,Price,Description,Introduction,Quantity,TypeID,Img));
           }
        }finally{
            
        }
        
        return listItem;
    }
    public ArrayList<Item> getItemOderByPriceThap() throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            
           con=DBContext.makeConnection();
           String sql="select * from Item " +
"order by Price ";
           stm=con.prepareStatement(sql);
           rs=stm.executeQuery();
           while(rs.next()){
               int ID=rs.getInt("ID");
               String ItemName=rs.getString("ItemName");
               int Price=rs.getInt("Price");
               String Description=rs.getString("Description");
               String Introduction=rs.getString("Introduction");
               int Quantity=rs.getInt("Quantity");
               int TypeID=rs.getInt("TypeID");
               String Img=rs.getString("Img");
               
               if(this.listItem==null)
                   listItem=new ArrayList<>();
               listItem.add(new Item(ID,ItemName,Price,Description,Introduction,Quantity,TypeID,Img));
           }
        }finally{
            
        }
        
        return listItem;
    }
    
    public ArrayList<Item> getItemOderByPriceCao() throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            
           con=DBContext.makeConnection();
           String sql="select * from Item " +
"order by Price desc ";
           stm=con.prepareStatement(sql);
           rs=stm.executeQuery();
           while(rs.next()){
               int ID=rs.getInt("ID");
               String ItemName=rs.getString("ItemName");
               int Price=rs.getInt("Price");
               String Description=rs.getString("Description");
               String Introduction=rs.getString("Introduction");
               int Quantity=rs.getInt("Quantity");
               int TypeID=rs.getInt("TypeID");
               String Img=rs.getString("Img");
               
               if(this.listItem==null)
                   listItem=new ArrayList<>();
               listItem.add(new Item(ID,ItemName,Price,Description,Introduction,Quantity,TypeID,Img));
           }
        }finally{
            
        }
        
        return listItem;
    }
    
    public ArrayList<Item> getItemOderByPriceID() throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            
           con=DBContext.makeConnection();
           String sql="select * from Item " +
"order by ID desc ";
           stm=con.prepareStatement(sql);
           rs=stm.executeQuery();
           while(rs.next()){
               int ID=rs.getInt("ID");
               String ItemName=rs.getString("ItemName");
               int Price=rs.getInt("Price");
               String Description=rs.getString("Description");
               String Introduction=rs.getString("Introduction");
               int Quantity=rs.getInt("Quantity");
               int TypeID=rs.getInt("TypeID");
               String Img=rs.getString("Img");
               
               if(this.listItem==null)
                   listItem=new ArrayList<>();
               listItem.add(new Item(ID,ItemName,Price,Description,Introduction,Quantity,TypeID,Img));
           }
        }finally{
            
        }
        
        return listItem;
    }
    
    public boolean updateItem(int ID,String ItemName,int Price,String Description,String Introduction,int Quantity,int TypeID,String Img  ) throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="update Item " +
"set ItemName=?,Price=?,Description=?,Introduction=?,Quantity=?,TypeID=?,Img=? " +
"where ID=?";
            stm=con.prepareStatement(sql);
            stm.setString(1, ItemName);
            stm.setInt(2, Price);
            stm.setString(3, Description);
            stm.setString(4, Introduction);
            stm.setInt(5, Quantity);
            stm.setInt(6, TypeID);
            stm.setString(7, Img);
            stm.setInt(8,ID );
            int a=stm.executeUpdate();
            if(a>0)
                return true;
        }finally{
            
        }
        
        return false;
    }
    
    public boolean insertItem(int ID,String ItemName,int Price,String Description,String Introduction,int Quantity,int TypeID,String Img ) throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="INSERT INTO Item (ID, ItemName, Price, Description, Introduction, Quantity, TypeID, Img) " +
"VALUES(?,?,?,?,?,?,?,?)";
            stm=con.prepareStatement(sql);
            stm.setInt(1,ID );
            stm.setString(2, ItemName);
            stm.setInt(3, Price);
            stm.setString(4, Description);
            stm.setString(5, Introduction);
            stm.setInt(6, Quantity);
            stm.setInt(7, TypeID);
            stm.setString(8, Img);
            int a=stm.executeUpdate();
            if(a>0)
                return true;
        }finally{
            
        }
        
        
        return false;
    }
    
    public boolean deleteItem(int ID) throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            String sql="delete from Item where ID=?";
            stm=con.prepareStatement(sql);
            stm.setInt(1, ID);
            int a=stm.executeUpdate();
            if(a>0)
                return true;
        }finally{
            
        }
        
        return false;
    }
    public boolean updateQunatity(int ID,int sluong) throws ClassNotFoundException, SQLException{
        Connection con=null;
        PreparedStatement stm = null;
        try{
            con=DBContext.makeConnection();
            if(con!=null){
                String sql="update Item " +
"set Quantity=Quantity - ? " +
"where ID=?";
                stm=con.prepareStatement(sql);
                stm.setInt(1, sluong);
                stm.setInt(2, ID);
                int a=stm.executeUpdate();
                if(a>0)
                    return true;
            }
        }finally{
            
        }
        return false;
    }
}

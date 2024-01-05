/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int Ordersid;
    private int Itemid;
    private int Quantity;
    private int TotalPrice;

    public OrderDetail() {
    }

    public OrderDetail(int Ordersid, int Itemid, int Quantity, int TotalPrice) {
        this.Ordersid = Ordersid;
        this.Itemid = Itemid;
        this.Quantity = Quantity;
        this.TotalPrice = TotalPrice;
    }

    public int getOrdersid() {
        return Ordersid;
    }

    public void setOrdersid(int Ordersid) {
        this.Ordersid = Ordersid;
    }

    public int getItemid() {
        return Itemid;
    }

    public void setItemid(int Itemid) {
        this.Itemid = Itemid;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }
    
}

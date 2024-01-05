/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

/**
 *
 * @author Admin
 */
public class Cart {
    private int CartId;
    private int ItemID;
    private int Quantity;
    private String username;
    private String img;
    private String ItemName;
    private int Price;

    public Cart(int CartId, int ItemID, int Quantity, String username, String img, String ItemName, int Price) {
        this.CartId = CartId;
        this.ItemID = ItemID;
        this.Quantity = Quantity;
        this.username = username;
        this.img = img;
        this.ItemName = ItemName;
        this.Price = Price;
    }

    public Cart() {
    }

    public int getCartId() {
        return CartId;
    }

    public void setCartId(int CartId) {
        this.CartId = CartId;
    }

    public int getItemID() {
        return ItemID;
    }

    public void setItemID(int ItemID) {
        this.ItemID = ItemID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getItemName() {
        return ItemName;
    }

    public void setItemName(String ItemName) {
        this.ItemName = ItemName;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }
    
    
}

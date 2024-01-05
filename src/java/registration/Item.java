/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

/**
 *
 * @author Admin
 */
public class Item {
    private int ID;
    private String ItemName;
    private int Price;
    private String Description;
    private String Introduction;
    private int Quantity;
    private int TypeID;
    private String Img;

    public Item() {
    }

    public Item(int ID, String ItemName, int Price, String Description, String Introduction, int Quantity, int TypeID, String Img) {
        this.ID = ID;
        this.ItemName = ItemName;
        this.Price = Price;
        this.Description = Description;
        this.Introduction = Introduction;
        this.Quantity = Quantity;
        this.TypeID = TypeID;
        this.Img = Img;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getIntroduction() {
        return Introduction;
    }

    public void setIntroduction(String Introduction) {
        this.Introduction = Introduction;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getTypeID() {
        return TypeID;
    }

    public void setTypeID(int TypeID) {
        this.TypeID = TypeID;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }
    
    
}

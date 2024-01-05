/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package registration;

/**
 *
 * @author Admin
 */
public class NhanVien {
    private int NhanvienID;
    private int role;
    private String username;

    public NhanVien() {
    }

    public NhanVien(int NhanvienID, int role, String username) {
        this.NhanvienID = NhanvienID;
        this.role = role;
        this.username = username;
    }

    public int getNhanvienID() {
        return NhanvienID;
    }

    public void setNhanvienID(int NhanvienID) {
        this.NhanvienID = NhanvienID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
    
}

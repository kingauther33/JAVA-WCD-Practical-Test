package com.example.javawcdpracticaltest.entity;

import com.example.javawcdpracticaltest.annotation.Column;
import com.example.javawcdpracticaltest.annotation.Entity;
import com.example.javawcdpracticaltest.annotation.Id;
import com.example.javawcdpracticaltest.util.SQLDataTypes;

import java.util.Date;
import java.util.HashMap;

@Entity(tableName = "phones")
public class Phone {

    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = SQLDataTypes.INTEGER)
    private int id;
    @Column(columnName = "name", columnType = SQLDataTypes.VARCHAR50)
    private String name;
    @Column(columnName = "brand", columnType = SQLDataTypes.VARCHAR50)
    private String brand;
    @Column(columnName = "price", columnType = SQLDataTypes.DOUBLE)
    private double price;
    @Column(columnName = "description", columnType = SQLDataTypes.VARCHAR255)
    private String description;
    @Column(columnName = "edit_date", columnType = SQLDataTypes.DATETIME)
    private Date editDate;
    @Column(columnName = "is_deleted", columnType = SQLDataTypes.SMALL_INTEGER)
    private int isDeleted;

    public Phone() {
        this.name = "";
        this.brand = "";
        this.price = 0;
        this.description = "";
        this.editDate = new Date();
        this.isDeleted = 0;
    }

    public Phone(String name, String brand, double price, String description) {
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.description = description;
        this.editDate = new Date();
        this.isDeleted = 0;
    }

    @Override
    public String toString() {
        return "Phone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", price='" + price + '\'' +
                ", description='" + description + '\'' +
                ", editDate=" + editDate +
                ", isDeleted=" + isDeleted +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getEditDate() {
        return editDate;
    }

    public void setEditDate(Date editDate) {
        this.editDate = editDate;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    // kiểm tra đối tượng có hợp lệ hay không.
    public boolean isValid() {
        return getErrors().size() == 0;
    }

    // trả về danh sách lỗi
    public HashMap<String, String> getErrors() {
        HashMap<String, String> errors = new HashMap<>();
        if (name == null || name.length() == 0) {
            errors.put("name", "Name cannot be empty");
        }

        if (brand == null || brand.length() == 0 || brand.equalsIgnoreCase("Please select one of the follow brand")) {
            errors.put("brand", "Please select a brand");
        }

        if (price <= 0) {
            errors.put("price", "Price cannot be negative or equals to zero.");
        }

        if (description == null || name.length() == 0) {
            errors.put("description", "Description cannot be empty.");
        }
        return errors;
    }
}

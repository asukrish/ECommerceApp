package model;

import java.util.Date;
import java.util.List;

public class Order {
    private int id;
    private int userId;
    private String address;
    private String paymentMethod;
    private String status;
    private Date createdAt;        // new: store when order was placed
    private List<OrderItem> items;

    public Order() {}

    public Order(int id, int userId, String address, String paymentMethod, String status, Date createdAt) {
        this.id = id;
        this.userId = userId;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public List<OrderItem> getItems() { return items; }
    public void setItems(List<OrderItem> items) { this.items = items; }
}

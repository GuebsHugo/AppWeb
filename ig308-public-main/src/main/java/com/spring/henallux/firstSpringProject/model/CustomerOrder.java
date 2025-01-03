package com.spring.henallux.firstSpringProject.model;

import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

public class CustomerOrder {

    private Integer id;

    @NotNull(message = "User is required")
    private User user;

    private Timestamp date;

    @NotNull(message = "Total is required")
    private Double total;

    @NotNull(message = "Status is required")
    private OrderStatus status;

    public enum OrderStatus {
        PENDING,
        PAID
    }

    // Constructors, getters, and setters

    public CustomerOrder() {}

    public CustomerOrder(Integer id, User user, Double total, OrderStatus status) {
        this.id = id;
        this.user = user;
        this.total = total;
        this.status = status;
        this.date = new Timestamp(System.currentTimeMillis()); // Automatically set to current timestamp
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }
}

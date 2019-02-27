package beans;

import java.io.Serializable;
import java.sql.Date;
import utils.Utility;

/**
 *
 * @author Amer Shaker
 */
public class OrderBean implements Serializable {

    private int orderId;
    private Date orderDate;
    private double orderPrice;
    private int transactionId;
    private int userId;
    private UserBean user;
    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getOrderDate() {
        if (orderDate != null) {
            Utility.getFormatedDate(orderDate);
        }

        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public UserBean getUser() {
        return user;
    }

    public void setUser(UserBean user) {
        this.user = user;
    }
}

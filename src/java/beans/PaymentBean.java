/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Date;

/**
 *
 * @author Mohamed Ramadan
 */
public class PaymentBean {
    
    int userId;
    long amount;
    String date;

    

    public PaymentBean() {
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUserId() {
        return userId;
    }

    public long getAmount() {
        return amount;
    }

    public String getDate() {
        return date;
    }
    
    
}

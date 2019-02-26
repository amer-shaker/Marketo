package beans;

import java.io.Serializable;

/**
 * @author Amer Shaker
 */
public class ProductBean implements Serializable {

    private int productId;
    private String productName;
    private String describtion;
    private double price;
    private int quantity;
    private String productImage;
    private int cateegoryId;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescribtion() {
        return describtion;
    }

    public void setDescribtion(String describtion) {
        this.describtion = describtion;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getCateegoryId() {
        return cateegoryId;
    }

    public void setCateegoryId(int cateegoryId) {
        this.cateegoryId = cateegoryId;
    }
}
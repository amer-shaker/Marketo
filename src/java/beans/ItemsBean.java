package beans;

public class ItemsBean {

    private int productId;
    private String productName;

    private double price;
    private int quantity;
    private String image;


    public ItemsBean() {

    }

    public ItemsBean(int productId,String image, int quantity ,String productName, double price) {
        this.productId=productId;
        this.productName = productName;
     
        this.price = price;
        this.quantity = quantity;
        this.image = image;
      
    }

public int getproductId()
{
    return productId;
}
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }



}

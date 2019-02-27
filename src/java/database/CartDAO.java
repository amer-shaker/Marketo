/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

//import beans.ItemBean;
import beans.ItemsBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class CartDAO {

    // Connection and Statement for creating queries
    // CART TABLE COLUMN

    public static final String USER_ID = "USER_ID";
    public static final String ORDER_LINE_ITEMS_TABLE = "ORDER_LINE_ITEMS";
    public static final String CART_TABLE = "CART";
    private static final String PRODUCT_ID = "PRODUCT_ID";
    private static final String PRODUCT_NAME = "PRODUCT_NAME";
    private static final String DESCRIPTION = "DESCRIPTION";
    private static final String PRICE = "PRICE";
    private static final String QUANTITY = "QUANTITY";
    private static final String PRODUCT_IMAGE = "IMAGE";
    private static final String CATEGORY_ID = "CATEGORY_ID";
    private static final String CART_ID = "CART_ID";
int cart_id = 0;
    private Connection connection;
    private PreparedStatement preparedStatement;
    public ResultSet resultSet;
    ArrayList<ItemsBean> items = null;

    public CartDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

    public int getCartId(int userid) throws SQLException {
        int cart_id = 0;
        
        try {
            preparedStatement = connection.prepareStatement("SELECT cart_id from " + CART_TABLE + " where user_id = ?");
            preparedStatement.setInt(1, userid);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                cart_id = resultSet.getInt("cart_id");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return cart_id;
    }

    private void closeResources() throws SQLException {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
                preparedStatement = null;
            }

            if (resultSet != null) {
                resultSet.close();
                resultSet = null;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    public boolean addProductToCart(int quantity, int product_id,int user_id) throws SQLException {

        boolean isSuccess = false;
        boolean flag=false;
       cart_id= getCartId(user_id);
       items=getProductItems();
         if(items!=null){
           for (ItemsBean item:items)
           {
               if(item.getproductId()==product_id)
               {
                   flag=true;
               }
           }
            }
         if(flag==false){
       try {
            
            preparedStatement = connection.prepareStatement("insert into " + ORDER_LINE_ITEMS_TABLE + "(" + QUANTITY + "," + PRODUCT_ID + "," + CART_ID + ") values (?,?,?)");
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, product_id);
            preparedStatement.setInt(3, cart_id);
            isSuccess = preparedStatement.executeUpdate() > 0;

            System.out.println(cart_id);
    
       } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

         } 
    
         return isSuccess;
    }
    public ArrayList<ItemsBean> getProductItems() throws SQLException {

        try {
            preparedStatement = connection.prepareStatement("SELECT product.PRODUCT_ID,product.PRODUCT_NAME,product.PRICE,ITEM.QUANTITY ,product.IMAGE FROM  product  product ,  ORDER_LINE_ITEMS item  WHERE product.PRODUCT_id = item.PRODUCT_id AND item.CART_ID = ? ");
           preparedStatement.setInt(1, cart_id);
            resultSet = preparedStatement.executeQuery();

            items = new ArrayList<>();

            while (resultSet.next()) {
                items.add(new ItemsBean(
                        resultSet.getInt(PRODUCT_ID),
                        resultSet.getBlob(PRODUCT_IMAGE) + "",
                        resultSet.getInt(QUANTITY),
                        resultSet.getString(PRODUCT_NAME),
                        resultSet.getDouble(PRICE))
                );
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return items;
    }

    public boolean deleteItem(int product_id) throws SQLException {

        boolean isSuccess = false;
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM  ORDER_LINE_ITEMS  WHERE  PRODUCT_ID  = ?");
            preparedStatement.setInt(1, product_id);

            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }
//       for(ItemsBean item:items)
//           {
//               if(item.getproductId()==product_id)
//               {      System.out.println(item.getProductName());
//              items.remove(item);
//               }       
//          
//           }
        return isSuccess;
    }
}

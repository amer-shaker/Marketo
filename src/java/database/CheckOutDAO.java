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
public class CheckOutDAO {

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

    public CheckOutDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

//    public boolean addOrders(int product_id, int transaction_id, int user_id) throws SQLException {
//
//        boolean isSuccess = false;
//        boolean flag = false;
//        //  cart_id= getCartId(user_id);
//
//        try {
//
//            preparedStatement = connection.prepareStatement("insert into " + ORDER_LINE_ITEMS_TABLE + "(" + QUANTITY + "," + PRODUCT_ID + "," + CART_ID + ") values (?,?,?)");
//            preparedStatement.setInt(1, quantity);
//            preparedStatement.setInt(2, product_id);
//            preparedStatement.setInt(3, cart_id);
//            isSuccess = preparedStatement.executeUpdate() > 0;
//
//            System.out.println(cart_id);
//
//        } catch (SQLException ex) {
//            System.err.println(ex.getMessage());
//        } finally {
//            closeResources();
//        }
//
//        return isSuccess;
//    }

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
}

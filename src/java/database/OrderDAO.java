package database;

import beans.OrderBean;
import beans.UserBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Amer Shaker
 */
public class OrderDAO {

    private static final String ORDERS_TABLE = "CUSTOMER_ORDER";
    private static final String USERS_TABLE = "USERS";

    // Products Table Columns
    private static final String ORDER_ID_COLUMN = "ORDER_ID";
    private static final String ORDER_DATE_COLUMN = "ORDER_DATE";
    private static final String ORDER_PRICE_COLUMN = "ORDER_PRICE";
    private static final String TRANSACTION_ID_COLUMN = "TRANSACTION_ID";
    private static final String USER_ID_COLUMN = "USER_ID";

    // Users Table Columns
    private static final String USER_ID = "USER_ID";
    private static final String FIRST_NAME = "FIRST_NAME";
    private static final String LAST_NAME = "LAST_NAME";
    private static final String USER_NAME = "USER_NAME";
    private static final String PASSWORD = "PASSWORD";
    private static final String EMAIL_ADDRESS = "EMAIL_ADDRESS";
    private static final String ADDRESS = "ADDRESS";

    // Connection and Statement for creating queries
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public OrderDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

    public boolean addOrder(OrderBean order) throws SQLException {

        boolean isSuccess = false;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO " + ORDERS_TABLE
                    + " (" + ORDER_DATE_COLUMN
                    + ", " + ORDER_PRICE_COLUMN
                    + ", " + TRANSACTION_ID_COLUMN
                    + ", " + USER_ID_COLUMN + ") VALUES (SYSDATE, ?, ?, ?)");

            if (order != null) {
                preparedStatement.setDouble(1, order.getOrderPrice());
                preparedStatement.setDouble(2, order.getTransactionId());
                preparedStatement.setInt(3, order.getUserId());

                isSuccess = preparedStatement.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public OrderBean getOrderById(int orderId) throws SQLException {

        OrderBean order = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + ORDERS_TABLE
                    + " WHERE " + ORDER_ID_COLUMN + " = ?");
            preparedStatement.setInt(1, orderId);
            resultSet = preparedStatement.executeQuery();

            order = new OrderBean();

            while (resultSet.next()) {
                order.setOrderId(resultSet.getInt(ORDER_ID_COLUMN));
                order.setOrderDate(resultSet.getDate(ORDER_DATE_COLUMN));
                order.setOrderPrice(resultSet.getDouble(ORDER_PRICE_COLUMN));
                order.setTransactionId(resultSet.getInt(TRANSACTION_ID_COLUMN));
                order.setUserId(resultSet.getInt(USER_ID_COLUMN));
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return order;
    }

    public List<OrderBean> getOrders() throws SQLException {

        ArrayList<OrderBean> orders = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT O.*, U." + USER_NAME
                    + ", U." + ADDRESS
                    + ", U." + EMAIL_ADDRESS + " FROM " + ORDERS_TABLE
                    + " O JOIN " + USERS_TABLE + " U"
                    + " ON (O." + USER_ID + " = U." + USER_ID + ")"
                    + " ORDER BY " + ORDER_ID_COLUMN + " ASC");
            resultSet = preparedStatement.executeQuery();

            orders = new ArrayList<>();

            while (resultSet.next()) {
                OrderBean order = new OrderBean();
                order.setOrderId(resultSet.getInt(ORDER_ID_COLUMN));
                order.setOrderDate(resultSet.getDate(ORDER_DATE_COLUMN));
                order.setOrderPrice(resultSet.getDouble(ORDER_PRICE_COLUMN));
                order.setTransactionId(resultSet.getInt(TRANSACTION_ID_COLUMN));
                order.setUserId(resultSet.getInt(USER_ID_COLUMN));

                UserBean user = new UserBean();
                user.setUserName(resultSet.getString(USER_NAME));
                user.setAddress(resultSet.getString(ADDRESS));
                user.setEmailAddress(resultSet.getString(EMAIL_ADDRESS));
                
                order.setUser(user);
                orders.add(order);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return orders;
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
}

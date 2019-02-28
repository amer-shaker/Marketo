/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.PaymentBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static utils.Utility.getFormatedDate;

/**
 *
 * @author Mohamed Ramadan
 */
public class paymentDAO {

    public static final String CARD_TABLE = "CARDS";
    public static final String PAYMENT_TABLE = "PAYMENT";
    public static final String CARD_NUMBER = "CARD_NUMBER";
    public static final String CARD_AMOUNT = "BALANCE";
    public static final String PAYMENT_AMOUNT = "PAYMENT_AMOUNT";
    public static final String USER_ID = "USER_ID";
    public static final String PAYMENT_DATE = "PAYMENT_DATE";

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public paymentDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

    public int checkOutOrder(int card, int price, int userId) throws SQLException {

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + CARD_TABLE
                    + " WHERE " + CARD_NUMBER + " = ?");
            preparedStatement.setInt(1, card);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next() == false) {
                closeResources();
                return -1;
            } else {
                int availableAmount = resultSet.getInt(CARD_AMOUNT);
                if (availableAmount < price) {
                    closeResources();
                    return 0;
                } else {
                    int currentAmount = availableAmount - price;
                    preparedStatement = connection.prepareStatement("UPDATE " + CARD_TABLE + " SET " + CARD_AMOUNT
                            + " = " + currentAmount + " WHERE " + CARD_NUMBER + " = ?");
                    preparedStatement.setInt(1, card);
                    preparedStatement.executeQuery();

                    preparedStatement = connection.prepareStatement("INSERT INTO " + PAYMENT_TABLE + " (" + PAYMENT_AMOUNT
                            + " , PAYMENT_DATE ," + USER_ID + ") VALUES (?,SYSDATE,?)");
                    preparedStatement.setInt(1, price);
                    preparedStatement.setInt(2, userId);
                    preparedStatement.executeQuery();
                    closeResources();

                    return 1;

                }

            }

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
            return -1;
        } finally {
            closeResources();
        }

    }

    public ArrayList<PaymentBean> getUserPayments(int userId) throws SQLException {
        ArrayList<PaymentBean> payments = null;
        try {
            payments = new ArrayList<>();
            preparedStatement = connection.prepareStatement("SELECT * FROM " + PAYMENT_TABLE
                    + " WHERE " + USER_ID + " = ?");
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                PaymentBean payment = new PaymentBean();
                payment.setAmount(resultSet.getInt(PAYMENT_AMOUNT));
                payment.setDate(getFormatedDate(resultSet.getDate(PAYMENT_DATE)));
                payment.setUserId(resultSet.getInt(USER_ID));

                payments.add(payment);

            }
            return payments;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        } finally {
            closeResources();
        }

        return payments;

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

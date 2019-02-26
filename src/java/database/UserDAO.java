package database;

import beans.UserBean;
import java.sql.*;
import java.util.ArrayList;

/**
 * @author Amer Shaker
 */
public class UserDAO {

    private static final String USERS_TABLE = "USERS";

    // Users Table Columns
    private static final String USER_ID = "USER_ID";
    private static final String FIRST_NAME = "FIRST_NAME";
    private static final String LAST_NAME = "LAST_NAME";
    private static final String USER_NAME = "USER_NAME";
    private static final String PASSWORD = "PASSWORD";
    private static final String EMAIL_ADDRESS = "EMAIL_ADDRESS";
    private static final String ADDRESS = "ADDRESS";
    private static final String JOB_TITLE = "JOB_TITLE";
    private static final String BIRTH_DATE = "BIRTH_DATE";
    private static final String CARD_NUMBER = "CARD_NUMBER";
    private static final String IS_ADMIN = "IS_ADMIN";
    private static final String IMAGE = "IMAGE";

    private static final String CART_TABLE = "CART";

    // Connection and Statement for creating queries
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public UserDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

    public UserBean login(String userName, String password) throws SQLException {

        UserBean user = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + USERS_TABLE
                    + " WHERE (" + USER_NAME + " = ? OR " + EMAIL_ADDRESS + " = ?) AND " + PASSWORD + " = ?");

            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet != null) {
                if (resultSet.next()) {
                    user = new UserBean();
                    user.setUserId(resultSet.getInt(USER_ID));
                    user.setFirstName(resultSet.getString(FIRST_NAME));
                    user.setLastName(resultSet.getString(LAST_NAME));
                    user.setUserName(resultSet.getString(USER_NAME));
                    user.setPassword(resultSet.getString(PASSWORD));
                    user.setEmailAddress(resultSet.getString(EMAIL_ADDRESS));
                    user.setAddress(resultSet.getString(ADDRESS));
                    user.setJobTitle(resultSet.getString(JOB_TITLE));
                    user.setDateOfBirth(resultSet.getString(BIRTH_DATE));
                    user.setCardNumber(resultSet.getLong(CARD_NUMBER));
                    user.setImage(resultSet.getBlob(IMAGE) + "");

                    // Check if the user is Admin
                    int userRole = resultSet.getInt(IS_ADMIN);
                    if (userRole != 0) {
                        user.setAdmin(true);
                    } else {
                        user.setAdmin(false);
                    }
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return user;
    }

    public boolean addUser(String firstName, String lastName, String userName, String password,
            String emailAddress, String address, String phoneNumber) throws SQLException {

        boolean isSuccess = false;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO " + USERS_TABLE
                    + " (" + FIRST_NAME
                    + ", " + LAST_NAME
                    + ", " + USER_NAME
                    + ", " + PASSWORD
                    + ", " + EMAIL_ADDRESS
                    //+ ", " + ADDRESS
                    //+ ", " + PHONE_NUMBER
                    + ") VALUES (?, ?, ?, ?, ?)");

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, emailAddress);
            //preparedStatement.setString(6, address);

            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLIntegrityConstraintViolationException ex) {
            System.err.println("The (User Name / Email Address) is already exists");
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public boolean deleteUser(String userName, String emailAddress) throws SQLException {

        boolean isSuccess = false;

        try {
            preparedStatement = connection.prepareStatement("DELETE FROM " + USERS_TABLE
                    + " WHERE " + USER_NAME + " = ? OR " + EMAIL_ADDRESS + " = ?");

            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, emailAddress);
            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public ArrayList<UserBean> getUsers() throws SQLException {

        ArrayList<UserBean> users = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + USERS_TABLE);
            resultSet = preparedStatement.executeQuery();

            if (resultSet != null) {
                while (resultSet.next()) {
                    UserBean user = new UserBean();
                    user.setUserId(resultSet.getInt(USER_ID));
                    user.setFirstName(resultSet.getString(FIRST_NAME));
                    user.setLastName(resultSet.getString(LAST_NAME));
                    user.setUserName(resultSet.getString(USER_NAME));
                    user.setPassword(resultSet.getString(PASSWORD));
                    user.setEmailAddress(resultSet.getString(EMAIL_ADDRESS));
                    user.setAddress(resultSet.getString(ADDRESS));
                    user.setJobTitle(resultSet.getString(JOB_TITLE));
                    user.setDateOfBirth(resultSet.getString(BIRTH_DATE));
                    user.setCardNumber(resultSet.getLong(CARD_NUMBER));
                    user.setImage(resultSet.getBlob(IMAGE) + "");

                    // Check if the user is Admin
                    int userRole = resultSet.getInt(IS_ADMIN);
                    if (userRole != 0) {
                        user.setAdmin(true);
                    } else {
                        user.setAdmin(false);
                    }

                    users.add(user);
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return users;
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

    public void AddUserIDToCart(String emailAddress) {
        try {
            preparedStatement = connection.prepareStatement("SELECT " + USER_ID + " FROM " + USERS_TABLE
                    + " WHERE " + EMAIL_ADDRESS + " = ?");

            preparedStatement.setString(1, emailAddress);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int user_id = resultSet.getInt(USER_ID);
            System.out.println("User_ID " + user_id);
            preparedStatement = connection.prepareStatement("INSERT INTO "
                    + CART_TABLE + " (" + USER_ID + ") VALUES (?)");
            preparedStatement.setInt(1, user_id);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}

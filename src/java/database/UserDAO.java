package database;

import beans.UserBean;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Utility;

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
                    + ", " + ADDRESS
                    //+ ", " + PHONE_NUMBER
                    + ") VALUES (?, ?, ?, ?, ?,?)");

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, emailAddress);
            preparedStatement.setString(6, address);

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

    public int updateUserProfile(UserBean user, InputStream imageInputStream) throws SQLException {
        String updateUserQuery = "UPDATE "
                + USERS_TABLE + " SET "
                + USER_ID + "=? , "
                + FIRST_NAME + "=? , "
                + LAST_NAME + "=? , "
                + USER_NAME + "=? , "
                + ADDRESS + "=? , "
                + EMAIL_ADDRESS + "=? , "
                + JOB_TITLE + "=? , "
                + PASSWORD + "=? , "
                + IMAGE + "=? , "
                + BIRTH_DATE + "=? "
                + " WHERE "
                + USER_ID + "=? ";
        System.out.println(updateUserQuery);
        int updateResult = 0;
        try {
            preparedStatement = connection.prepareStatement(updateUserQuery);
            preparedStatement.setInt(1, user.getUserId());
            preparedStatement.setString(2, user.getFirstName());
            preparedStatement.setString(3, user.getLastName());
            preparedStatement.setString(4, user.getUserName());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getEmailAddress());
            preparedStatement.setString(7, user.getJobTitle());
            preparedStatement.setString(8, user.getPassword());
            System.out.println("inserted image " + imageInputStream);
            preparedStatement.setBlob(9, imageInputStream);
            preparedStatement.setString(10, user.getDateOfBirth());
            preparedStatement.setInt(11, user.getUserId());
            updateResult = preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources();
        }
        return updateResult;
    }

    public UserBean getUserById(int userId) throws SQLException {

        UserBean user = new UserBean();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + USERS_TABLE
                    + " WHERE " + USER_ID + " = ?");
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet != null) {
                while (resultSet.next()) {
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

    public List<UserBean> getUsersAccounts() throws SQLException {

        List<UserBean> users = new ArrayList<>();

        String selectUserQuery = "SELECT "
                + USER_ID + ", "
                + USER_NAME + ", "
                + EMAIL_ADDRESS + ", "
                + ADDRESS + " FROM "
                + USERS_TABLE
                + " ORDER BY "
                + USER_ID + " ASC";
        try {
            preparedStatement = connection.prepareStatement(selectUserQuery);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                UserBean user = new UserBean();
                user.setUserId(resultSet.getInt(USER_ID));
                user.setUserName(resultSet.getString(USER_NAME));
                user.setEmailAddress(resultSet.getString(EMAIL_ADDRESS));
                user.setPhoneNumber("123456789");
                user.setAddress(resultSet.getString(ADDRESS));
                users.add(user);
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

    public static InputStream convertStringToInputStream(String payload) {
        InputStream is = null;
        try {
            if (!isEmpty(payload)) {
                is = new ByteArrayInputStream(payload.getBytes("UTF-8"));
            }
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return is;
    }

    public static boolean isEmpty(String payload) {
        return payload == null || "".equals(payload.trim());
    }

    public UserBean getUserById(String userId) throws SQLException {
        UserBean user = new UserBean();
        String selectUserQuery = "SELECT * FROM "
                + USERS_TABLE
                + " WHERE "
                + USER_ID
                + " = ?";
        try {
            preparedStatement = connection.prepareStatement(selectUserQuery);
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user.setUserId(resultSet.getInt(USER_ID));
                user.setFirstName(resultSet.getString(FIRST_NAME));
                user.setLastName(resultSet.getString(LAST_NAME));
                user.setUserName(resultSet.getString(USER_NAME));
                user.setEmailAddress(resultSet.getString(EMAIL_ADDRESS));
                user.setAddress(resultSet.getString(ADDRESS));
                user.setCardNumber(resultSet.getLong(CARD_NUMBER));
                user.setPassword(resultSet.getString(PASSWORD));
                InputStream inputStream = resultSet.getBinaryStream(IMAGE);
                if (inputStream != null) {
                    String imageURL = Utility.readImage(inputStream);
                    System.out.println("retrieved db " + inputStream);
                    user.setImage(imageURL);
                }
                user.setDateOfBirth(resultSet.getString(BIRTH_DATE));
//                user.setPhone("123456789");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources();
        }
        return user;
    }
}
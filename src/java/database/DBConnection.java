package database;

import java.sql.*;

/**
 * @author Amer Shaker
 */
public class DBConnection {

    // Database Constants
    private static DBConnection instance;

    private static final String ORACLE_JDBC_DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
    private static final String DATABASE_NAME = "XE";
    private static final String DATABASE_USER_NAME = "ECOMMERCE";
    private static final String DATABASE_PASSWORD = "admin";

    private String hostName;
    private int portNumber;
    private String databaseName;
    private String userName;
    private String password;
    private boolean autoCommit;
    private Connection connection;

    private DBConnection() {
        this("localhost", 1521, DATABASE_NAME, DATABASE_USER_NAME, DATABASE_PASSWORD, true);
    }

    private DBConnection(String databaseName, String userName, String password) {
        this("localhost", 1521, databaseName, userName, password, true);
    }

    private DBConnection(String hostName, int portNumber, String databaseName, String userName, String password, boolean autoCommit) {
        this.hostName = hostName;
        this.portNumber = portNumber;
        this.databaseName = databaseName;
        this.userName = userName;
        this.password = password;
        this.autoCommit = autoCommit;

        // Load the JDBC Driver
        loadDriver();
    }

    private void loadDriver() {
        try {
            Class.forName(ORACLE_JDBC_DRIVER_CLASS);
            System.out.println("Driver loaded");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
    }

    private boolean openConnection() {
        try {
            // Establish a connection
            connection = DriverManager.getConnection("jdbc:oracle:thin:@" + hostName + ":" + portNumber + ":" + databaseName, userName, password);
            connection.setAutoCommit(autoCommit);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return true;
    }

    public Connection getConnection() {
        if (connection == null) {
            if (openConnection()) {
                System.out.println("Database connected");
                return connection;
            } else {
                return null;
            }
        }
        return connection;
    }

    // Close the connection
    public void closeConnection() throws SQLException {
        System.out.println("Closing connection");
        try {
            if (connection != null) {
                connection.close();
                connection = null;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    public static DBConnection getInstance() {
        if (instance == null) {
            synchronized (DBConnection.class) {
                if (instance == null) {
                    instance = new DBConnection();
                }
            }
        }
        return instance;
    }

    public static DBConnection getInstance(String databaseName, String userName, String password) {
        if (instance == null) {
            synchronized (DBConnection.class) {
                if (instance == null) {
                    instance = new DBConnection(databaseName, userName, password);
                }
            }
        }
        return instance;
    }

    public static DBConnection getInstance(String hostName, int portNumber, String databaseName,
            String userName, String password, boolean autoCommit) {
        if (instance == null) {
            synchronized (DBConnection.class) {
                if (instance == null) {
                    instance = new DBConnection(databaseName, userName, password);
                }
            }
        }
        return instance;
    }
}
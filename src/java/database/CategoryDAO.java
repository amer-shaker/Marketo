package database;

import beans.CategoryBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Amer Shaker
 */
public class CategoryDAO {

    private static final String CATEGORIES_TABLE = "CATEGORIES";
    private static final String CATEGORY_ID_COLUMN = "CATEGORY_ID";
    private static final String CATEGORY_NAME_COLUMN = "CATEGORY_NAME";

    // Connection and Statement for creating queries
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public CategoryDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

    public ArrayList<CategoryBean> getProductCategories() throws SQLException {

        ArrayList<CategoryBean> categories = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + CATEGORIES_TABLE);
            resultSet = preparedStatement.executeQuery();

            categories = new ArrayList<>();

            if (resultSet != null) {
                while (resultSet.next()) {
                    CategoryBean category = new CategoryBean();
                    category.setCategoryId(resultSet.getInt(CATEGORY_ID_COLUMN));
                    category.setCategoryName(resultSet.getString(CATEGORY_NAME_COLUMN));
                    categories.add(category);
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return categories;
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

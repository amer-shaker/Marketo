package database;

import beans.ProductBean;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.Utility;

/**
 *
 * @author Amer Shaker
 */
public class ProductDAO {

    private static final String PRODUCTS_TABLE = "PRODUCT";

    // Products Table Columns
    private static final String PRODUCT_ID = "PRODUCT_ID";
    private static final String PRODUCT_NAME = "PRODUCT_NAME";
    private static final String DESCRIPTION = "DESCRIPTION";
    private static final String PRICE = "PRICE";
    private static final String QUANTITY = "QUANTITY";
    private static final String PRODUCT_IMAGE = "IMAGE";
    private static final String CATEGORY_ID = "CATEGORY_ID";

    // Connection and Statement for creating queries
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public ProductDAO() {
        DBConnection databaseConnection = DBConnection.getInstance();
        if (databaseConnection != null) {
            connection = databaseConnection.getConnection();
        }
    }

    public boolean addProductByCategoryId(String productName, String describtion, double price,
            int quantity, InputStream productImage, int cateegoryId) throws SQLException {

        boolean isSuccess = false;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO " + PRODUCTS_TABLE
                    + " (" + PRODUCT_NAME
                    + ", " + DESCRIPTION
                    + ", " + PRICE
                    + ", " + QUANTITY
                    + ", " + PRODUCT_IMAGE
                    + ", " + CATEGORY_ID + ") VALUES (?, ?, ?, ?, ?, ?)");

            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, describtion);
            preparedStatement.setDouble(3, price);
            preparedStatement.setInt(4, quantity);
            preparedStatement.setBlob(5, productImage);
            preparedStatement.setInt(6, cateegoryId);

            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public ProductBean getProductById(int productId) throws SQLException {

        ProductBean product = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + PRODUCTS_TABLE
                    + " WHERE " + PRODUCT_ID + " = ?");
            preparedStatement.setInt(1, productId);
            resultSet = preparedStatement.executeQuery();

            product = new ProductBean();

            while (resultSet.next()) {
                product.setProductId(resultSet.getInt(PRODUCT_ID));
                product.setProductName(resultSet.getString(PRODUCT_NAME));
                product.setDescribtion(resultSet.getString(DESCRIPTION));
                product.setPrice(resultSet.getDouble(PRICE));
                product.setQuantity(resultSet.getInt(QUANTITY));

                InputStream inputStream = resultSet.getBinaryStream(PRODUCT_IMAGE);
                String imageURL = Utility.readImage(inputStream);

                product.setProductImage(imageURL);
                product.setCateegoryId(resultSet.getInt(CATEGORY_ID));
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return product;
    }

    public ArrayList<ProductBean> getProducts() throws SQLException {

        ArrayList<ProductBean> products = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + PRODUCTS_TABLE
                    + " ORDER BY " + PRODUCT_ID + " ASC");
            resultSet = preparedStatement.executeQuery();

            products = new ArrayList<>();

            while (resultSet.next()) {
                ProductBean product = new ProductBean();
                product.setProductId(resultSet.getInt(PRODUCT_ID));
                product.setProductName(resultSet.getString(PRODUCT_NAME));
                product.setDescribtion(resultSet.getString(DESCRIPTION));
                product.setPrice(resultSet.getDouble(PRICE));
                product.setQuantity(resultSet.getInt(QUANTITY));
                String imageURL = null;
                InputStream inputStream = resultSet.getBinaryStream(PRODUCT_IMAGE);
                if (inputStream != null) {
                    imageURL = Utility.readImage(inputStream);
                }
                product.setProductImage(imageURL);

                product.setCateegoryId(resultSet.getInt(CATEGORY_ID));
                products.add(product);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return products;
    }

    public ArrayList<ProductBean> getProductsByCategoryId(int categoryId) throws SQLException {

        ArrayList<ProductBean> products = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM " + PRODUCTS_TABLE
                    + " WHERE " + CATEGORY_ID + " = ? ORDER BY " + PRODUCT_ID + " ASC");
            preparedStatement.setInt(1, categoryId);
            resultSet = preparedStatement.executeQuery();

            products = new ArrayList<>();

            while (resultSet.next()) {
                ProductBean product = new ProductBean();
                product.setProductId(resultSet.getInt(PRODUCT_ID));
                product.setProductName(resultSet.getString(PRODUCT_NAME));
                product.setDescribtion(resultSet.getString(DESCRIPTION));
                product.setPrice(resultSet.getDouble(PRICE));
                product.setQuantity(resultSet.getInt(QUANTITY));

                InputStream inputStream = resultSet.getBinaryStream(PRODUCT_IMAGE);
                String imageURL = Utility.readImage(inputStream);
                product.setProductImage(imageURL);

                product.setCateegoryId(resultSet.getInt(CATEGORY_ID));
                products.add(product);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return products;
    }

    public boolean updateProduct(ProductBean product) throws SQLException {
        boolean isSuccess = false;

        try {
            preparedStatement = connection.prepareStatement("UPDATE " + PRODUCTS_TABLE + " SET "
                    + PRODUCT_NAME + " = ?, "
                    + DESCRIPTION + " = ?, "
                    + PRICE + " = ?, "
                    + QUANTITY + " = ?, "
                    + CATEGORY_ID + " = ? WHERE "
                    + PRODUCT_ID + " = ?");

            if (product != null) {
                preparedStatement.setString(1, product.getProductName());
                preparedStatement.setString(2, product.getDescribtion());
                preparedStatement.setInt(3, (int) product.getPrice());
                preparedStatement.setInt(4, product.getQuantity());
                preparedStatement.setInt(5, product.getCateegoryId());
                preparedStatement.setInt(6, product.getProductId());

                isSuccess = preparedStatement.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public boolean deleteProductByCategoryId(int productId) throws SQLException {
        boolean isSuccess = false;

        try {
            preparedStatement = connection.prepareStatement("DELETE FROM " + PRODUCTS_TABLE
                    + " WHERE " + PRODUCT_ID + " = ?");
            preparedStatement.setInt(1, productId);

            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            closeResources();
        }

        return isSuccess;
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
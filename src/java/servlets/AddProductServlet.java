package servlets;

import beans.CategoryBean;
import beans.ProductBean;
import database.CategoryDAO;
import database.ProductDAO;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import utils.Constants;

/**
 *
 * @author Amer Shaker
 */
@MultipartConfig
@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})
public class AddProductServlet extends HttpServlet {

    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
    private ArrayList<CategoryBean> categories;
    private String productName;
    private String describtion;
    private double price;
    private int quantity;
    private int cateegoryId;
    private String productId;

    public AddProductServlet() {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req != null) {
            try {
                categories = categoryDAO.getProductCategories();
                req.setAttribute(Constants.CATEGORIES_LIST_ATTRIBUTE, categories);

                productId = req.getParameter(Constants.PRODUCT_ID_PARAMETER);
                if (productId != null) {
                    ProductBean product = productDAO.getProductById(Integer.parseInt(productId));
                    req.setAttribute(Constants.PRODUCT_ATTRIBUTE, product);
                }
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req != null) {
            productName = req.getParameter(Constants.PRODUCT_NAME_PARAMTER);
            describtion = req.getParameter(Constants.DESCRIPTION_PARAMTER);
            price = Double.parseDouble(req.getParameter(Constants.PRICE_PARAMTER));
            quantity = Integer.parseInt(req.getParameter(Constants.QUANTITY_PARAMTER));
            cateegoryId = Integer.parseInt(req.getParameter(Constants.CATEGORY_ID_PARAMETER));

            if (req.getParameter(Constants.ACTION_TYPE_PARAMETER) != null) {
                String actionType = req.getParameter(Constants.ACTION_TYPE_PARAMETER);
                try {
                    if (actionType.equals(Constants.ACTION_TYPE_EDIT_PARAMETER)) {
                        ProductBean product = new ProductBean();
                        product.setProductId(Integer.parseInt(productId));
                        product.setProductName(productName);
                        product.setDescribtion(describtion);
                        product.setPrice(price);
                        product.setQuantity(quantity);
                        product.setCateegoryId(cateegoryId);

                        boolean isSuccess = productDAO.updateProduct(product);
                        if (isSuccess) {
                            resp.sendRedirect(Constants.PRODUCT_LIST_URL_PATTERN);
                        }

                    } else if (actionType.equals(Constants.ACTION_TYPE_ADD_PARAMETER)) {
                        Part part = req.getPart("productImage");
                        InputStream io = part.getInputStream();
                        boolean isSuccess = productDAO.addProductByCategoryId(productName, describtion, price,
                                quantity, io, cateegoryId);
                        if (isSuccess) {

                            resp.sendRedirect(Constants.PRODUCT_LIST_URL_PATTERN);
                        }
                    }
                } catch (SQLException ex) {
                    System.err.println(ex.getMessage());
                }
            }
        }
    }
}

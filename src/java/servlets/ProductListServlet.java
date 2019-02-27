package servlets;

import beans.ProductBean;
import database.ProductDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Constants;

/**
 *
 * @author Amer Shaker
 */
@WebServlet(name = "ProductListServlet", urlPatterns = {"/ProductListServlet"})
public class ProductListServlet extends HttpServlet {

    private static final String IS_FIRST_REQUEST = "isFirstRequest";
    private ProductDAO productDAO;
    private ArrayList<ProductBean> products;
    private int productId;

    public ProductListServlet() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            products = productDAO.getProducts();
            req.setAttribute(Constants.PRODUCTS_LIST_ATTRIBUTE, products);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        if (req != null) {
            String actionType = req.getParameter(Constants.ACTION_TYPE_PARAMETER);

            if (actionType != null) {
                if (req.getParameter(Constants.PRODUCT_ID_PARAMETER) != null) {
                    productId = Integer.parseInt(req.getParameter(Constants.PRODUCT_ID_PARAMETER));

                    if (actionType.equals(Constants.ACTION_TYPE_EDIT_PARAMETER)) {
                        resp.sendRedirect(Constants.ADD_PRODUCT_URL_PATTERN + "?"
                                + Constants.PRODUCT_ID_PARAMETER + "=" + productId);
                    } else if (actionType.equals(Constants.ACTION_TYPE_DELETE_PARAMETER)) {
                        deleteProduct(req, resp);
                    }
                }
            }
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher reqDispatcher = req.getRequestDispatcher(Constants.PRODUCT_LIST_URL_PATTERN);
        try {
            boolean isSuccess = productDAO.deleteProductByCategoryId(productId);
            if (isSuccess) {
                products = productDAO.getProducts();
                req.setAttribute(IS_FIRST_REQUEST, true);
                req.setAttribute(Constants.PRODUCTS_LIST_ATTRIBUTE, productDAO.getProducts());
                reqDispatcher.forward(req, resp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}

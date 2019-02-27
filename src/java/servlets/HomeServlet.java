package servlets;

import beans.CategoryBean;
import beans.ProductBean;
import database.CategoryDAO;
import database.ProductDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Constants;

/**
 *
 * @author Mohamed Ramadan
 */
public class HomeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher mRequestDispatcher = request.getRequestDispatcher("ec-product.jsp");
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        try {
            ServletContext context = getServletConfig().getServletContext();
            ArrayList<ProductBean> products;
            ArrayList<CategoryBean> categories = categoryDAO.getProductCategories();
            products = productDAO.getProducts();
            products.get(0).getProductName();
            context.setAttribute(Constants.CATEGORIES_LIST_ATTRIBUTE, categories);
            context.setAttribute("products", products);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        mRequestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
RequestDispatcher mRequestDispatcher = request.getRequestDispatcher("ec-product.jsp");
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        try {
            ServletContext context = getServletConfig().getServletContext();
            ArrayList<ProductBean> products;
            ArrayList<CategoryBean> categories = categoryDAO.getProductCategories();
            products = productDAO.getProducts();
            products.get(0).getProductName();
            context.setAttribute(Constants.CATEGORIES_LIST_ATTRIBUTE, categories);
            context.setAttribute("products", products);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        mRequestDispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

package servlets;

import beans.OrderBean;
import beans.ProductBean;
import beans.UserBean;
import database.OrderDAO;
import database.ProductDAO;
import database.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "DashboardServlet", urlPatterns = {"/DashboardServlet"})
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            OrderDAO orderDAO = new OrderDAO();
            UserDAO userDAO = new UserDAO();
            ProductDAO productDAO = new ProductDAO();

            // List of recent orders
            List<OrderBean> orders = orderDAO.getOrders();

            // List of users
            List<UserBean> users = userDAO.getUsers();

            // List of products
            List<ProductBean> products = productDAO.getProducts();

            request.setAttribute(Constants.TOTAL_NUMBER_OF_ORDERS, orders.size());
            request.setAttribute(Constants.TOTAL_NUMBER_OF_USERS, users.size());
            request.setAttribute(Constants.TOTAL_NUMBER_OF_PRODUCTS, products.size());
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}

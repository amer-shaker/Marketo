package servlets;

import beans.OrderBean;
import database.OrderDAO;
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
@WebServlet(name = "RecentOrdersServlet", urlPatterns = {"/RecentOrdersServlet"})
public class RecentOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // OrderDAO object
            OrderDAO orderDAO = new OrderDAO();

            // List of recent orders
            List<OrderBean> orders = orderDAO.getOrders();
            request.setAttribute(Constants.ORDERS_LIST_ATTRIBUTE, orders);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}

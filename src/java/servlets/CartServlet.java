package servlets;

import beans.ItemsBean;
import beans.UserBean;
import database.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class CartServlet extends HttpServlet {

    CartDAO cartDAO;
    int product_id;
    double product_price;
    ArrayList<ItemsBean> items;
    ArrayList<ItemsBean> items1;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        int product_id = Integer.valueOf(req.getParameter("productId"));

        HttpSession session = req.getSession(false);

        cartDAO = new CartDAO();

        try {
            cartDAO.deleteItem(product_id);

        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher mRequestDispatcher = req.getRequestDispatcher("CartPage.jsp");

        int index = 0;
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getproductId() == product_id) {
                index = i;
            }
        }
        if (items != null) {
            items.remove(index);
        }
        System.out.println(items);
        session.setAttribute("lineproducts", items);

        req.setAttribute("items", items);
        mRequestDispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            HttpSession session = req.getSession(false);

            //   System.out.println("jjjjjjjj"+j.getUserId());
            boolean flag = false;
            int product_id = Integer.valueOf(req.getParameter("product_id"));

            cartDAO = new CartDAO();
            UserBean userBean = (UserBean) req.getSession(false).getAttribute("userObj");
            if (userBean == null) {
                RequestDispatcher mRequestDispatcher = req.getRequestDispatcher("sign-in.jsp");
                mRequestDispatcher.forward(req, resp);
            } else {
                System.out.println("userBean" + userBean.getUserId());
                cartDAO.addProductToCart(1, product_id, userBean.getUserId());
                RequestDispatcher mRequestDispatcher = req.getRequestDispatcher("CartPage.jsp");
                items = cartDAO.getProductItems();
                req.setAttribute("items", items);
                session.setAttribute("lineproducts", items);
                mRequestDispatcher.forward(req, resp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

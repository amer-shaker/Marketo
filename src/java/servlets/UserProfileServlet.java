package servlets;

import beans.UserBean;
import database.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aya
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/UserProfileServlet"})
public class UserProfileServlet extends HttpServlet {

    private String userId;
    private final String USER_ATTRIBUTE = "user";
    private final String UPDATE_FORWARD = "updated";
    private UserDAO userDao = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        System.out.println("param =" + request.getParameter("userId"));
        //userId = (String) request.getParameter("userId");
        UserBean usera = (UserBean) request.getSession(false).getAttribute("userObj");
        System.out.println("hgsdfghsdfghsdfhg" + usera);
        userId = String.valueOf(usera.getUserId());
        usera.getUserId();

        //get user from database
        UserBean user = new UserBean();
        user = getUserById(userId);
        if (user != null) {
            request.setAttribute(USER_ATTRIBUTE, user);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/sign-up.jsp");

            System.out.println("null");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private UserBean getUserById(String userId) {
        userDao = new UserDAO();
        try {
            return userDao.getUserById(userId);
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}

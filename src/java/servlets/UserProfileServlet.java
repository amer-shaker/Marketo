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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean userObj = (UserBean) request.getSession(false).getAttribute("userObj");
        UserBean adminObj = (UserBean) request.getSession(false).getAttribute("adminObj");
//        userId = String.valueOf(userObj.getUserId());
        if (userObj != null) {
            userId = String.valueOf(userObj.getUserId());
            System.out.println("User id " + userId);
        }else{
            userId = String.valueOf(adminObj.getUserId());
            System.out.println("admin id " + userId);
        }
//        userObj.getUserId();

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

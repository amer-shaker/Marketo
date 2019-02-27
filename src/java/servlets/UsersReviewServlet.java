package servlets;

import beans.UserBean;
import database.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet("/UsersReviewServlet")
public class UsersReviewServlet extends HttpServlet {

    final String USERS_ATTRIBUTE = "users";
    final String IS_FIRST_REQUEST_ATTRIBUTE = "isFirstRequest";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UserBean> users = getUsers();
        if (users != null) {
            request.setAttribute(USERS_ATTRIBUTE, users);
            request.setAttribute(IS_FIRST_REQUEST_ATTRIBUTE, true);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("buttonPressed");
        String userId = request.getParameter("userId");
        if (action != null) {
            if (action.equalsIgnoreCase("edit")) {
                request.setAttribute("userId", userId);
                response.sendRedirect("EditUserProfile?userId=" + userId);
            } else if (action.equalsIgnoreCase("delete")) {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Users.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    private List<UserBean> getUsers() {
        UserDAO userDao = new UserDAO();
        try {
            return userDao.getUsersAccounts();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }
}

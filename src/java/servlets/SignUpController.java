package servlets;

import database.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author elmahask
 */
public class SignUpController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String userName = request.getParameter("userName").trim();
        String password = request.getParameter("password").trim();
        String emailAddress = request.getParameter("emailAddress").trim();
        String Address = request.getParameter("Address").trim();
        try {
            UserDAO userDAO = new UserDAO();
            boolean added = userDAO.addUser(firstName, lastName, userName, password, emailAddress, Address, null);
            if (added == true) {
                userDAO.AddUserIDToCart(emailAddress);
                System.err.println("Register Done");
                request.getRequestDispatcher(request.getContextPath() + "/sign-in.jsp").forward(request, response);
            } else {
                System.err.println("failed");
                request.getRequestDispatcher(request.getContextPath() + "/sign-up.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SignUpController.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }

    }
}

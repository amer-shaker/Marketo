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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
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
                response.sendRedirect(request.getContextPath() + "/sign-in.jsp");
            } else {
                System.err.println("failed");
                response.sendRedirect(request.getContextPath() + "/404.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SignUpController.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

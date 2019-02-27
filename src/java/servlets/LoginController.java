package servlets;

import beans.UserBean;
import database.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author elmahask
 */
public class LoginController extends HttpServlet {

    // <a class="dropdown-item" href="LoginController">Login</a>
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = null;
        String password = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ((cookie.getName().equals("userNameObj") || cookie.getName().equals("userEmailObj"))) {
                    userName = cookie.getValue();
                }
                if (cookie.getName().equals("userPassObj")) {
                    password = cookie.getValue();
                }
            }
            if (userName == null && password == null) {
//                response.sendRedirect("sign-in.jsp");
                UserBean user = (UserBean) request.getSession().getAttribute("userObj");
                System.out.println("uuuu" + user.getFirstName());
                System.out.println("doGet User Is Pass USE : Null");
//                request.getRequestDispatcher(request.getContextPath() + "/sign-in").forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/sign-in");
            } else {
//                response.sendRedirect(request.getContextPath() + "/home");
//                UserBean user = (UserBean) request.getSession();
//                System.out.println("uuuu" + user.getFirstName());
            }
        } else {
            System.out.println("User doGet Cookie is Null");
//            request.getRequestDispatcher(request.getContextPath() + "/sign-in").forward(request, response);
//            response.sendRedirect("sign-in.jsp");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String userName = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();
            String checkBox = request.getParameter("checkBox");
            System.out.println("checkBox " + checkBox);
            UserBean user = null;
            UserDAO userDAO = new UserDAO();
            user = userDAO.login(userName, password);
            if (user == null) {
//                request.getRequestDispatcher(request.getContextPath() + "/sign-in.jsp").forward(request, response);
                System.out.println("User Is Null");
                response.sendRedirect(request.getContextPath() + "/404.jsp");
            } else if ((user != null) && (user.isAdmin() == true)) {
                System.out.println("User Admin  " + user.getFirstName());
                createSession(request, "adminObj", user, true);
                if (checkBox != null) {
                    createCookie(response, "userNameObj", user.getUserName());
                    createCookie(response, "userEmailObj", user.getEmailAddress());
                    createCookie(response, "userPassObj", user.getPassword());
//                    response.sendRedirect("/LoginController");
                    System.out.println("User Is admin and Check is Null");

//                    response.sendRedirect(request.getContextPath() + "/AddProductServlet");

                } else {
                    System.out.println("User Is admin and Check is Full");
//                    response.sendRedirect(request.getContextPath() + "/AddProductServlet");
//                    request.getRequestDispatcher(request.getContextPath() + "/AddProductServlet").forward(request, response);
                }

            } else if ((user != null) && (user.isAdmin() == false)) {
                createSession(request, "userObj", user, true);
//                request.getRequestDispatcher(request.getContextPath() + "/home").forward(request, response);
                if (checkBox != null) {
                    createCookie(response, "userNameObj", user.getUserName());
                    createCookie(response, "userEmailObj", user.getEmailAddress());
                    createCookie(response, "userPassObj", user.getPassword());
                    System.out.println("User Check is Null");
//                    response.sendRedirect(request.getContextPath() + "/sign-up.jsp");
                } else {
                    System.out.println("User Check is Full");
                    response.sendRedirect(request.getContextPath()+"/home");
//                    response.sendRedirect(request.getContextPath() + "/home");
//                    request.getRequestDispatcher(request.getContextPath() + "/home").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            ex.getMessage();
        }
    }

    public void createCookie(HttpServletResponse response, String cookieName, String value) {
        Cookie cookie = new Cookie(cookieName, value);
        cookie.setMaxAge(60 * 900);
        response.addCookie(cookie);
    }

    public void createSession(HttpServletRequest request, String sessionName, UserBean user, boolean flag) {
        HttpSession session = request.getSession(flag);
        session.setAttribute(sessionName, user);
//        session.setMaxInactiveInterval(30*30);
    }
}

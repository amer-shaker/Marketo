package servlets;

import beans.UserBean;
import database.UserDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Aya
 */
@MultipartConfig
@WebServlet(name = "EditUserProfile", urlPatterns = "/EditUserProfile")
public class EditUserProfile extends HttpServlet {

    private String userId;
    private final String USER_ATTRIBUTE = "user";
    private final String UPDATE_FORWARD = "updated";
    private UserDAO userDao = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("param =" + request.getParameter("userId"));
        //userId = (String) request.getParameter("userId");
        userId = "26";
        String isUpdated = (String) request.getAttribute(UPDATE_FORWARD);

        if (isUpdated != null) {
            //display updated data
            UserBean updatedUser = (UserBean) request.getAttribute(USER_ATTRIBUTE);
            request.setAttribute(USER_ATTRIBUTE, updatedUser);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edit-user-profile.jsp");
            dispatcher.forward(request, response);
        } else {
            //get user from database
            UserBean user = new UserBean();
            user = getUserById(userId);
            if (user != null) {
                request.setAttribute(USER_ATTRIBUTE, user);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edit-user-profile.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("null");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean updatedUser = new UserBean();
        updatedUser.setUserId(Integer.parseInt(userId));
        updatedUser.setFirstName(request.getParameter("firstName"));
        updatedUser.setLastName(request.getParameter("lastName"));
        updatedUser.setUserName(request.getParameter("userName"));
        updatedUser.setEmailAddress(request.getParameter("email"));
        updatedUser.setAddress(request.getParameter("address"));
        updatedUser.setDateOfBirth(request.getParameter("date"));
        updatedUser.setPassword(request.getParameter("password"));
        updatedUser.setJobTitle(request.getParameter("jobTitle"));
        Part part = request.getPart("userPhoto");
        InputStream imageIn = part.getInputStream();
        System.out.println("updated image " + imageIn);
        //updatedUser.setImage(convertInputStreamToString(imageIn));
        if (updateUserProfile(updatedUser, imageIn) > 0) {
            UserBean user = getUserById(String.valueOf(updatedUser.getUserId()));
            request.setAttribute(USER_ATTRIBUTE, user);
            request.setAttribute(UPDATE_FORWARD, UPDATE_FORWARD);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edit-user-profile.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("failed");
        }
    }

    public static String convertInputStreamToString(InputStream inputStream) {
        Writer writer = new StringWriter();
        char[] buffer = new char[1024];
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            int n;
            while ((n = reader.read(buffer)) != -1) {
                writer.write(buffer, 0, n);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return writer.toString();
    }

    private int updateUserProfile(UserBean user, InputStream imageIn) {
        userDao = new UserDAO();
        try {
            return userDao.updateUserProfile(user, imageIn);
        } catch (SQLException ex) {
            Logger.getLogger(EditUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    private UserBean getUserById(String userId) {
        userDao = new UserDAO();
        try {
            return userDao.getUserById(userId);
        } catch (SQLException ex) {
            Logger.getLogger(EditUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}

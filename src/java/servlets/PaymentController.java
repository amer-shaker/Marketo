/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.PaymentBean;
import beans.UserBean;
import database.*;
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
 * @author Mohamed Ramadan
 */
public class PaymentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cardNumber = Integer.parseInt(request.getParameter("cardNumber"));
        int totalPrice = Integer.parseInt(request.getParameter("total"));
        HttpSession session = request.getSession(false);
        RequestDispatcher dispatcher;
        UserBean user = (UserBean) session.getAttribute("userObj");
        int userId = user.getUserId();
        paymentDAO PaymentOperation = new paymentDAO();
        try {
            int statues = PaymentOperation.checkOutOrder(cardNumber, totalPrice, userId);
            switch (statues) {
                case 0:
                    //dont have enough mony
                    dispatcher = request.getRequestDispatcher("checkoutPage.jsp");
                    request.setAttribute("statues", statues);
                    dispatcher.forward(request, response);
                    break;
                case -1:
                    //card not found
                    dispatcher = request.getRequestDispatcher("checkoutPage.jsp");
                    request.setAttribute("statues", statues);
                    dispatcher.forward(request, response);
                    break;
                default:
                    //successfully
                    ArrayList<PaymentBean> payments = PaymentOperation.getUserPayments(userId);
                    System.out.println("Payment : " + payments.get(0).getDate());
                    dispatcher = request.getRequestDispatcher("/DownloadBill");
                    request.setAttribute("paymentlist", payments);
                    dispatcher.forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("card number = " + cardNumber + "  total price" + totalPrice);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

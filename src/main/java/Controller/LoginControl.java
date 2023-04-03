/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LoginDAO;
import Entity.Account;
import Utils.JWebToken;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author son
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Account a = (Account) session.getAttribute("account");
//        if (a != null) {
//            response.sendRedirect("Home");
//        } else {
// 
           
           request.getRequestDispatcher("user/components/login.jsp").forward(request, response);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String passw = request.getParameter("password");
        Account a = new LoginDAO().checkLogin(username, passw);
        if (a != null) {
            session.setAttribute("account", a);
            try {
                JWebToken jwt=new JWebToken(a.getId(),a.getUsername(),a.getEmail(),24*60*60);
                Cookie token=new Cookie("token",jwt.getSignature());
                token.setMaxAge(24*60*60);
                response.addCookie(token);
                response.sendRedirect("Home");
                System.out.println(jwt.getSignature());
            } catch (InvalidKeyException ex) {
                Logger.getLogger(LoginControl.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            System.out.println("head :"+request.getHeader("authorization"));
            
        }
        else
            request.setAttribute("", a);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

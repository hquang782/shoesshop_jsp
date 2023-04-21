package com.dev4fun.controller.admin;

import com.dev4fun.dao.AccountDAO;
import com.dev4fun.model.Account;
import com.dev4fun.utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(urlPatterns = {"/admin/login"})
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) SessionUtil.getInstance().getValue(req, "ACCOUNT_ADMIN");
        if (acc != null) {
            resp.sendRedirect("/admin");
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("/views/authn/admin-login.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (username.equals("") || password.equals("")) {
            resp.sendRedirect("/admin/login");
        } else {
            Account account;
            try {
                account = new AccountDAO().getAccountByUsernamePassword(username, password);
                if (account != null) {
                    if (account.getRole().equals("ADMIN")) {
                        SessionUtil.getInstance().putValue(req, "ACCOUNT_ADMIN", account);
                        resp.sendRedirect("/admin");
                    } else {
                        resp.sendRedirect("/admin/login");
                    }
                } else {
                    resp.sendRedirect("/admin/login");
                }
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
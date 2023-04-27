package com.dev4fun.controller.admin;


import com.dev4fun.dao.AccountDAO;
import com.dev4fun.model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/account"})
public class AccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        ArrayList<Account> listAccounts = accountDAO.getAllAccount();
        req.setAttribute("listAccounts", listAccounts);

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-account.jsp");
        rd.forward(req, resp);
    }
}

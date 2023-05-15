package com.dev4fun.controller.user;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dev4fun.dao.AccountDAO;
import com.dev4fun.dao.DAO;
import com.dev4fun.dao.RoleDAO;
import com.dev4fun.model.Account;
import com.dev4fun.model.Role;
import com.dev4fun.utils.BCrypt;
import com.dev4fun.utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) SessionUtil.getInstance().getValue(req, "ACCOUNT_USER");
        if (acc != null) {
            resp.sendRedirect("/user/profile");
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("/views/authn/user-register.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = new Account();
        BCrypt bCrypt=new BCrypt();
        account.setUsername(req.getParameter("username"));
        account.setFullName(req.getParameter("fullName"));
        account.setPhoneNumber(req.getParameter("tel"));
        account.setRole("USER");
        account.setEmail(req.getParameter("email"));
        account.setDob(req.getParameter("dob"));
        account.setGender(req.getParameter("gender"));
        account.setPassword(BCrypt.hashpw(req.getParameter("password"), BCrypt.gensalt()));
        account.setImageLink("https://cdn5.vectorstock.com/i/1000x1000/27/89/user-account-flat-icon-vector-14992789.jpg");

        AccountDAO accountDAO = new AccountDAO();
        boolean result = accountDAO.createAccount(account);

        resp.sendRedirect("/login");
    }
}

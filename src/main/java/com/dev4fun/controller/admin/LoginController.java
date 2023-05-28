package com.dev4fun.controller.admin;

import com.dev4fun.dao.AccountDAO;
import com.dev4fun.model.Account;
import com.dev4fun.utils.BCrypt;
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
            String errorLog = (String) SessionUtil.getInstance().getValue(req,"errorMessage");
            if(errorLog!=null){
                System.out.println(errorLog);
                req.setAttribute("errorLog",errorLog);
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/authn/admin-login.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        BCrypt bCrypt = new BCrypt();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (username.equals("") || password.equals("")) {
            resp.sendRedirect("/admin/login");
        } else {
            Account account;
            try {
                account = new AccountDAO().getAccountByUsername(username);
                if (account != null) {
                    if (BCrypt.checkpw(password, account.getPassword())) {
                        if (account.getRole().equals("ADMIN")) {
                            SessionUtil.getInstance().putValue(req, "ACCOUNT_ADMIN", account);
                            resp.sendRedirect("/admin");
                        } else {
                            SessionUtil.getInstance().putValue(req,"errorMessage","Tài khoản không có quyền truy cập. Vui lòng thử lại.");
                            resp.sendRedirect("/admin/login");
                        }
                    } else{
                        SessionUtil.getInstance().putValue(req,"errorMessage","Tài khoản hoặc mật khẩu không chính xác. Vui lòng thử lại.");
                        resp.sendRedirect("/admin/login");
                    }
                } else {
                    SessionUtil.getInstance().putValue(req,"errorMessage","Tài khoản không tồn tại. Vui lòng thử lại.");
                    resp.sendRedirect("/admin/login");
                }
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

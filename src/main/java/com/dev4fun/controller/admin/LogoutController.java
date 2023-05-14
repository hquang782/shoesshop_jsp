package com.dev4fun.controller.admin;

import com.dev4fun.utils.SessionUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/logout"})
public class LogoutController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        SessionUtil.getInstance().removeValue(req, "ACCOUNT_ADMIN");
        resp.sendRedirect("/admin/login");
    }
}

package com.dev4fun.controller.admin;

import com.dev4fun.dao.RoleDAO;
import com.dev4fun.model.Bill;
import com.dev4fun.model.Product;
import com.dev4fun.model.Role;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/order/add"})
public class AddOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-add-order.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Bill bill = new Bill();
        Product product = new Product();
        bill.setFullName(req.getParameter("name"));
        bill.setPhoneNumber(req.getParameter("tel"));
//        bill

    }
}

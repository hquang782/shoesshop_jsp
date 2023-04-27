package com.dev4fun.controller.admin;

import com.dev4fun.dao.AccountDAO;
import com.dev4fun.dao.BillDAO;
import com.dev4fun.dao.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/sale-stat"})
public class SaleStatisticalController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        ProductDAO productDAO = new ProductDAO();
        BillDAO billDAO = new BillDAO();
        int totalStaffAccounts = accountDAO.getTotalStaffAccounts();
        int totalProducts = productDAO.getTotalProducts();
        int totalBills = billDAO.getTotalBills();
        int totalClientAccounts = accountDAO.getTotalClientAccounts();
        int TotalProductNearExpired = productDAO.getTotalProductNearExpired();
        int totalProductExpired = productDAO.getTotalProductExpired();

        req.setAttribute("totalStaffAccounts",totalStaffAccounts);
        req.setAttribute("totalProducts", totalProducts);
        req.setAttribute("totalBills",totalBills);
        req.setAttribute("totalClientAccounts",totalClientAccounts);
        req.setAttribute("TotalProductNearExpired",TotalProductNearExpired);
        req.setAttribute("totalProductExpired",totalProductExpired);
        //table san pham ban chay
        ArrayList<ArrayList<String>> topSaleProducts = productDAO.getTopSaleProducts();
        req.setAttribute("topSaleProducts", topSaleProducts);


        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-stat-sales.jsp");
        rd.forward(req, resp);
    }

}

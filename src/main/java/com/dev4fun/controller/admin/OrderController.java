package com.dev4fun.controller.admin;

import com.dev4fun.dao.BillDetailDAO;
import com.dev4fun.model.Bill;
import com.dev4fun.model.BillDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/order"})
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BillDetailDAO billDetailDAO = new BillDetailDAO();
        ArrayList<BillDetail> billDetailArrayList = billDetailDAO.getAllBillDetail();
        if (req.getParameter("t") != null && req.getParameter("v") != null) {
            String temp = req.getParameter("t");
            String value = req.getParameter("v");
            System.out.println(temp + " " + value);
            ArrayList<BillDetail> statForSearch;
            switch (temp) {
                case "id":
                    //id don hang ID
                    statForSearch = billDetailDAO.getBillDetailbyId("bill_id", value);
                    break;
                case "fn":
                    //ten khach hang full_name
                    statForSearch = billDetailDAO.getBillDetailbyCustomer(value);
                    break;
                case "name":
                    //ten don hang
                    statForSearch = billDetailDAO.getBillDetailbyProduct(value);
                    break;
                case "st":
                    //status
                    statForSearch = billDetailDAO.getBillDetailbyStatus(value);
                    break;
                default:
                    statForSearch = billDetailDAO.getAllBillDetail();
                    break;
            }
            req.setAttribute("statforsearch",statForSearch);
            req.setAttribute("txt",value);
        }
        else{
            req.setAttribute("statforsearch",billDetailArrayList);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-order.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

package com.dev4fun.controller.admin;


import com.dev4fun.dao.BillDetailDAO;
import com.dev4fun.model.BillDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/order"})
public class OrderController extends HttpServlet {
    BillDetailDAO billDetailDAO = new BillDetailDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<BillDetail> billDetailArrayList = billDetailDAO.getAllBillDetail();
        if (req.getParameter("t") != null && req.getParameter("v") != null) {
            String temp = req.getParameter("t");
            String value = req.getParameter("v");
            System.out.println(temp + " " + value);
            String none = "none";
            ArrayList<BillDetail> listBillDetail;
            switch (temp) {
                case "id":
                    //id don hang ID
                    listBillDetail = billDetailDAO.getBillDetailById("bill_id", Integer.parseInt(value));
                    break;
                case "fn":
                    //ten khach hang full_name
                    listBillDetail = billDetailDAO.getBillDetailByCustomer(value);
                    break;
                case "name":
                    //ten don hang
                    listBillDetail = billDetailDAO.getBillDetailByProduct(value);
                    break;
                case "st":
                    //status
                    listBillDetail = billDetailDAO.getBillDetailByStatus(value);
                    break;
                default:
                    listBillDetail = billDetailDAO.getAllBillDetail();
                    break;
            }
            String typeSearch = temp.equals("id") ? "ID Đơn hàng" :
                    temp.equals("fn") ? "Khách hàng" :
                            temp.equals("name") ? "Đơn hàng" : "Tình trạng";
            req.setAttribute("valueSearch", temp);
            req.setAttribute(temp, none);
            req.setAttribute("typeSearch", typeSearch);
            req.setAttribute("listBillDetail", listBillDetail);
            req.setAttribute("txt_sbilldetail", value);
        } else {
            System.out.println("all");
            req.setAttribute("valueSearch", "");
            req.setAttribute("typeSearch", "Tìm kiếm theo");
            req.setAttribute("listBillDetail", billDetailArrayList);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-order.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

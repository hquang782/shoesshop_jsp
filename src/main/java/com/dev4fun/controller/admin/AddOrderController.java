package com.dev4fun.controller.admin;


import com.dev4fun.dao.BillDAO;
import com.dev4fun.dao.BillDetailDAO;
import com.dev4fun.dao.ProductDAO;
import com.dev4fun.model.Account;
import com.dev4fun.model.Bill;
import com.dev4fun.model.BillDetail;
import com.dev4fun.model.Product;
import com.dev4fun.utils.SessionUtil;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/order/*"})
public class AddOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
//        System.out.println(req.getParameter("id"));
        if (url.contains("/admin/order/add")) {
            String action = "/admin/order/add";
            req.setAttribute("action",action);
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-add-order.jsp");
            rd.forward(req, resp);
        } else if (url.contains("/admin/order/edit") && req.getParameter("id") != null) {
            String action = "/admin/order/edit";
            req.setAttribute("action",action);
            req.setAttribute("id",req.getParameter("id"));
            Bill bill = new BillDAO().getBillById(Integer.parseInt(req.getParameter("id")));
            req.setAttribute("name", bill.getFullName());
            req.setAttribute("tel", bill.getPhoneNumber());
            req.setAttribute("address", bill.getAddress());
            req.setAttribute("email", bill.getEmail());
            req.setAttribute("code", bill.getPayMethod());
//            req.setAttribute("author", bill.getInvoice_creator());
            req.setAttribute(bill.getStatus(), "selected");
            req.setAttribute("listBillDetails",bill.getBillDetails());
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-add-order.jsp");
            rd.forward(req, resp);
        } else {
            resp.sendRedirect("/admin/order");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) SessionUtil.getInstance().getValue(req, "ACCOUNT_ADMIN");
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
        String url = req.getRequestURI();
        Bill bill = new Bill();
        Product product = new Product();


        bill.setFullName(req.getParameter("name"));
        bill.setPhoneNumber(req.getParameter("tel"));
        bill.setAddress(req.getParameter("address"));
        bill.setEmail(req.getParameter("email"));
        bill.setCreatedAt(currentDateTime.format(dtf));
        bill.setInvoice_creator(acc.getFullName());
        bill.setStatus(req.getParameter("status"));
        bill.setPayMethod(req.getParameter("code"));
        bill.setNote(req.getParameter("note"));
        bill.setUserId(0);
        int indexProd = 0;
        float totalAmount = 0;
        ArrayList<BillDetail> listBillDetails = new ArrayList<>();
        while (req.getParameter("productId" + indexProd) != null) {
            product = new ProductDAO().getProductById(Integer.parseInt(req.getParameter("productId" + indexProd)));
            BillDetail billDetail = new BillDetail();
            billDetail.setProduct(product);
            billDetail.setQuantity(Integer.parseInt(req.getParameter("quantityProduct" + indexProd)));
            if(url.contains("/admin/order/edit")) billDetail.setId(Integer.parseInt(req.getParameter("id" + indexProd)));
            billDetail.setAmount(product.getPrice() * Integer.parseInt(req.getParameter("quantityProduct" + indexProd)));
            billDetail.setSize(Integer.parseInt(req.getParameter("sizeProduct" + indexProd)));
            totalAmount += product.getPrice() * Integer.parseInt(req.getParameter("quantityProduct" + indexProd));
            indexProd++;
            listBillDetails.add(billDetail);
        }
        bill.setTotalAmount(totalAmount);
        bill.setBillDetails(listBillDetails);


        if (url.contains("/admin/order/add")) {
            int result = new BillDAO().createBill(bill);
            System.out.println(bill+"create");
            System.out.println(result);
            for (BillDetail temp : listBillDetails) {
                System.out.println(temp);
                boolean setBillDetail = new BillDetailDAO().createBillDetail(temp, result);
                System.out.println(temp);
                System.out.println(setBillDetail ? "success0" : "failed");
            }
            System.out.println(result != -1 ? "success" : "failed");
        }
        else {
            boolean result = new BillDAO().updateBill(bill);
            System.out.println(bill+"update");
            for (BillDetail temp : listBillDetails) {
                boolean setBillDetail = new BillDetailDAO().updateBillDetail(temp);
                System.out.println(temp);
                System.out.println(setBillDetail ? "success0" : "failed");
            }
            System.out.println(result ? "success" : "failed");
        }
        resp.sendRedirect("/admin/order");
    }
}

package com.dev4fun.controller.user;

import com.dev4fun.dao.ProductDAO;
import com.dev4fun.model.Product;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AllProductController", urlPatterns = {"/home/products"})
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("p");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Product> products = new ProductDAO().getProductByCategoryName(index, request.getParameter("loai_giay"));
        request.setAttribute("products", products);
        int count = new ProductDAO().getTotalProductByCategoryName(request.getParameter("loai_giay"));
        int endpage = count / 10;
        if (count % 10 != 0) {
            endpage++;
        }
        request.setAttribute("endp", endpage);
        request.setAttribute("loai_giay", request.getParameter("loai_giay"));
        System.out.println(endpage);
        RequestDispatcher rd = request.getRequestDispatcher("/views/user/all_product.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

package com.dev4fun.controller.user;

import com.dev4fun.dao.ProductDAO;
import com.dev4fun.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/products/*"})
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] urlSplit = req.getRequestURI().split("-");
        if (urlSplit.length >= 2) {
            int productId;
            try {
                productId = Integer.parseInt(urlSplit[urlSplit.length - 1]);
            } catch (Exception e) {
                resp.sendRedirect("/products");
                return;
            }
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);
            req.setAttribute("product", product);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/page-product-detail.jsp");
            requestDispatcher.forward(req, resp);
            return;
        }
        resp.sendRedirect("/products");
    }
}

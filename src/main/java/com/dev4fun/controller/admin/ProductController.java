package com.dev4fun.controller.admin;

import com.dev4fun.dao.CategoryDAO;
import com.dev4fun.dao.ProductDAO;
import com.dev4fun.model.Category;
import com.dev4fun.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/product"})
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> listProducts = productDAO.getAllProduct();
        req.setAttribute("listProducts", listProducts);

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> listCategories = categoryDAO.getAllCategory();
        req.setAttribute("listCategories", listCategories);

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-product.jsp");
        rd.forward(req, resp);
    }
}

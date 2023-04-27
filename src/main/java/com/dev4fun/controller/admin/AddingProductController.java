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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/product/add"})
public class AddingProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> listCategories = categoryDAO.getAllCategory();
        req.setAttribute("listCategories", listCategories);

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/page-add-product.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("act") != null && req.getParameter("act").equals("category")) {
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = new Category();
            category.setName(req.getParameter("newCategory"));
            boolean result = categoryDAO.createCategory(category);
            resp.sendRedirect("/admin/product/add");
            return;
        }
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");

        ProductDAO productDAO = new ProductDAO();
        Product product = new Product();
//        product.setId(Integer.parseInt(req.getParameter("code")));
//        product.setName(req.getParameter("name"));
        System.out.println(req.getParameter("price"));
//        product.setPrice(Float.parseFloat(req.getParameter("price")));
//        product.setCost(req.getParameter("cost"));
//        product.setStatus(req.getParameter("status"));
//        product.setCategoryId(Integer.parseInt(req.getParameter("category")));
//        product.setDescription(req.getParameter("description"));
//        product.setCreatedAt(currentDateTime.format(dtf));
//        product.setImageLink("");
//        product.setImageList("");

//        productDAO.createProduct(product);
//        resp.sendRedirect("/admin/product");
    }
}

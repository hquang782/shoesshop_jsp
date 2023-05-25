package com.dev4fun.controller.admin.api;

import com.dev4fun.model.Product;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/api/product/add"})
public class NewProductAPI extends HttpServlet {

    private Gson gson = new Gson();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = gson.fromJson(req.getReader(), Product.class);
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
    }
}

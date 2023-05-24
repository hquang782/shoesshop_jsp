package com.dev4fun.controller.user;

import com.dev4fun.dao.ProductDAO;
import com.dev4fun.model.Cart;
import com.dev4fun.model.Product;
import com.dev4fun.utils.CartUtil;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/user/page-cart.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id=Integer.valueOf(req.getParameter("productId"));
        Integer quantity=Integer.valueOf(req.getParameter("quantity"));
        Product product=new ProductDAO().getProductById(id);
        CartUtil.getCart(req);
        if(quantity>0)
        CartUtil.addProductToCart(req, product, quantity);
        else CartUtil.removeProductInCart(req,id);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/user/page-cart.jsp");
        requestDispatcher.forward(req, resp);
    }
}

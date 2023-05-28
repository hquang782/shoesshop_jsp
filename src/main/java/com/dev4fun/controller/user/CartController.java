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
        String act = req.getParameter("act");
        CartUtil.getCart(req);
        if(act==null)
        {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/user/page-cart.jsp");
            requestDispatcher.forward(req, resp);
        }
        else if (act.equalsIgnoreCase("add")) {
            Integer id = Integer.valueOf(req.getParameter("productId"));
            Integer quantity = Integer.valueOf(req.getParameter("quantity"));
            Integer size=Integer.valueOf(req.getParameter("size"));
            Product product = new ProductDAO().getProductById(id);
            CartUtil.addProductToCart(req, product, size , quantity);
        } else if (act.equalsIgnoreCase("remove")) {
            Integer id = Integer.valueOf(req.getParameter("productId"));
            Integer size=Integer.valueOf(req.getParameter("size"));
            CartUtil.removeProductInCart(req , id , size );
        }
        else if(act.equalsIgnoreCase("update"))
        {
            String quantity[]=req.getParameterValues("quantity");
            String size[]=req.getParameterValues("size");
            CartUtil.updateCart(req, quantity,size);
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/user/page-cart.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/user/page-cart.jsp");
        requestDispatcher.forward(req, resp);
    }
}

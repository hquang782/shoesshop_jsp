package com.dev4fun.controller.user;

import com.dev4fun.dao.ProductDAO;
import com.dev4fun.model.Cart;
import com.dev4fun.model.Product;
import com.dev4fun.utils.CartUtil;
import com.dev4fun.utils.SessionUtil;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
//        Integer id=Integer.valueOf(req.getParameter("productId"));
//        String act=req.getParameter("act");
//        int quantity=Integer.valueOf(req.getParameter("quantity"));
//        Product product=new ProductDAO().getProductById(id);
//        double total;
//        ArrayList<Cart> listCarts = (ArrayList<Cart>) SessionUtil.getInstance().getValue(req, "listCarts");
//        if(listCarts==null)
//        {
//            listCarts=new ArrayList<>();
//            Cart cart =new Cart(product, quantity);
//            listCarts.add(cart);
//        }
//        else{
//            boolean check=false;
//            for(Cart c:listCarts)
//            {
//                if(c.getProduct().getId()==product.getId()&&quantity!=0&&act!=null)
//                {
//                    c.setQuantity(Math.min(product.g, 0));
//                }
//            }
//        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/user/page-cart.jsp");
        requestDispatcher.forward(req, resp);
    }
}

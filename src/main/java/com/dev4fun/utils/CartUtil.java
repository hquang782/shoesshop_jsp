package com.dev4fun.utils;

import com.dev4fun.model.Cart;
import com.dev4fun.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

public class CartUtil {
    public static ArrayList<Cart> getCart(HttpServletRequest request) {
        ArrayList<Cart> listCarts = (ArrayList<Cart>) SessionUtil.getInstance().getValue(request, "listCarts");
        if (listCarts == null) {
            listCarts = new ArrayList<>();
            SessionUtil.getInstance().putValue(request, "listCarts", listCarts);
        }
        return listCarts;
    }

    public static void addProductToCart(HttpServletRequest request, Product product, int quantity) {
        ArrayList<Cart> listCarts = (ArrayList<Cart>) SessionUtil.getInstance().getValue(request, "listCarts");
        if (listCarts == null) {
            listCarts = new ArrayList<>();
        }
        int isExist = isExisting(listCarts, product.getId());
        if (isExist != -1) {
            listCarts.get(isExist).setQuantity(Math.min(listCarts.get(isExist).getProduct().getTotalQuantity(), listCarts.get(isExist).getQuantity() + quantity)
                    );
        } else {
            listCarts.add(new Cart(product, quantity));
        }
        SessionUtil.getInstance().putValue(request, "listCarts", listCarts);
    }
    public static void updateCart(HttpServletRequest request, int id,int quantity)
    {
        ArrayList<Cart> listCarts = (ArrayList<Cart>) SessionUtil.getInstance().getValue(request, "listCarts");
        int index = isExisting(listCarts, id);
        listCarts.get(index).setQuantity(quantity);
    }
    public static void removeProductInCart(HttpServletRequest request, int id) {
        ArrayList<Cart> listCarts = (ArrayList<Cart>) SessionUtil.getInstance().getValue(request, "listCarts");
        listCarts.remove(isExisting(listCarts, id));
    }

    public static int isExisting(ArrayList<Cart> listCarts, int id) {
        for (int i = 0; i < listCarts.size(); i++) {
            if (listCarts.get(i).getProduct().getId() == id) {
                return i;
            }
        }
        return -1;
    }
}

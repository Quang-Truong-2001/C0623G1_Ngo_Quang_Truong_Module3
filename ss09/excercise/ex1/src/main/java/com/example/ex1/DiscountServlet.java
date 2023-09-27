package com.example.ex1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "discountServlet", value = "/discount-servlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double listPriceProduct= Double.parseDouble(request.getParameter("listPriceProduct"));
        double discountPercentProduct= Double.parseDouble(request.getParameter("discountPercentProduct"));
        double result=listPriceProduct*discountPercentProduct*0.01;
        double priceProduct=listPriceProduct-result;
        request.setAttribute("result",result);
        request.setAttribute("priceProduct",priceProduct);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

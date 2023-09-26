package com.example.ss9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double number1 =
                Double.parseDouble(request.getParameter("number1"));
        double number2 =
                Double.parseDouble(request.getParameter("number2"));
        double result = number1 + number2;

        RequestDispatcher requestDispatcher =
                request.getRequestDispatcher("/result.jsp");
        request.setAttribute("result",result);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}

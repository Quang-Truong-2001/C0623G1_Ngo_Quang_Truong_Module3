package com.example.ex2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/servlet-calculator")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int number1= Integer.parseInt(request.getParameter("number1"));
        int number2= Integer.parseInt(request.getParameter("number2"));
        String operator = request.getParameter("operator");
        int result = number1 + number2;
        String exception=null;
        try {
            switch (operator) {
                case "Addition":
                    result = number1 + number2;
                    break;
                case "Subtraction":
                    result = number1 - number2;
                    break;
                case "Multiplication":
                    result = number1 * number2;
                    break;
                case "Division":
                    result = number1 / number2;
                    break;
            }
        } catch (Exception e){
            exception="Cannot divide by zero";
        }
        if(exception==null){
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute("result", exception);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

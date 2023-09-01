package com.samsam.controller.admin;


import com.samsam.dto.Category;
import com.samsam.dto.Product;
import com.samsam.model.CategoryDAO;
import com.samsam.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/BookListAdmin.do")
public class BookListAdminCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "교재 목록을 출력합니다.");
        String category = request.getParameter("category");

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        if(sid != null && sid.equals("admin")) {
            ProductDAO dao = new ProductDAO();
            List<Product> bookList = dao.getProductList();

            CategoryDAO cao = new CategoryDAO();
            Category cate = cao.getCategory("bookList");

            request.setAttribute("cate", cate);
            request.setAttribute("bookList", bookList);

            RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/bookList.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}

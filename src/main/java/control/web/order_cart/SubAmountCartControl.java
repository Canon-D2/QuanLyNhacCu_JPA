package control.web.order_cart;

import dao.impl.CartDAO;
import entity.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SubAmountCartControl", urlPatterns = {"/subAmountCart"})
public class SubAmountCartControl extends HttpServlet {
    private CartDAO cartDao = new CartDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }

        int accountID = a.getId();
        int productID = Integer.parseInt(request.getParameter("productID"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        if (amount > 1) {
            amount-- ;
            cartDao.editAmountCart(accountID, productID, amount);
        } else {
            cartDao.deleteItemInUserCart(accountID, productID);
        }

        request.setAttribute("mess", "Da giam so luong!");
        response.sendRedirect("managerCart");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
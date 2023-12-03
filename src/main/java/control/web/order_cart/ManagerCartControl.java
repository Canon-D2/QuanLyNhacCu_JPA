package control.web.order_cart;

import dao.impl.CartDAO;
import dao.impl.ProductDAO;
import entity.Account;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ManagerCartControl", urlPatterns = {"/managerCart"})
public class ManagerCartControl extends HttpServlet {

    private CartDAO cartDao = new CartDAO();
    private ProductDAO productDao = new ProductDAO();

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
        List<Cart> list = new ArrayList<>();
        list = cartDao.getCartByAccountID(accountID);
        List<Product> list2 = productDao.findAll();

        request.setAttribute("listCart", list);
        request.setAttribute("listProduct", list2);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
        double totalMoney = 0;
        for (Cart o : list) {
            for (Product p : list2) {
                if (o.getProduct().getId() == p.getId()) {
                    totalMoney = totalMoney + (p.getPrice() * o.getAmount());
                }
            }
        }

        double totalMoneyVAT = totalMoney + totalMoney * 0.1;

        PrintWriter out = response.getWriter();
        out.println(" <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Tổng tiền hàng</strong><strong>" + totalMoney + "</strong></li>\r\n"
                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Phí vận chuyển</strong><strong>Free ship</strong></li>\r\n"
                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">VAT</strong><strong>10 %</strong></li>\r\n"
                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Tổng thanh toán</strong>\r\n"
                + "                                            <h5 class=\"font-weight-bold\">" + totalMoneyVAT + "</h5>\r\n"
                + "                                        </li>");

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
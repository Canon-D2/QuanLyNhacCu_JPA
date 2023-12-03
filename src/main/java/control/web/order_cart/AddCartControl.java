package control.web.order_cart;

import dao.impl.CartDAO;
import entity.Account;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddCartControl", urlPatterns = {"/addCart"})
public class AddCartControl extends HttpServlet {
    private CartDAO cartDao = new CartDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int productID = Integer.parseInt(request.getParameter("pid"));
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();
        int amount = Integer.parseInt(request.getParameter("quantity"));
        String size = request.getParameter("size");

        Cart cartExisted = cartDao.checkCartExist(accountID, productID);
        int amountExisted;
        String sizeExisted;
        if (cartExisted != null) {
            amountExisted = cartExisted.getAmount();
            cartDao.editAmountAndSizeCart(accountID, productID, (amountExisted + amount));
            request.setAttribute("mess", "Da tang so luong san pham!");
            request.getRequestDispatcher("managerCart").forward(request, response);
        } else {
            Product product = new Product();
            product.setId(productID);
            cartDao.save(new Cart(product, a, amount));
            request.setAttribute("mess", "Da them san pham vao gio hang!");
            
            request.getRequestDispatcher("managerCart").forward(request, response);
        }
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
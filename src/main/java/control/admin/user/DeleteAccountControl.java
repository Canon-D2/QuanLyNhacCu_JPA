package control.admin.user;

import dao.impl.CartDAO;
import dao.impl.OrderDAO;
import dao.impl.ProductDAO;
import dao.impl.ReviewDAO;
import dao.impl.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteAccountControl", urlPatterns = {"/deleteAccount"})
public class DeleteAccountControl extends HttpServlet {

    UserDAO userDao = new UserDAO();
    OrderDAO orderDao = new OrderDAO();
    ProductDAO productDao = new ProductDAO();
    CartDAO cartDao = new CartDAO();
    ReviewDAO reviewDao = new ReviewDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id: " + id);
        String tt = request.getParameter("tinhTrang");
        if (tt.equals("1")) {
            cartDao.deleteCartByAccountID(id);
            reviewDao.deleteReviewByAccountID(id);
//        dao.deleteTongChiTieuBanHangByUserID(id);
            userDao.updateTinhTrang(0, id);

            request.setAttribute("mess", "Account Locked!");
        } else {
            userDao.updateTinhTrang(1, id);
             request.setAttribute("mess", "Account UnLocked!");
        }

        request.getRequestDispatcher("managerAccount").forward(request, response);
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
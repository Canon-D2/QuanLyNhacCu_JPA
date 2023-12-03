package control.admin.product;

import dao.impl.CartDAO;
import dao.impl.ProductDAO;
import dao.impl.ReviewDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteControl", urlPatterns = {"/delete"})
public class DeleteControl extends HttpServlet {

    ProductDAO productDao = new ProductDAO();
    CartDAO cartDao = new CartDAO();
    ReviewDAO reviewDao = new ReviewDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pid = Integer.parseInt(request.getParameter("pid"));
        String tt = request.getParameter("tinhTrang");
        cartDao.deleteCartByProductID(pid);
        reviewDao.deleteReviewByProductID(pid);
        if (tt.equals("1")) {
            productDao.updateTinhTrang(0, pid);
            request.setAttribute("mess", "Deleted!");
            try {
                productDao.delete(pid);
            } catch (Exception e) {
                productDao.updateTinhTrang(0, pid);
                request.setAttribute("mess", "Locked!");
            }
        } else {
            productDao.updateTinhTrang(1, pid);
            request.setAttribute("mess", "unlocked!");
        }
        request.getRequestDispatcher("manager").forward(request, response);
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
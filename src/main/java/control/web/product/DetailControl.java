package control.web.product;

import dao.impl.CategoryDAO;
import dao.impl.ProductDAO;
import dao.impl.ReviewDAO;
import dao.impl.UserDAO;
import entity.Account;
import entity.Product;
import entity.Review;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    ReviewDAO reviewDAO = new ReviewDAO();
    UserDAO userDao = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("pid");
        
        Product p = productDAO.findById(Integer.parseInt(id));
        int cateIDProductDetail = p.getCategory().getId();
        List<Product> listRelatedProduct = productDAO.getRelatedProduct(cateIDProductDetail);
        
        List<Review> listAllReview = reviewDAO.getAllReviewByProductID(p.getId());
        int countAllReview = 0;
        if(listAllReview != null)
            countAllReview = listAllReview.size();
        
        List<Account> listAllAcount = userDao.findAll();
        
        Product last = productDAO.getLast(1).get(0);

        request.setAttribute("detail", p);
        request.setAttribute("listRelatedProduct", listRelatedProduct);
        request.setAttribute("listAllReview", listAllReview);
        request.setAttribute("listAllAcount", listAllAcount);
        request.setAttribute("countAllReview", countAllReview);
        request.setAttribute("p", last);
        request.getRequestDispatcher("DetailProduct.jsp").forward(request, response);
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
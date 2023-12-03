package control.web.order_cart;

import dao.impl.CartDAO;
import dao.impl.OrderDAO;
import dao.impl.ProductDAO;
import dao.impl.TongChiTieuDAO;
import entity.Account;
import entity.Cart;
import entity.Email;
import entity.EmailUtils;
import entity.EntityOrder;
import entity.Product;
import entity.TongChiTieuBanHang;
import entity.orderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

    private CartDAO cartDao = new CartDAO();
    private OrderDAO orderDao = new OrderDAO();
    private ProductDAO productDao = new ProductDAO();
    private TongChiTieuDAO tctDao = new TongChiTieuDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();

        PrintWriter out = response.getWriter();
        List<Cart> listProductCart = cartDao.getCartByAccountID(accountID);
        if (listProductCart.isEmpty()) {
            request.setAttribute("error", "Thất Bại! Giỏ hàng của bạn không có sản phẩm!");
            out.print("<script>alert('Thất bại! không có sản phẩm trong giỏ hàng') </script>");
            response.sendRedirect("ManagerCartControl");
            return;
        }

        List<Cart> list = cartDao.getCartByAccountID(accountID);
        request.getRequestDispatcher("DatHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String emailAddress = request.getParameter("email");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String deliveryAddress = request.getParameter("deliveryAddress");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();

        List<Cart> listProductCart = cartDao.getCartByAccountID(accountID);
        if (listProductCart.isEmpty()) {
            request.setAttribute("error", "Thất Bại! Giỏ hàng của bạn không có sản phẩm!");
        } else {
            String mess = "";
            List<orderDetail> ListorderDetail = new ArrayList<>();
            Product product = new Product();
            double totalMoney = 0;
            System.out.println("List GH: ");
            mess = mess + "List GH: /n";
            for (Cart c : listProductCart) {
//                mess = mess + " " + c.getAccountID() + "-" + c.getProductID() + "-" + c.getAmount();
                orderDetail orderDetail = new orderDetail();
                product = productDao.findById(c.getProduct().getId());
                orderDetail.setProduct(product);
                orderDetail.setAmount(c.getAmount());
                ListorderDetail.add(orderDetail);

                product.setSoluongdaban(product.getSoluongdaban() + orderDetail.getAmount());
                productDao.update(product);

                totalMoney = totalMoney + (product.getPrice() * c.getAmount());
            }
            double totalMoneyVAT = totalMoney + totalMoney * 0.1;
            EntityOrder order = new EntityOrder();
            order.setDiachi(name);
            order.setEmail(emailAddress);
            order.setPhoneNumber(phoneNumber);
            order.setDiachi(deliveryAddress);
            order.setAccount(a);
            order.setListOrderDetail(ListorderDetail);
            order.setTongGia(totalMoneyVAT);
            orderDao.saveOrder(order);
            request.setAttribute("mess", mess);
            cartDao.deleteCartByAccountID(accountID);

            
            
            TongChiTieuBanHang t = tctDao.checkTCT(accountID);
            if (t == null) {
                t = new TongChiTieuBanHang();
                t.setTongBanHang(0);
                t.setTongChiTieu(totalMoneyVAT);
                t.setUser(a);
                tctDao.save(t);
            } else {
                t.setTongChiTieu(totalMoneyVAT+t.getTongChiTieu());
                tctDao.update(t);
            }

            response.sendRedirect(request.getContextPath() + "/UserOrder");

            //Gửi Mail xác nhận cho khách hàng
            List<Cart> list = cartDao.getCartByAccountID(accountID);
            List<Product> list2 = productDao.findAll();

            Email email = new Email();
            email.setFrom("example@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
            email.setFromPassword("abcd xyzt abcd xyzt"); //mat khau ung dung 2 lop
            email.setTo(emailAddress);
            email.setSubject("Đặt hàng thành công từ SGU Music");
            StringBuilder sb = new StringBuilder();
            sb.append("Kính gửi: ").append(name).append("<br>");
            sb.append("Bạn vừa đặt hàng thành công. <br> ");
            sb.append("Địa chỉ nhận hàng: <b>").append(deliveryAddress).append(" </b> <br>");
            sb.append("SĐT shipper sẽ liên hệ: <b>").append(phoneNumber).append(" </b> <br>");
            sb.append("Danh sách sản phẩm đã đặt: <br>");
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProduct().getId() == p.getId()) {
                        sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append(" | ").append("<br>");
                    }
                }
            }
            sb.append("Thành tiền: ").append(String.format("%.02f", totalMoneyVAT)).append("$").append("<br>");
            sb.append("Cảm ơn bạn đã ủng hộ chúng tôi!<br>");
            sb.append("By Team 13");

            email.setContent(sb.toString());
            try {
                EmailUtils.send(email);
                //request.setAttribute("mess", "Dat hang thanh cong!");
            } catch (Exception ex) {
                Logger.getLogger(OrderControl.class.getName()).log(Level.SEVERE, null, ex);
                //request.setAttribute("error", "Dat hang that bai!");
            }
            return;
        }

        request.getRequestDispatcher("DatHang.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
package control.web.user;

import dao.impl.UserDAO;
import entity.Account;
import entity.Email;
import entity.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordControl extends HttpServlet {

    private UserDAO userDao = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPasswordControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            String emailAddress = request.getParameter("email");
            String username = request.getParameter("username");

            Account account = userDao.checkAccountExistByUsernameAndEmail(username, emailAddress);
            if (account == null) {
                request.setAttribute("error", "Email hoac username sai!");
            }
            if (account != null) {
                Email email = new Email();
                email.setFrom("example@gmail.com");
                email.setFromPassword("abcd xyzt abcd xyzt");
                email.setTo(emailAddress);
                email.setSubject("Cấp lại mật khẩu");
                StringBuilder sb = new StringBuilder();
                sb.append("Kính gửi: ").append(username).append("<br>");
                sb.append("Bạn đã yêu cầu cấp lại mật khẩu. <br> ");
                sb.append("Mật khẩu của bạn là: <b>").append(account.getPass()).append(" </b> <br>");
                sb.append("Thân gửi<br>");
                sb.append("Administrator");

                email.setContent(sb.toString());
                EmailUtils.send(email);

                request.setAttribute("mess", "Mat khau da duoc gui den email cua ban!");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
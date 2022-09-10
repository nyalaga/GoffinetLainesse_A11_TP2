package Control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URL;

@WebServlet(name = "Servlet_in18", value = "/Servlet_in18")
public class Servlet_in18 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String language = (String) session.getAttribute("Lang");
        if (language == null || !(request.getParameter("Lang").equals(language))) {
            String langChoice = request.getParameter("Lang");
            session.setAttribute("Lang", langChoice);
        }

        // redirection sur la page courante
        RequestDispatcher rd;
        String referrer = request.getHeader("Referer");
        if (referrer != null) {
            URL ref = new URL(referrer);
            referrer = ref.getPath().substring(request.getContextPath().length());
            rd = request.getRequestDispatcher(referrer);
        } else {
            rd = request.getRequestDispatcher("/index.jsp");
        }
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

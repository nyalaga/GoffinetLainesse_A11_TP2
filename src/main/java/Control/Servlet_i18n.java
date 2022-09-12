package Control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet_i18n", value = "/Servlet_i18n")
public class Servlet_i18n extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("referer");

        HttpSession session = request.getSession();

        String language = (String) session.getAttribute("Lang");
        if (language == null || !(request.getParameter("Lang").equals(language))) {
            String langChoice = request.getParameter("Lang");
            session.setAttribute("Lang", langChoice);
        }

        // redirection sur la page courante
        String dest = referer.substring(referer.lastIndexOf("/"));
        RequestDispatcher rd = request.getRequestDispatcher(dest);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

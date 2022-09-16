package Control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet_i18n", value = "/Servlet_i18n")
public class Servlet_i18n extends HttpServlet {

    // changer de langue
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        String lang = request.getParameter("lang");
        HttpSession session = request.getSession();

        String language = (String) session.getAttribute("lang");
        if (!(lang.equals(language))) {
            session.setAttribute("lang", lang);
        }

        response.sendRedirect(path);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

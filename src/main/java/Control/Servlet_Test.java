package Control;

import org.json.simple.parser.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import io.io;
import java.io.IOException;
import java.net.URL;
import java.util.List;

@WebServlet(name = "Servlet_Test", value = "/Servlet_Test")
public class Servlet_Test extends HttpServlet {



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

        response.sendRedirect(referrer);
        //rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

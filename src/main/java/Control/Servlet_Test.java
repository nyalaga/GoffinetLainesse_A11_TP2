package Control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet_Test", value = "/Servlet_Test")
public class Servlet_Test extends HttpServlet {

//    public void init() {
//        try {
//            String message = io.migrateJSONtoDB(getServletContext().getRealPath("pokedex.json"));
//            System.out.println(message);
//        } catch (IOException | ParseException e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String language = (String) session.getAttribute("Lang");
        if (language == null || !(request.getParameter("Lang").equals(language))) {
            String langChoice = request.getParameter("Lang");
            session.setAttribute("Lang", langChoice);
        }

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

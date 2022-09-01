package Control;


import io.io;
import model.Pokemon;
import org.json.simple.parser.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet_Test", value = "/Servlet_Test")
public class Servlet_Test extends HttpServlet {

    public void init() {
        try {
            String message = io.migrateJSONtoDB(getServletContext().getRealPath("pokedex.json"));
            System.out.println(message);
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

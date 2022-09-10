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

    // Création de la BD initiale
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


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

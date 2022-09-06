package Control;


import DAO.PokemonDAO;
import io.io;
import model.PkmType;
import model.Pokemon;
import org.json.simple.parser.ParseException;

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
        PokemonDAO pokemonDAO = new PokemonDAO();
//
//        List<Pokemon> resultat = pokemonDAO.getByTypes(PkmType.GRASS);
        List<Pokemon> resultat = pokemonDAO.getByWeight(5);
//        List<Pokemon> resultat = pokemonDAO.getByHeight(0.7);
        System.out.println(resultat);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

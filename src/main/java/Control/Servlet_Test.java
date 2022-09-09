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
//            String message = io.migrateJSONtoDB(getServletContext().getRealPath("resources/data/pokedex.json"));
//            System.out.println(message);
//        } catch (IOException | ParseException e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PokemonDAO pokemonDAO = new PokemonDAO();

        //pokemonDAO.save(new Pokemon(000, 000, "TEST", 5.0, 0.5, "TEST", PkmType.DARK));
        List<Pokemon> resultat = pokemonDAO.getByWeight(5);
        System.out.println(resultat.get(0));
        resultat = pokemonDAO.getByTypes(PkmType.DARK);
        System.out.println(resultat.get(0));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

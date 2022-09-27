package Control;

import DAO.PokemonDAO;
import io.io;
import model.Pokemon;
import org.json.simple.parser.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet_pokedexList", value = "/Servlet_pokedexList")
public class Servlet_pokedexList extends HttpServlet {

    // créer de la BD initiale
    public void init() {
        try {
            String message = io.migrateJSONtoDB(getServletContext().getRealPath("/resources/json/pokedex.json"));
            System.out.println(message);
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
    }

    // obtenir les données des Pokemon
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        PokemonDAO pokemonDAO = new PokemonDAO();

        List<Pokemon> pkmList = pokemonDAO.getAllPokemons();

        session.setAttribute("pkmList", pkmList);

        String dest = "";
        if(pkmList == null || pkmList.isEmpty()) {
            dest = "errorPkmNotFound.jsp";
        } else {
            dest = "pokedex.jsp";
        }
        response.sendRedirect(dest);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

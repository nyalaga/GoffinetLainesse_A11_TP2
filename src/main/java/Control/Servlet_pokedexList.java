package Control;

import DAO.PokemonDAO;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet_pokedexList", value = "/Servlet_pokedexList")
public class Servlet_pokedexList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PokemonDAO pokemonDAO = new PokemonDAO();

        List<Pokemon> pkmList = pokemonDAO.getAllPokemons();

        request.setAttribute("pkmList", pkmList);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/pokedex.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

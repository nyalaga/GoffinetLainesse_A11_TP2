package Control;

import DAO.PokemonDAO;
import model.PkmType;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "Servlet_deletePkm", value = "/Servlet_deletePkm")
public class Servlet_deletePkm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nationalDex = Integer.parseInt(request.getParameter("pkm-natDex"));

        PokemonDAO pokemonDAO = new PokemonDAO();
        pokemonDAO.delete(nationalDex);

        response.sendRedirect("Servlet_pokedexList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

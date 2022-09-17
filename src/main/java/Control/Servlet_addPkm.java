package Control;

import DAO.PokemonDAO;
import model.PkmType;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "Servlet_addPkm", value = "/Servlet_addPkm")
public class Servlet_addPkm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nationalDex = Integer.parseInt(request.getParameter("addNatId"));
        int regionalDex = Integer.parseInt(request.getParameter("addRegId"));
        String name = request.getParameter("addName");
        double weight = Double.parseDouble(request.getParameter("addWeight"));
        double height = Double.parseDouble(request.getParameter("addHeight"));
        String description = request.getParameter("addDesc");
        PkmType primaryType = PkmType.valueOf(request.getParameter("addType1").toUpperCase(Locale.ROOT));
        PkmType secondaryType = null;
        String type2 = request.getParameter("addType2");
        if (!type2.isEmpty()) {
            secondaryType  = PkmType.valueOf(type2.toUpperCase(Locale.ROOT));
        }

        Pokemon newPkm = new Pokemon(nationalDex, regionalDex, name, weight, height, description, primaryType, secondaryType);

        PokemonDAO pokemonDAO = new PokemonDAO();

        pokemonDAO.save(newPkm);

        response.sendRedirect("Servlet_pokedexList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

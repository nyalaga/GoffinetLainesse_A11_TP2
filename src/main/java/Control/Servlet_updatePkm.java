package Control;

import DAO.PokemonDAO;
import model.PkmType;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "Servlet_updatePkm", value = "/Servlet_updatePkm")
public class Servlet_updatePkm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int nationalDex = Integer.parseInt(request.getParameter("updateNatId"));
        int regionalDex = Integer.parseInt(request.getParameter("updateRegId"));
        String name = request.getParameter("updateName");
        double weight = Double.parseDouble(request.getParameter("updateWeight"));
        double height = Double.parseDouble(request.getParameter("updateHeight"));
        String description = request.getParameter("updateDesc");
        PkmType primaryType = PkmType.valueOf(request.getParameter("updateType1").toUpperCase(Locale.ROOT));
        PkmType secondaryType = null;
        String type2 = request.getParameter("updateType2");
        if (!(type2.isEmpty())) {
            secondaryType  = PkmType.valueOf(type2.toUpperCase(Locale.ROOT));
        }

        Pokemon updatedPkm = new Pokemon(nationalDex, regionalDex, name, weight, height, description, primaryType, secondaryType);

        PokemonDAO pokemonDAO = new PokemonDAO();

        pokemonDAO.update(updatedPkm);

        response.sendRedirect("Servlet_pokedexList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

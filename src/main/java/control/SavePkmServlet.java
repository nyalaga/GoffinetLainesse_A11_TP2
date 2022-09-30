package control;

import DAO.PokemonDAO;
import model.PkmType;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "SavePkmServlet", value = "/SavePkmServlet")
public class SavePkmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres qui définissent le nouveau Pokemon
        int nationalDex = Integer.parseInt(request.getParameter("natId"));
        int regionalDex = Integer.parseInt(request.getParameter("regId"));
        String name = request.getParameter("name");
        double weight = Double.parseDouble(request.getParameter("weight"));
        double height = Double.parseDouble(request.getParameter("height"));
        String description = request.getParameter("desc");
        PkmType primaryType = PkmType.valueOf(request.getParameter("type1").toUpperCase(Locale.ROOT));
        PkmType secondaryType = null;
        String type2 = request.getParameter("type2");
        if (!type2.isEmpty()) {
            secondaryType  = PkmType.valueOf(type2.toUpperCase(Locale.ROOT));
        }

        Pokemon pkm = new Pokemon(nationalDex, regionalDex, name, weight, height, description, primaryType, secondaryType);

        PokemonDAO pokemonDAO = new PokemonDAO();

        // Recherche s'il existe déjà un Pokemon avec cet ID
        Pokemon pkm0 = pokemonDAO.findById(nationalDex);

        if (pkm0 != null) { // si un Pokemon avec cet ID existe déjà
            if (request.getParameter("confirm") != null) { // s'il y a eu une confirmation
                pokemonDAO.update(pkm); //  modifier les attributs du Pokemon existant
                response.sendRedirect("PokedexListServlet");
            } else { // sinon envoyer la demande de confirmation
                request.setAttribute("pkm", pkm);
                request.setAttribute("pkm0", pkm0);
                RequestDispatcher rd = request.getRequestDispatcher("/saveForm.jsp");
                rd.forward(request, response);
            }
        } else { // s'il n'existe pas de Pokemon avec le même ID
            pokemonDAO.save(pkm);  // enregistrer le Pokemon
            response.sendRedirect("PokedexListServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

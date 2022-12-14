package control;

import DAO.PokemonDAO;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PkmByIdServlet", value = "/PkmByIdServlet")
public class PkmByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de l'id du Pokemon
        int Id = Integer.parseInt(request.getParameter("searchNatId"));

        PokemonDAO pokemonDAO = new PokemonDAO();

        Pokemon pkm = pokemonDAO.findById(Id);

        String dest;
        if(pkm == null) { // si le Pokemon n'est pas trouvé
            dest = ("/errorPkmNotFound.jsp"); // afficher la page "aucun Pokemon trouvé"
        } else { // sinon renvoyer le Pokemon
            request.setAttribute("pkm", pkm);
            dest = "/" + request.getParameter("dest");
        }

        RequestDispatcher rd = request.getRequestDispatcher(dest);
        rd.forward(request, response);
    }
}

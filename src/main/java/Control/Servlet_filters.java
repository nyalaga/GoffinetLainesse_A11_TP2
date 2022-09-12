package Control;

import DAO.PokemonDAO;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet_filters", value = "/Servlet_filters")
public class Servlet_filters extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dest = "";
        String partialName = request.getParameter("partialName");
        // aller chercher la liste de paramètres
        // si nom Paramètre → switch case
        // !!! un paramètre à la fois?
        PokemonDAO pokemonDAO = new PokemonDAO();
        List<Pokemon> pkmList = pokemonDAO.findByPartialName(partialName);
        request.setAttribute("pkmList", pkmList);

        if(pkmList.isEmpty()) {
            dest = "/404.html";
        } else {
            dest = "/pokemonsFound.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(dest);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

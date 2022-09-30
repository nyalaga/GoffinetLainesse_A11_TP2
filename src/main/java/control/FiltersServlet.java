package control;

import DAO.PokemonDAO;
import model.PkmType;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "FiltersServlet", value = "/FiltersServlet")
public class FiltersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dest;

        PokemonDAO pokemonDAO = new PokemonDAO();
        List<Pokemon> pkmList = null;
        List<String> parameterNames = new ArrayList<>(request.getParameterMap().keySet());

        for (String param: parameterNames) {
            switch (param) {
                case "partialName" -> {
                    String partialName = request.getParameter("partialName");
                    pkmList = pokemonDAO.findByPartialName(partialName);
                }
                case "typeChoice" -> {
                    PkmType type = PkmType.valueOf(request.getParameter("typeChoice").toUpperCase(Locale.ROOT));
                    pkmList = pokemonDAO.getByType(type);
                }
                case "heightChoice" -> {
                    double height = Double.parseDouble(request.getParameter("heightChoice"));
                    pkmList = pokemonDAO.getByHeight(height);
                }
                case "weightChoice" -> {
                    double minWeight = Double.parseDouble(request.getParameter("minWeightValue"));
                    double maxWeight = Double.parseDouble(request.getParameter("maxWeightValue"));
                    pkmList = pokemonDAO.getByWeight(minWeight, maxWeight);
                }
            }
        }

        request.setAttribute("pkmList", pkmList);

        if(pkmList == null || pkmList.isEmpty()) {
            dest = "/errorPkmNotFound.jsp";
        } else {
            dest = "/pokemonsResult.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(dest);
        rd.forward(request, response);
    }
}

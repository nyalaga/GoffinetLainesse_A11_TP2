package Control;

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

@WebServlet(name = "Servlet_filters", value = "/Servlet_filters")
public class Servlet_filters extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dest;

        PokemonDAO pokemonDAO = new PokemonDAO();
        List<Pokemon> pkmList = null;
        List<String> parameterNames = new ArrayList<>(request.getParameterMap().keySet());

        for (String param: parameterNames) {
            switch(param) {
                case "partialName":
                    String partialName = request.getParameter("partialName");
                    pkmList = pokemonDAO.findByPartialName(partialName);
                    break;
                case "typeChoice":
                    PkmType type = PkmType.valueOf(request.getParameter("typeChoice").toUpperCase(Locale.ROOT));
                    pkmList = pokemonDAO.getByType(type);
                    break;
                case "heightChoice":
                    double height = Double.parseDouble(request.getParameter("heightChoice"));
                    pkmList = pokemonDAO.getByHeight(height);
                    break;
                case "weightChoice":
                    double minWeight = Double.parseDouble(request.getParameter("minWeightValue"));
                    double maxWeight = Double.parseDouble(request.getParameter("maxWeightValue"));
                    pkmList = pokemonDAO.getByWeight(minWeight, maxWeight);
                    break;
            }
        }

        request.setAttribute("pkmList", pkmList);

        if(pkmList == null || pkmList.isEmpty()) {
            dest = "/error.jsp";
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

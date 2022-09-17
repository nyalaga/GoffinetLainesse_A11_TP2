package Control;

import DAO.PokemonDAO;
import model.Pokemon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet_pkmById", value = "/Servlet_pkmById")
public class Servlet_pkmById extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int Id = Integer.parseInt(request.getParameter("searchNatId"));

        PokemonDAO pokemonDAO = new PokemonDAO();

        Pokemon pkm = pokemonDAO.findById(Id);

        request.setAttribute("pkm", pkm);

        String type1 = pkm.getPrimaryType().name();
        request.setAttribute("type1", type1);

        if (!(pkm.getSecondaryType() == null)) {
            String type2 = pkm.getSecondaryType().name();
            request.setAttribute("type2", type2);
        }

        RequestDispatcher rd = request.getRequestDispatcher("deleteForm.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

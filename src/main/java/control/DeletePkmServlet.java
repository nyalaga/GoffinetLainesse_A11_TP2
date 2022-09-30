package control;

import DAO.PokemonDAO;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeletePkmServlet", value = "/DeletePkmServlet")
public class DeletePkmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int nationalDex = Integer.parseInt(request.getParameter("pkm-natDex"));

        PokemonDAO pokemonDAO = new PokemonDAO();
        pokemonDAO.delete(nationalDex);

        response.sendRedirect("PokedexListServlet");
    }
}

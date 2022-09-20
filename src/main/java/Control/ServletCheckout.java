package Control;

import model.Pokemon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashSet;

@WebServlet(name="servlet_checkout", value = "/ServletCheckout")
public class ServletCheckout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        HashSet<Pokemon> checkoutAdded = (HashSet<Pokemon>) session.getAttribute("transactionsAdded");
        HashSet<Pokemon> checkoutRemoved = (HashSet<Pokemon>) session.getAttribute("transactionsRemoved");

        if (session.getAttribute("team") == null) {
            session.setAttribute("team", new HashSet<Pokemon>());
        }
        HashSet<Pokemon> team = (HashSet<Pokemon>) session.getAttribute("team");
        if (!team.isEmpty()) {
            team.removeIf(p -> checkoutRemoved.contains(p));
        }
        team.addAll(checkoutAdded);
        checkoutRemoved.clear();
        checkoutAdded.clear();
        resp.sendRedirect(req.getContextPath() + "/team.jsp");
    }
}

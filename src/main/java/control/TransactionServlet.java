package control;

import model.Pokemon;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;

@WebServlet(name = "TransactionServlet", value = "/TransactionServlet")
public class TransactionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter writer = resp.getWriter();
        String pkm = req.getParameter("pkm");
        boolean selected = Boolean.parseBoolean(req.getParameter("sel"));
        HttpSession session = req.getSession();
        Pokemon selectedPkm = null;
        List<Pokemon> pkmList = (List<Pokemon>) session.getAttribute("pkmList");
        HashSet<Pokemon> team = (HashSet<Pokemon>) session.getAttribute("team");
        if (team == null) {
            team = new HashSet<>();
        }

        System.out.println(session.getAttribute("transactionsAdded"));
        if (session.getAttribute("transactionsAdded") == null) {
            session.setAttribute("transactionsAdded", new HashSet<Pokemon>());
        }
        System.out.println(session.getAttribute("transactionsRemoved"));
        if (session.getAttribute("transactionsRemoved") == null) {
            session.setAttribute("transactionsRemoved", new HashSet<Pokemon>());
        }
        HashSet<Pokemon> transactionsAdded = (HashSet<Pokemon>) session.getAttribute("transactionsAdded");
        HashSet<Pokemon> transactionsRemoved = (HashSet<Pokemon>) session.getAttribute("transactionsRemoved");
        for (Pokemon p : pkmList) {
            System.out.println(pkm + " with " + p.getName());
            if (p.getName().strip().equalsIgnoreCase(pkm.strip())) {
                selectedPkm = p;
                break;
            }
        }
        boolean isAdded = false;
        boolean isRemoved = false;
        if (team.contains(selectedPkm) && !selected) {
            isAdded = true;
            updateTransaction(selectedPkm, transactionsAdded, transactionsRemoved, team, false);
        } else if (!selected) {
            isAdded = updateTransaction(selectedPkm, transactionsAdded, transactionsRemoved, team, false);
        } else {
            isRemoved = updateTransaction(selectedPkm, transactionsAdded, transactionsRemoved, team, true);
        }
        JSONObject answer = new JSONObject();
        answer.put("isAdded", isAdded);
        answer.put("isRemoved", isRemoved);
        answer.put("isAddedEmpty", transactionsAdded.isEmpty());
        answer.put("isRemovedEmpty", transactionsRemoved.isEmpty());
        System.out.println(answer);
        writer.print(answer.toJSONString());
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    private boolean updateTransaction(Pokemon pokemon, HashSet<Pokemon> transactionsAdded, HashSet<Pokemon>  transactionsRemoved, HashSet<Pokemon> team, boolean isRemove) {
        if ((transactionsAdded.size() + team.size() - transactionsRemoved.size()) == 6 && !isRemove) {
            return false;
        }
        // TEST NEW WAY
        if (isRemove) {
            if (team.contains(pokemon)) {
                transactionsRemoved.add(pokemon);
            } else if (transactionsAdded.contains(pokemon)){
                    transactionsAdded.remove(pokemon);
                } else {
                    transactionsAdded.remove(pokemon);
                    transactionsRemoved.add(pokemon);
                }
            } else {
            if (team.contains(pokemon)) {
                transactionsRemoved.remove(pokemon);
                return false;
            } else if (transactionsRemoved.contains(pokemon)) {
                transactionsRemoved.remove(pokemon);
            } else {
                transactionsRemoved.remove(pokemon);
                transactionsAdded.add(pokemon);
            }
        }

        return true;
    }

}

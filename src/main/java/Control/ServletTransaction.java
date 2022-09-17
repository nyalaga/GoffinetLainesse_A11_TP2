package Control;

import model.Pokemon;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;

@WebServlet(name = "servlet_transaction", value = "/ServletTransaction")
public class ServletTransaction extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter writer = resp.getWriter();
        String pkm = req.getParameter("pkm");
        boolean selected = Boolean.parseBoolean(req.getParameter("sel"));
        HttpSession session = req.getSession();
        Pokemon selectedPkm = null;
        List<Pokemon> pkmList = (List<Pokemon>) session.getAttribute("pkmList");

        System.out.println(session.getAttribute("transaction"));
        if (session.getAttribute("transactions") == null) {
            session.setAttribute("transactions", new HashSet<Pokemon>());
        }
        HashSet<Pokemon> transactions = (HashSet<Pokemon>) session.getAttribute("transactions");
        for (Pokemon p : pkmList) {
            System.out.println(pkm + " with " + p.getName());
            if (p.getName().strip().equalsIgnoreCase(pkm.strip())) {
                selectedPkm = p;
                break;
            }
        }
        boolean isAdded = updateTransaction(selectedPkm, transactions);
        JSONObject answer = new JSONObject();
        answer.put("isAdded", isAdded);
        answer.put("isEmpty", transactions.isEmpty());
        System.out.println(answer);
        writer.print(answer.toJSONString());
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    private boolean updateTransaction(Pokemon pokemon, HashSet<Pokemon> transactions) {
        if (transactions.size() == 6) {
            return false;
        }
        if (!transactions.add(pokemon)) {
            transactions.remove(pokemon);
            return false;
        }
        return true;
    }

}

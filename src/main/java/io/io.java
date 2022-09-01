package io;

import DAO.PokemonDAO;
import model.Pokemon;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;

public class io {
    public static String migrateJSONtoDB(String fichier) throws IOException, ParseException {
        Object object = new JSONParser().parse(new FileReader(fichier));
        JSONObject jso = (JSONObject) object;
        JSONArray pokemons = (JSONArray) jso.get("pokedex");

        PokemonDAO pokemonDAO = new PokemonDAO();

        for (int i = 0; i < pokemons.size(); i++) {
            Object o = pokemons.get(i);
            String sNationalDex = (String) ((JSONObject) o).get("national_dex");
            int nationalDex = Integer.parseInt(sNationalDex);
            String sRegionalDex = (String) ((JSONObject) o).get("regional_dex");
            int regionalDex = Integer.parseInt(sRegionalDex);
            String name = (String) ((JSONObject) o).get("name");
            String sWeight = (String) ((JSONObject) o).get("weight");
            double weight = Double.parseDouble(sWeight);
            String sHeight = (String) ((JSONObject) o).get("height");
            double height = Double.parseDouble(sHeight);
            String desc = (String) ((JSONObject) o).get("desc");


            Pokemon pokemon = new Pokemon(nationalDex, regionalDex, name, weight, height, desc);

            pokemonDAO.save(pokemon);
        }
        return "La base de données pokedex a été créée";
    }

}

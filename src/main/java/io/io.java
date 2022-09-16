package io;

import DAO.PokemonDAO;
import model.PkmType;
import model.Pokemon;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

public class io {

    /**
     * Récupérer les données des Pokemon du fichier JSON
     * @param fichier chemin du fichier JSON
     * @return un message de confirmation (string)
     * @throws IOException
     * @throws ParseException
     */
    public static String migrateJSONtoDB(String fichier) throws IOException, ParseException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(fichier), StandardCharsets.UTF_8));
        Object object = new JSONParser().parse(bufferedReader);
        JSONObject jso = (JSONObject) object;
        JSONArray pokemons = (JSONArray) jso.get("pokedex");

        PokemonDAO pokemonDAO = new PokemonDAO();


        for (Object o : pokemons) {
            JSONObject pokemonJson = ((JSONObject) o);

            String sNationalDex = pokemonJson.get("national_dex").toString();
            int nationalDex = Integer.parseInt(sNationalDex);
            String sRegionalDex = pokemonJson.get("regional_dex").toString();
            int regionalDex = Integer.parseInt(sRegionalDex);
            String name = (String) pokemonJson.get("name");
            double weight = (double) pokemonJson.get("weight");
            double height = (double) pokemonJson.get("height");
            String description = (String) pokemonJson.get("desc");
            JSONArray types = (JSONArray) pokemonJson.get("type");
            PkmType primaryType = null;
            PkmType secondaryType = null;
            if (types.size() >= 1) {
                Object type1 = types.get(0);
                primaryType = getTypeAsEnum((String) type1);
                if (types.size() >= 2) {
                    Object type2 = types.get(1);
                    secondaryType = getTypeAsEnum((String) type2);
                }
            }

            Pokemon pokemon = new Pokemon(nationalDex, regionalDex, name, weight, height, description, primaryType, secondaryType);

            pokemonDAO.save(pokemon);
        }
        return "La base de données pokedex a été créée";
    }

    private static PkmType getTypeAsEnum(String type) {
        switch (type.toLowerCase(Locale.ROOT)) {
            case "normal":
                return PkmType.NORMAL;
            case "fire":
                return PkmType.FIRE;
            case "water":
                return PkmType.WATER;
            case "grass":
                return PkmType.GRASS;
            case "electric":
                return PkmType.ELECTRIC;
            case "ice":
                return PkmType.ICE;
            case "fighting":
                return PkmType.FIGHTING;
            case "poison":
                return PkmType.POISON;
            case "ground":
                return PkmType.GROUND;
            case "flying":
                return PkmType.FLYING;
            case "psychic":
                return PkmType.PSYCHIC;
            case "bug":
                return PkmType.BUG;
            case "rock":
                return PkmType.ROCK;
            case "ghost":
                return PkmType.GHOST;
            case "dark":
                return PkmType.DARK;
            case "dragon":
                return PkmType.DRAGON;
            case "steel":
                return PkmType.STEEL;
            case "fairy":
                return PkmType.FAIRY;
            default:
                return null;
        }
    }
}

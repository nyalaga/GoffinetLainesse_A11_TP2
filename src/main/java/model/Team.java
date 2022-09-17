package model;

import java.util.HashSet;

public class Team {

    HashSet<Pokemon> pokemons;

    public Team() {
        this.pokemons = new HashSet<>();
    }

    public HashSet<Pokemon> getPokemons() {
        return pokemons;
    }

    public void addPokemon(Pokemon pokemon) {
        this.pokemons.add(pokemon);
    }

    public void removePokemon(Pokemon pokemon) {
        this.pokemons.remove(pokemon);
    }
}

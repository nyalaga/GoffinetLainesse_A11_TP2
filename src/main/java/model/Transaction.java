package model;

import java.util.Comparator;
import java.util.Objects;

public class Transaction {

    private Pokemon pokemon;
    private boolean action;

    public Transaction(Pokemon pokemon, boolean isInTeam) {
        this.pokemon = pokemon;
        this.action = isInTeam;
    }

    public Pokemon getPokemon() {
        return pokemon;
    }

    public boolean isInTeam() {
        return action;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Transaction that = (Transaction) o;
        return getPokemon().equals(that.getPokemon());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getPokemon());
    }
}

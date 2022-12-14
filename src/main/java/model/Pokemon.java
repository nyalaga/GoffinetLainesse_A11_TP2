package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Pokemon {

    @Id
    @Column(name = "national_dex", length = 4)
    private int nationalDex;

    @Column(name = "regional_dex", nullable = false, length = 4)
    private int regionalDex;

    @Column(nullable = false, length = 25)
    private String name;

    @Column(nullable = false, length = 7)
    private double weight;

    @Column(nullable = false, length = 5)
    private double height;

    @Column(nullable = false, length = 100)
    private String description;

    @Column(name = "primary_type", nullable = false)
    private PkmType primaryType;

    @Column(name = "secondary_type")
    private PkmType secondaryType;

    public Pokemon() {
    }

    public Pokemon(int nationalDex, int regionalDex, String name, double weight, double height, String description, PkmType primaryType) {
        this.nationalDex = nationalDex;
        this.regionalDex = regionalDex;
        this.name = name;
        this.weight = weight;
        this.height = height;
        this.description = description;
        this.primaryType = primaryType;
    }

    public Pokemon(int nationalDex, int regionalDex, String name, double weight, double height, String description, PkmType primaryType, PkmType secondaryType) {
        this.nationalDex = nationalDex;
        this.regionalDex = regionalDex;
        this.name = name;
        this.weight = weight;
        this.height = height;
        this.description = description;
        this.primaryType = primaryType;
        this.secondaryType = secondaryType;
    }

    public int getNationalDex() {
        return nationalDex;
    }

    public void setNationalDex(int nationalDex) {
        this.nationalDex = nationalDex;
    }

    public int getRegionalDex() {
        return regionalDex;
    }

    public void setRegionalDex(int regionalDex) {
        this.regionalDex = regionalDex;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PkmType getPrimaryType() {
        return primaryType;
    }

    public void setPrimaryType(PkmType primaryType) {
        this.primaryType = primaryType;
    }

    public PkmType getSecondaryType() {
        return secondaryType;
    }

    public void setSecondaryType(PkmType secondaryTYpe) {
        this.secondaryType = secondaryTYpe;
    }

    @Override
    public String toString() {
        return "Pokemon{" +
                "nationalDex=" + nationalDex +
                ", regionalDex=" + regionalDex +
                ", name='" + name + '\'' +
                ", weight=" + weight +
                ", height=" + height +
                ", description='" + description + '\'' +
                ", primaryType=" + primaryType +
                ", secondaryType=" + secondaryType +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pokemon pokemon = (Pokemon) o;
        return getNationalDex() == pokemon.getNationalDex() && getRegionalDex() == pokemon.getRegionalDex() && getName().equals(pokemon.getName()) && getPrimaryType() == pokemon.getPrimaryType() && getSecondaryType() == pokemon.getSecondaryType();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getNationalDex(), getRegionalDex(), getName(), getPrimaryType(), getSecondaryType());
    }
}

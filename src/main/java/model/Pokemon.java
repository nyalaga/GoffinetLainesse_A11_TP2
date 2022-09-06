package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Pokemon {

    @Id
    @Column(name = "national_dex")
    private int nationalDex;
    @Column(name = "regional_dex")
    private int regionalDex;
    private String name;
    private double weight;
    private double height;
    private String description;
    @Column(name = "primary_type")
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
}

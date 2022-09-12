package DAO;

import model.PkmType;

import java.util.List;

public interface ItemsDAO<T> {

    void save(T objet);

    T findById(int id);

    List<T> findByPartialName(String PartialName);

    List<T> getByType(PkmType type);

    List<T> getByWeight(double weight);

    List<T> getByHeight(double height);

    List<T> getAllPokemons();

}

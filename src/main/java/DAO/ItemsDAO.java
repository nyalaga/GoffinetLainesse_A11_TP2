package DAO;

import model.PkmType;

import java.util.List;
import java.util.Set;

public interface ItemsDAO<T> {

    void save(T objet);

    T findById(int id);

    List<T> findByPartialName(String PartialName);

    List<T> getByTypes(PkmType type);

    List<T> getByWeight(double weight);

    List<T> getByHeight(double height);

    List<T> getAllPokemons();

}

package DAO;

import model.PkmType;

import java.util.List;

public interface ItemsDAO<T> {

    void save(T objet);

    T findById(int id);

    List<T> findByPartialName(String PartialName);

    List<T> getByType(PkmType type);

    List<T> getByWeight(double minWeight, double maxWeight);

    List<T> getByHeight(double height);

    List<T> getAllPokemons();

    void update(T item);

    void delete(int id);
}

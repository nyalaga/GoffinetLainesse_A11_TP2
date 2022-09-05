package DAO;

import model.PkmType;
import model.Pokemon;

import javax.persistence.*;
import java.util.List;

public class PokemonDAO implements ItemsDAO<Pokemon> {

    static EntityManagerFactory entityManagerFactory =
            Persistence.createEntityManagerFactory("hibernate");


    /**
     * Sauvegarder un Pokemon dans la bd
     * @param pokemon l'objet Pokemon
     */
    @Override
    public void save(Pokemon pokemon) {

        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(pokemon);
            entityManager.getTransaction().commit();
            entityManager.close();
        } catch (Exception e) {
            e.printStackTrace();
            if(entityManager != null) {
                entityManager.getTransaction().rollback();
                entityManager.close();
            }
        }
    }

    /**
     * Trouver un Pokemon dans la BD selon son id (numéro national)
     * @param id (numéro national) du Pokemon
     * @return l'objet Pokemon
     */
    @Override
    public Pokemon findById(int id) {
        EntityManager entityManager = null;
        Pokemon pokemon = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            pokemon = entityManager.find(Pokemon.class, id);
            entityManager.getTransaction().commit();
            entityManager.close();
            return pokemon;
        } catch (Exception e) {
            e.printStackTrace();
            if(entityManager != null) {
                entityManager.getTransaction().rollback();
                entityManager.close();
            }
            return null;
        }
    }

    @Override
    public List<Pokemon> getByTypes(PkmType type) {
        EntityManager entityManager = null;
        List<Pokemon> listPokemons = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            String query = "SELECT p FROM pokemon p WHERE p.type = :pkmType";
            TypedQuery<Pokemon> typedQuery = entityManager.createQuery(query, Pokemon.class);
            typedQuery.setParameter("pkmType", type);
            listPokemons = typedQuery.getResultList();
            entityManager.close();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            if(entityManager != null) {
                entityManager.getTransaction().rollback();
                entityManager.close();
            }
            return null;
        }
    }

    @Override
    public List<Pokemon> getByWeight(double weight) {
        EntityManager entityManager = null;
        List<Pokemon> listPokemons = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            String query = "SELECT p FROM pokemon p WHERE p.weight = :pkmWeight";
            Query q = entityManager.createNativeQuery(query, Pokemon.class);
            q.setParameter("pkmWeight", weight);
            listPokemons = q.getResultList();
            entityManager.close();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            if(entityManager != null) {
                entityManager.getTransaction().rollback();
                entityManager.close();
            }
            return null;
        }
    }

    @Override
    public List<Pokemon> getByHeight(double height) {
        return null;
    }

    /**
     * Obtenir la liste de tous les Pokemons
     * @return la liste des Pokemons
     */
    @Override
    public List<Pokemon> getAllPokemons() {
        EntityManager entityManager = null;
        List<Pokemon> listPokemons = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            String query = "SELECT * FROM pokemon";
            Query q = entityManager.createNativeQuery(query, Pokemon.class);
            listPokemons = q.getResultList();
            entityManager.close();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            if(entityManager != null) {
                entityManager.getTransaction().rollback();
                entityManager.close();
            }
            return null;
        }
    }
}

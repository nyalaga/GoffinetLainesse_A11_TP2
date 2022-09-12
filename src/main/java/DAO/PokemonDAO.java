package DAO;

import model.PkmType;
import model.Pokemon;

import javax.persistence.*;
import java.lang.reflect.Method;
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
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.persist(pokemon);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }

    /**
     * Trouver un Pokemon dans la BD selon son id (numéro national)
     * @param id (numéro national) du Pokemon
     * @return l'objet Pokemon
     */
    @Override
    public Pokemon findById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Pokemon pokemon;

        try {
           transaction.begin();
            pokemon = entityManager.find(Pokemon.class, id);
            transaction.commit();
            return pokemon;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }

    /**
     * Trouver les Pokemons dans la BD selon son nom ou une partie de son nom
     * @param partialName suite de caractères évoquant un nom ou une partie du nom d'un Pokemon
     * @return la liste des Pokemons qui contiennent cette suite de caractères
     */
    @Override
    public List<Pokemon> findByPartialName(String partialName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        List<Pokemon> listPokemons;

        try {
            transaction.begin();
            String query = "SELECT p FROM Pokemon p WHERE UPPER(p.name) LIKE UPPER(CONCAT('%', :string,'%'))";
            TypedQuery<Pokemon> findByPartialNameQuery = entityManager.createQuery(query, Pokemon.class);
            findByPartialNameQuery.setParameter("string", partialName);
            listPokemons = findByPartialNameQuery.getResultList();
            transaction.commit();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }

    /**
     * Obtenir la liste des Pokemons selon leur type
     * @param type du Pokemon
     * @return la liste des Pokemons ayant ce type
     */
    @Override
    public List<Pokemon> getByType(PkmType type) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        List<Pokemon> listPokemons;

        try {
            transaction.begin();
            String query = "SELECT p FROM Pokemon p WHERE p.primaryType =:pkmType OR p.secondaryType =:pkmType";
            TypedQuery<Pokemon> getByTypesQuery = entityManager.createQuery(query, Pokemon.class);
            getByTypesQuery.setParameter("pkmType", type);
            listPokemons = getByTypesQuery.getResultList();
            transaction.commit();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }

    /**
     * Obtenir la liste des Pokemons selon un poids déterminé
     * @param weight du Pokemon
     * @return la liste des Pokemons ayant ce poids
     */
    @Override
    public List<Pokemon> getByWeight(double weight) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        List<Pokemon> listPokemons;

        try {
            transaction.begin();
            String query = "SELECT p FROM Pokemon p WHERE p.weight =:weight";
            TypedQuery<Pokemon> getByWeightQuery = entityManager.createQuery(query, Pokemon.class);
            getByWeightQuery.setParameter("weight", weight);
            listPokemons = getByWeightQuery.getResultList();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }

    /**
     * Obtenir la liste des Pokemons selon une grandeur déterminée
     * @param height du Pokemon
     * @return la liste des Pokemons ayant cette taille
     */
    @Override
    public List<Pokemon> getByHeight(double height) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        List<Pokemon> listPokemons;

        try {
            transaction.begin();
            String query = "SELECT p FROM Pokemon p WHERE p.height >= :height AND p.height < :height + 1";
            TypedQuery<Pokemon> getByHeightQuery = entityManager.createQuery(query, Pokemon.class);
            getByHeightQuery.setParameter("height", height);
            listPokemons = getByHeightQuery.getResultList();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }

    /**
     * Obtenir la liste de tous les Pokemons
     * @return la liste des Pokemons
     */
    @Override
    public List<Pokemon> getAllPokemons() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        List<Pokemon> listPokemons;

        try {
            transaction.begin();
            String query = "SELECT p FROM Pokemon p";
            TypedQuery<Pokemon> getAllPkmQuery = entityManager.createQuery(query, Pokemon.class);
            listPokemons = getAllPkmQuery.getResultList();
            return listPokemons;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
        }
    }
}

package DAO;

import model.Pokemon;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PokemonDAO implements ItemsDAO<Pokemon> {

    static EntityManagerFactory entityManagerFactory =
            Persistence.createEntityManagerFactory("hibernate");

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
}

package fr.iut2.ProjetJPA.data;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

public class AbsencesDAO {

    public static Absences retrieveById(int id) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        Absences abs = em.find(Absences.class, id);
        // etu est maintenant un objet de la classe Absences
        // ou NULL si l'absences n'existe pas

        // Close the entity manager
        em.close();

        return abs;
    }
    public static Absences create(String description, Etudiant etudiant, Date date) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // create new absences
        Absences absence = new Absences();
        absence.setDescription(description);
        absence.setEtudiant(etudiant);
        absence.setDateAbsence(date);
        em.persist(absence);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return absence;
    }
    public static Absences update(Absences absence) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // Attacher une entité persistante (etudiant) à l’EntityManager courant  pour réaliser la modification
        em.merge(absence);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return absence;
    }
    public static void remove(Absences absence) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // L'absences passé en paramètre doit être associé à l'EM
        if (!em.contains(absence)) {
            absence = em.merge(absence);
        }

        // Remove
        em.remove(absence);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();
    }
    public static List<Absences> getAbsenceEtudiant(Etudiant etudiant){
        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        // Recherche le details des absences d'un étudiant spécifique
        Query q = em.createQuery("SELECT a FROM Absences a WHERE a.etudiant = :etudiant order by a.dateAbsence DESC ")
                .setParameter("etudiant",etudiant);

        @SuppressWarnings("unchecked")
        List<Absences> abscence = q.getResultList();

        return abscence;
    }
}

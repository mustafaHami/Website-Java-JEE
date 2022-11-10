package fr.iut2.ProjetJPA.data;

import javax.persistence.EntityManager;

public class NoteDAO {

    public static Note retrieveById(int id) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        Note note = em.find(Note.class, id);
        // note est maintenant un objet de la classe Note
        // ou NULL si le module n'existe pas

        // Close the entity manager
        em.close();

        return note;
    }

    public static Note create(Float valeur,Etudiant etudiant, Module module){
        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        NoteDAO.removeNoteEtudiantModule(etudiant,module);

        Note note = new Note();
        note.setValeur(valeur);
        note.setEtudiant(etudiant);
        note.setModule(module);
        em.persist(note);
        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return note;

    }
    public static Note update(Note note) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // Attacher une entité persistante (note) à l’EntityManager courant pour réaliser la modification
        em.merge(note);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return note;
    }
    // suppression de tous les notes de l'étudiant
    // utilisé lors du changement de groupe
    public static void removeNoteEtudiant(Etudiant etudiant) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        //
        em.createQuery("DELETE FROM Note AS n WHERE n.etudiant = :etudiant")
                .setParameter("etudiant", etudiant)
                .executeUpdate();

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();
    }
    // suppression de tous les notes du module
    // utilisé lors du changement de groupe
    public static void removeNoteModule(Module module) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        //
        em.createQuery("DELETE FROM Note AS n WHERE n.module = :module")
                .setParameter("module", module)
                .executeUpdate();

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();
    }
    public static void removeNoteEtudiantModule(Etudiant etudiant, Module module) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        //
        em.createQuery("DELETE FROM Note AS n WHERE n.etudiant = :etudiant and n.module = :module")
                .setParameter("etudiant", etudiant)
                .setParameter("module",module)
                .executeUpdate();

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();
    }
}

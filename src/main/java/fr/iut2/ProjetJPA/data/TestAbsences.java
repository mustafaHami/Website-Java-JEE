package fr.iut2.ProjetJPA.data;


public class TestAbsences {

    /**
     * @param args
     */
    public static void main(String[] args) {

        //
        GestionFactory.open();

        // Initialisation
        // Creation des groupes
        Groupe MIAM = GroupeDAO.create("MIAM");
        Groupe SIMO = GroupeDAO.create("SIMO");
        Groupe MESSI = GroupeDAO.create("MESSI");

        // Initialisation
        // Creation des étudiants
        Etudiant FBM = EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM);
        int idFBM = FBM.getId();
        EtudiantDAO.create("Philippe", "Martin", MIAM);
        EtudiantDAO.create("Mario", "Cortes-Cornax", MIAM);
        EtudiantDAO.create("Françoise", "Coat", SIMO);
        EtudiantDAO.create("Laurent", "Bonnaud", MESSI);
        EtudiantDAO.create("Sébastien", "Bourdon", MESSI);
        Etudiant MG = EtudiantDAO.create("Mathieu", "Gatumel", SIMO);

        // Retrouver un etudiant par son id
        Etudiant etudiant_TMP = EtudiantDAO.retrieveById(idFBM);


        // Suppression d'un étudiant
        EtudiantDAO.remove(MG);
        //EtudiantDAO.remove(MG.getId());

        // Liste des groupes
        System.out.println("Liste des groupes :");
        for (Groupe groupe : GroupeDAO.getAll()) {
            System.out.println(groupe.getId() + " : " + groupe.getNom() + " (" + groupe.getEtudiants().size() + " étudiant(s))");
        }


        // Remove un groupe avec les étudiants associés
        GroupeDAO.remove(SIMO);

        // Remove entities
        EtudiantDAO.removeAll();
        GroupeDAO.removeAll();

        //
        GestionFactory.close();
    }

}

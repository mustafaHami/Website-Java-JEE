/**
 * @author hb
 */

/**
 * @author hb
 *
 */
package fr.iut2.ProjetJPA.controleur;





import fr.iut2.ProjetJPA.data.*;
import fr.iut2.ProjetJPA.data.Module;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.event.MouseAdapter;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@SuppressWarnings("serial")
public class Controleur extends HttpServlet {

    private String urlEtudiants;
    private String urlGroupes;
    private String urlFicheGroupe;
    private String urlFicheEtudiant;
    private String urlEditionEtudiant;
    private String urlLayout;
    private String urlAccueil;
    private String urlAjout;
    private String urlModules;
    private String urlFicheModule;
    private String urlAjoutNote;
    private String urlAbsences;
    private String urlDetailsAbsences;
    // INIT
    @Override
    public void init() throws ServletException {
        // Récupération des URLs en paramètre du web.xml
        urlEtudiants = getServletConfig().getInitParameter("urlEtudiants");
        urlGroupes = getServletConfig().getInitParameter("urlGroupes");
        urlFicheGroupe = getServletConfig().getInitParameter("urlFicheGroupe");
        urlFicheEtudiant = getServletConfig().getInitParameter("urlFicheEtudiant");
        urlEditionEtudiant = getServletConfig().getInitParameter("urlEditionEtudiant");
        urlLayout = getServletConfig().getInitParameter("urlLayout");
        urlAccueil = getServletConfig().getInitParameter("urlAccueil");
        urlModules = getServletConfig().getInitParameter("urlModules");
        urlAjout = getServletConfig().getInitParameter("urlAjout");
        urlFicheModule = getServletConfig().getInitParameter("urlFicheModule");
        urlAjoutNote = getServletConfig().getInitParameter("urlAjoutNote");
        urlAbsences = getServletConfig().getInitParameter("urlAbsences");
        urlDetailsAbsences = getServletConfig().getInitParameter("urlDetailsAbsences");
        // Création de la factory permettant la création d'EntityManager
        // (gestion des transactions)
        GestionFactory.open();

        ///// INITIALISATION DE LA BD
        // Normalement l'initialisation se fait directement dans la base de données
        if ((GroupeDAO.getAll().size() == 0) && (EtudiantDAO.getAll().size() == 0)) {

            // Creation des groupes
            Groupe MIAM = GroupeDAO.create("miam");
            Groupe SIMO = GroupeDAO.create("SIMO");
            Groupe MESSI = GroupeDAO.create("MESSI");


            // Creation des modules
            Module mod1sim = ModuleDAO.create("PHP",SIMO);
            Module mod2sim = ModuleDAO.create("Système d'information",SIMO);
            Module mod3mia = ModuleDAO.create("Unity3D",MIAM);
            Module mod4mia = ModuleDAO.create("Sound Design",MIAM);
            // Creation des étudiants
            Etudiant francis = EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM);
            Etudiant philippe = EtudiantDAO.create("Philippe", "Martin", MIAM);
            Etudiant mario = EtudiantDAO.create("Mario", "Cortes-Cornax", MIAM);
            Etudiant françoise = EtudiantDAO.create("Françoise", "Coat", SIMO);
            Etudiant laurent = EtudiantDAO.create("Laurent", "Bonnaud", MESSI);
            Etudiant sebastien = EtudiantDAO.create("Sébastien", "Bourdon", MESSI);
            Etudiant mathieu = EtudiantDAO.create("Mathieu", "Gatumel", SIMO);

            Note note1 = NoteDAO.create(14.0F,francis,mod4mia);
            Note note2 = NoteDAO.create(13.0F,francis,mod3mia);


        }
    }

    @Override
    public void destroy() {
        super.destroy();

        // Fermeture de la factory
        GestionFactory.close();

    }

    // POST
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // on passe la main au GET
        doGet(request, response);
    }

    // GET
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // On récupère le path
        String action = request.getPathInfo();
        if (action == null) {
            action = "/accueil";
        }
        // Log action
        System.out.println("PROJET JPA : action = " + action);

        // Exécution action
        if(action.equals("/accueil")){
            doAccueil(request,response);
        } else if (action.equals("/etudiants")) {
            doEtudiants(request, response);
        }else if(action.equals("/modifieEtudiant")){
            doModifEtudiant(request,response);
        } else if (action.equals("/groupes")) {
            doGroupes(request, response);
        }else if (action.equals("/fichegroupe")){
            doFicheGroupe(request,response);
        }else if(action.equals("/deletegroupe")) {
            doDeleteGroupe(request, response);
        }else if(action.equals("/modifieGroupe")){
            doModifGroupe(request,response);
        } else if(action.equals("/ajoutgroupe")) {
            doCreateGroupe(request,response);

        }else if (action.equals("/ficheetudiant")) {
            doFicheEtudiant(request, response);

        } else if (action.equals("/ajoutetudiant")) {
            doCreateEtudiant(request, response);

        }else if(action.equals("/deleteetudiant")) {
            doDeleteEtudiant(request, response);

        }else if(action.equals("/deletemodulegroupe")) {
            doDeleteModuleGroupe(request, response);

        }else if(action.equals("/modules")) {
            doModules(request, response);
        }else if(action.equals("/fichemodule")) {
            doFicheModule(request, response);
        }else if(action.equals("/modifiemodule")){
            doModifModule(request,response);
        }else if(action.equals("/deletemodule")) {
            doDeleteModule(request, response);
        }else if(action.equals("/ajoutmodule")){
            doAjoutModule(request,response);
        }else if(action.equals("/ajout")) {
            doAjoutEtudiantGroupe(request, response);
        }else if(action.equals("/ajoutnote")) {
            doAjoutNote(request, response);
        }else if(action.equals("/absences")) {
            doConsultationAbsence(request, response);
        }else if(action.equals("/ajoutAbsence")) {
            doAjoutAbsences(request, response);
        }else if(action.equals("/detailabsence")) {
            doDetailAbsence(request, response);
        }else if(action.equals("/deleteabsence")){
            doDeleteAbsence(request,response);
        }else {
            // Autres cas
            doEtudiants(request, response);
        }
    }




    // Une page spécifique pour les ajouts d'un groupe et d'un étudiant
    private void doAjoutEtudiantGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Groupe> groupes = GroupeDAO.getAll();
        request.setAttribute("groupes",groupes);

        request.setAttribute("content",urlAjout);
        loadJSP(urlLayout,request,response);

    }


    private void doAccueil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content",urlAccueil);
        loadJSP(urlLayout,request,response);
    }

    // /////////////////////// les méthodes Pour le groupe///////////////////////
    private void doGroupes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer les étudiants
        List<Groupe> groupes = GroupeDAO.getAll();
        List<Module> modules = ModuleDAO.getAll();

        request.setAttribute("groupes", groupes);
        request.setAttribute("modules", modules);
        //
        request.setAttribute("content",urlGroupes);
        loadJSP(urlLayout,request,response);

    }

    // cette méthode permet de visualiser toutes les personnes présentes dans ce groupe
    private void doFicheGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer l'id de l'étudiant
        int idGroupe = Integer.valueOf(request.getParameter("id"));
        boolean modifie = Boolean.valueOf(request.getParameter("modifie"));
        // "modifie" est valeur pour définir si il veut modifier ou visualiser le groupe
        // Récupérer l'étudiant
        Groupe groupe = GroupeDAO.retrieveById(idGroupe);
        List<Etudiant> etudiants = groupe.getEtudiants();

        // Ajouter l'étudiant à la requête pour affichage
        request.setAttribute("groupe", groupe);
        request.setAttribute("etudiants",etudiants);
        request.setAttribute("modifie",modifie);
        //
        request.setAttribute("content",urlFicheGroupe);
        loadJSP(urlLayout,request,response);

    }

    private void doModifGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String libelleGroupe = String.valueOf(request.getParameter("libelle"));
        int idGroupe = Integer.valueOf(request.getParameter("id"));
        boolean modifie = Boolean.valueOf(request.getParameter("modifie"));
        Groupe groupe = GroupeDAO.retrieveById(idGroupe);
        groupe.setNom(libelleGroupe);
        GroupeDAO.update(groupe);
        List<Etudiant> etudiants = groupe.getEtudiants();

        request.setAttribute("groupe",groupe);
        request.setAttribute("etudiants",etudiants);
        request.setAttribute("modifie",modifie);
        // on modifie puis on raffiche le groupe avec sa nouvelle valeur
        request.setAttribute("content",urlFicheGroupe);
        loadJSP(urlLayout,request,response);

    }
    private void doDeleteGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idGroupe = Integer.valueOf(request.getParameter("id"));
        Groupe groupe = GroupeDAO.retrieveById(idGroupe);
        GroupeDAO.remove(groupe);
        doGroupes(request,response);
    }
    private void doCreateGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomGroupe = String.valueOf(request.getParameter("libelle"));
        List<Groupe> groupes = GroupeDAO.getAll();
        boolean contient = false;
        for(Groupe groupe : groupes ){
            if(groupe.getNom().equalsIgnoreCase(nomGroupe)){
                contient = true;
            }
        }
        if(contient){
            doGroupes(request,response);
        }else{
            GroupeDAO.create(nomGroupe);
            doGroupes(request,response);
        }
    }
    //méthode pour supprimer le module dans une groupe précis
    private void doDeleteModuleGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idModule = Integer.valueOf(request.getParameter("idmodule"));
        ModuleDAO.remove(idModule);

        doGroupes(request,response);

    }
    // //////////////////////Methode pour les étudiants/////////////////////////
    private void doEtudiants(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer les étudiants
        List<Etudiant> etudiants = EtudiantDAO.getAll();
        List<Groupe> groupes = GroupeDAO.getAll();
        // Ajouter les étudiants à la requête pour affichage
        request.setAttribute("etudiants", etudiants);
        request.setAttribute("groupes", groupes);
        //

        request.setAttribute("content",urlEtudiants);
        loadJSP(urlLayout,request,response);
    }

    private void doFicheEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer l'id de l'étudiant
        int idEtudiant = Integer.valueOf(request.getParameter("id"));
        boolean modifie = Boolean.valueOf(request.getParameter("modifie"));
        // "modifie" est valeur pour définir si il veut modifier ou visualiser l'étudiant
        // Récupérer l'étudiant
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

        List<Groupe> groupes = GroupeDAO.getAll(); // récupération de tout les groupes pour la modification d'un étudiant
        // Ajouter l'étudiant à la requête pour affichage
        request.setAttribute("etudiant", etudiant);
        request.setAttribute("modifie",modifie);
        request.setAttribute("groupes", groupes);
        //
        request.setAttribute("content",urlFicheEtudiant);
        loadJSP(urlLayout,request,response);

    }

    private void doCreateEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom").toUpperCase();
        String prenom = request.getParameter("prenom");
        Groupe groupe = GroupeDAO.retrieveById(Integer.valueOf(request.getParameter("idGroupe")));
        List<Etudiant> etudiants = EtudiantDAO.getAll();
        boolean contient = false;

        for(Etudiant etudiant : etudiants){
            if(etudiant.getNom().equalsIgnoreCase(nom) && etudiant.getPrenom().equalsIgnoreCase(prenom) ){
                contient = true;
            }
        }

        if(contient){
            doEtudiants(request,response);
        }else{
            EtudiantDAO.create(prenom,nom,groupe);
            doEtudiants(request,response);
        }
    }

    private void doModifEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom").toUpperCase();
        String prenom = request.getParameter("prenom");
        Groupe groupe = GroupeDAO.retrieveById(Integer.valueOf(request.getParameter("idGroupe")));
        boolean modifie = Boolean.valueOf(request.getParameter("modifie"));

        // Récupérer l'id de l'étudiant
        int idEtudiant = Integer.valueOf(request.getParameter("id"));
        // Récupérer l'étudiant
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);
        // si l'étudiant change de groupe toutes ses notes seront supprimées
        if(!etudiant.getGroupe().getNom().equalsIgnoreCase(groupe.getNom())){
            NoteDAO.removeNoteEtudiant(etudiant);
        }
        // Modifier l'étudiant
        etudiant.setNom(nom);
        etudiant.setPrenom(prenom);
        etudiant.setGroupe(groupe);
        EtudiantDAO.update(etudiant);

        List<Groupe> groupes = GroupeDAO.getAll();

        // Ajouter l'étudiant à la requête pour affichage
        request.setAttribute("etudiant", etudiant);
        request.setAttribute("modifie", modifie);
        request.setAttribute("groupes", groupes);
        //
        request.setAttribute("content",urlFicheEtudiant);
        loadJSP(urlLayout,request,response);

    }
    private void doDeleteEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEtudiant = Integer.valueOf(request.getParameter("id"));
        EtudiantDAO.remove(idEtudiant);
        doEtudiants(request,response);
    }
    ////////////// Méthode pour les modules////////////////

    //méthode d'affichage de tous les modules
    private void doModules(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // je récupère tous les groupes car je vais afficher les modules de chaque groupe, à la suite.
        // et puisque je peux récuperer les modules de chaque groupe(avec groupe.getModules(), je peux les afficher par la suite
        List<Module> modules = ModuleDAO.getAll();

        request.setAttribute("modules", modules);

        //
        request.setAttribute("content",urlModules);
        loadJSP(urlLayout,request,response);
    }
    // méthode détail d'un module
    private void doFicheModule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idModule = Integer.valueOf(request.getParameter("id"));
        boolean modifie = Boolean.valueOf(request.getParameter("modifie"));

        Module module = ModuleDAO.retrieveById(idModule);
        List<Groupe> groupes = GroupeDAO.getAll();
        request.setAttribute("module", module);
        request.setAttribute("groupes", groupes);
        request.setAttribute("modifie",modifie);
        //
        request.setAttribute("content",urlFicheModule);
        loadJSP(urlLayout,request,response);

    }


    //méthode pour supprimer un module
    private void doDeleteModule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idModule = Integer.valueOf(request.getParameter("id"));
        Module module = ModuleDAO.retrieveById(idModule);

        ModuleDAO.remove(module);

        doModules(request,response);
    }

    private void doAjoutModule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String libelle = String.valueOf(request.getParameter("libellemodule"));
        Groupe groupe = GroupeDAO.retrieveById(Integer.valueOf(request.getParameter("idGroupe")));
        List<Module> modules = ModuleDAO.getAll();

        boolean contient = false;

        for(Module module : modules){
            if(module.getLibelle().equalsIgnoreCase(libelle)){
                contient = true;
            }
        }

        if(contient){
            doModules(request,response);
        }else{
            ModuleDAO.create(libelle,groupe);
            doModules(request,response);
        }


    }
    private void doModifModule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String libelle = String.valueOf(request.getParameter("libelle"));
        Groupe groupe = GroupeDAO.retrieveById(Integer.valueOf(request.getParameter("idGroupe")));
        // Récupérer l'id de l'étudiant
        int idModule= Integer.valueOf(request.getParameter("id"));
        // Récupérer le module
        Module module = ModuleDAO.retrieveById(idModule);

        // si le module change de groupe toutes ses notes seront supprimées
        if(!module.getGroupe().getNom().equalsIgnoreCase(groupe.getNom())){
            NoteDAO.removeNoteModule(module);
        }
        module.setGroupe(groupe);
        module.setLibelle(libelle);
        ModuleDAO.update(module);
        doModules(request,response);
    }
///////////////:Methode pour note///////////////
    //méthode d'ajout d'une note
    private void doAjoutNote(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEtudiant = Integer.valueOf(request.getParameter("id"));
        boolean ajout = Boolean.valueOf(request.getParameter("ajout"));
        int idModule = 0;
        float val = 0;
        Module module;
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);
        // si ajout == vrai, cela signifie que la personne à ajouter une note
        // si ajout == faux, cela signifie que la personne veut accéder à l'interface d'ajout une note
        if(ajout){
            val = Float.valueOf(request.getParameter("valeur"));
            idModule = Integer.valueOf(request.getParameter("idModule"));
            module = ModuleDAO.retrieveById(idModule);
            NoteDAO.create(val,etudiant,module);
            doFicheEtudiant(request,response);
        }else{
            request.setAttribute("etudiant",etudiant);
            request.setAttribute("content",urlAjoutNote);
            loadJSP(urlLayout,request,response);
        }


    }
    ////////////////Méthode pour les absences/////////////////

    //méthode pour consulté les absences
    private void doConsultationAbsence(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Etudiant> etudiants = EtudiantDAO.getAll();

        request.setAttribute("etudiants",etudiants);

        request.setAttribute("content",urlAbsences);
        loadJSP(urlLayout,request,response);
    }
    // méthode d'ajout d'absence,
    private void doAjoutAbsences(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEtudiant = Integer.valueOf(request.getParameter("idEtudiant"));
        String descAbsences = String.valueOf(request.getParameter("description"));
        Date date = Date.valueOf(request.getParameter("date"));

        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

        AbsencesDAO.create(descAbsences,etudiant,date);

        doConsultationAbsence(request,response);
    }

    // cette méthode sert à avoir les détails d'une absences
    private void doDetailAbsence(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEtudiant = Integer.valueOf(request.getParameter("id"));
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);
        List<Absences> absencesDetails = AbsencesDAO.getAbsenceEtudiant(etudiant);

        request.setAttribute("absences",absencesDetails);
        request.setAttribute("etudiant",etudiant);

        request.setAttribute("content",urlDetailsAbsences);
        loadJSP(urlLayout,request,response);
    }

    private void doDeleteAbsence(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idAbsence = Integer.valueOf(request.getParameter("id"));
        Absences absence = AbsencesDAO.retrieveById(idAbsence);
        AbsencesDAO.remove(absence);
        doConsultationAbsence(request,response);
    }
    /**
     * Charge la JSP indiquée en paramètre
     *
     * @param url
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void loadJSP(String url, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // L'interface RequestDispatcher permet de transférer le contrôle à une
        // autre servlet
        // Deux méthodes possibles :
        // - forward() : donne le contrôle à une autre servlet. Annule le flux
        // de sortie de la servlet courante
        // - include() : inclus dynamiquement une autre servlet
        // + le contrôle est donné à une autre servlet puis revient à la servlet
        // courante (sorte d'appel de fonction).
        // + Le flux de sortie n'est pas supprimé et les deux se cumulent

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }

}

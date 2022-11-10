<%@ page import="fr.iut2.ProjetJPA.data.Groupe" %>
<%@ page import="fr.iut2.ProjetJPA.data.Module" %>
<%@ page import="fr.iut2.ProjetJPA.data.Note" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<jsp:useBean id="etudiant" class="fr.iut2.ProjetJPA.data.Etudiant" scope="request"/>
<jsp:useBean id="modifie" type = "java.lang.Boolean" scope ="request"/>
<jsp:useBean id="groupes" type="java.util.List<fr.iut2.ProjetJPA.data.Groupe>" scope="request"/>

<div class="card" style="align-items: center; margin-top: 10px">

    <div class="card-header">Fiche individuelle <small></small></div>
    <div class="card-body">

        <h3 style ="padding : 10px; border: 2px solid grey; color: #575757; text-align: center"> <%=etudiant.getPrenom()%> <%=etudiant.getNom()%>
        </h3>
        <% if(!modifie){ %>
            <div class="ficheEtudiant">
                <ul class="list-group">
                    <li class="list-group-item">Groupe : <%=etudiant.getGroupe().getNom()%></li>
                    <li class="list-group-item">Nombre d'absence : <% if(etudiant.getAbsences().size() < 8){%>
                        <span class="badge badge-primary badge-pill"><%=etudiant.getAbsences().size()%></span><%}else{%><span class="badge badge-danger badge-pill"><%=etudiant.getAbsences().size()%></span><%}%>
                    </li>
                    <li class="list-group-item">Moyenne Générale : <% float val=0.0F;for(Note note : etudiant.getNote()){val+=note.getValeur();}val=val/etudiant.getNote().size(); %>
                    <%if((val >= 0.0F)  && (val < 10.0F)){%>
                        <a href="#" class="badge badge-danger"><%=val%></a></li>
                    <%}else if(val >= 10.0F && val < 13.0F){%>
                       <a href="#" class="badge badge-warning"><%=val%></a></li>
                    <%}else if(val >= 13.0F && val <= 20.0F){%>
                        <a href="#" class="badge badge-success"><%=val%></a></li>
                    <%}else{%>
                        <a href="#" class="badge badge-secondary"><%=val%></a></li>
                    <%};%>
                </ul>

                <table class="table  table-bordered" style="margin-top: 20px">

                    <thead class="thead-light">
                        <tr>
                            <th colspan="2" style="text-align: center">Liste des Modules/Notes </th>
                        </tr>
                    </thead>
                    <tr class="">
                        <th scope="col">Libelle</th>
                        <th scope="col">Note</th>
                    </tr>

                    <tbody>

                    <% for (Module module : etudiant.getGroupe().getModules()) {%>

                    <tr>
                        <td><%=module.getLibelle()%></td>

                        <% for (Note note : module.getNote()) {
                            if(note.getEtudiant().getId() == etudiant.getId()){%>
                                <td><%=note.getValeur()%></td>
                            <%}%>
                        <% } %>

                    </tr>
                    <% } %>
                    </tbody>

                </table>
                <a class="btn btn-outline-primary col-sm-12" href="<%= application.getContextPath()%>/do/ajoutnote?id=<%=etudiant.getId()%>&ajout=false">Ajouter/Modifier une note</a>


            </div>

        <% }else{ %>

            <div class="ficheEtudiant" style="">

                <div class="card" style="padding: 20px">

                    <form method="post" action="<%= application.getContextPath()%>/do/modifieEtudiant?id=<%=etudiant.getId()%>&modifie = false" >
                        <fieldset>
                            <legend>Ajouté un nouvel étudiant</legend>

                            <div class="form-group">
                                <label for="nom"> Nom </label>
                                <input type="text" class="form-control" name="nom" id="nom"  style="border: 1px solid grey" value="<%=etudiant.getNom()%>" required/>
                            </div>

                            <div class="form-group">
                                <label> Prénom </label>
                                <input type="text" class="form-control"  name="prenom" id="prenom" style="border: 1px solid grey" value="<%=etudiant.getPrenom()%>" required/>
                            </div>
                            <div class="form-group">
                                <label for="selection">Groupe</label>
                                <select id="selection" name="idGroupe"  class="form-control">
                                    <option value="<%=etudiant.getGroupe().getId()%>"><%=etudiant.getGroupe().getNom()%></option>
                                    <% for (Groupe groupe : groupes) {
                                        if(!groupe.getNom().equals(etudiant.getGroupe().getNom())){%>
                                            <option value="<%=groupe.getId()%>"><%=groupe.getNom()%></option>
                                        <% } %>
                                    <% } %>
                                </select>
                            </div>
                        </fieldset>
                        <input id="btn" type="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Modifier" style="margin: auto"/>
                    </form>
                </div>
            </div>
        <div class="alert alert-danger" role="alert" style="margin-top: 10px">
            Si vous changez le groupe de l'étudiant toutes ses notes de l'ancien groupe seront supprimées
        </div>
        <% } %>

    </div>
</div>

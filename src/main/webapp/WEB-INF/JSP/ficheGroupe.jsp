<%@ page import="fr.iut2.ProjetJPA.data.Module" %>
<%@ page import="fr.iut2.ProjetJPA.data.Note" %>
<%@ page import="fr.iut2.ProjetJPA.data.Etudiant" %><%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 23/02/2022
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="etudiants" type="java.util.List<fr.iut2.ProjetJPA.data.Etudiant>" scope="request"/>
<jsp:useBean id="modifie" type = "java.lang.Boolean" scope ="request"/>
<jsp:useBean id="groupe" class="fr.iut2.ProjetJPA.data.Groupe" scope="request"/>

<div class="col-9" style="align-items: center; margin: auto">

    <div class="card-body">

        <h3 style ="padding : 5px; border: 2px solid grey; color: #575757;text-align: center;margin: auto; margin-top: 10px;margin-bottom: 10px"> <%=groupe.getNom()%> <% float moyenne =0.0F; float nbNote = 0.0F;
        for(Module module : groupe.getModules()){
            nbNote += module.getNote().size();
            for(Note note : module.getNote()){
                moyenne += note.getValeur();
            };

        };moyenne = moyenne/nbNote;%>
        </h3>
        <%if(moyenne >= 0.0F && moyenne <= 9.0F){%>
            <h4 style="text-align: center"><small>Moyenne de ce groupe : </small><a href="#" class="badge badge-danger"><%=moyenne%></a></h4>
        <%}else if(moyenne >= 10.0F && moyenne <= 13.0F){%>
            <h4 style="text-align: center"><small>Moyenne de ce groupe : </small><a href="#" class="badge badge-warning"><%=moyenne%></a></h4>
        <%}else if(moyenne > 13.0F && moyenne <= 20.0F){%>
            <h4 style="text-align: center"><small>Moyenne de ce groupe : </small><a href="#" class="badge badge-success"><%=moyenne%></a></h4>
        <%}else{%>
            <h4 style="text-align: center"><small>Moyenne de ce groupe : </small><a href="#" class="badge badge-secondary"><%=moyenne%></a></h4>
        <%};%>
        <% if(!modifie){ %>
        <div class="ficheGroupe" >
            <table class="table  table-bordered ">
                <thead class="thead-light">
                    <tr>
                        <th colspan="2" style="text-align: center">Liste des  <%=groupe.getEtudiants().size()%> étudiant(s)</th>
                    </tr>
                </thead>
                <tr class="">
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                </tr>
                <tbody>

                <% for (Etudiant etudiant : etudiants) {%>
                    <tr>
                        <td><%=etudiant.getNom()%></td>
                        <td><%=etudiant.getPrenom()%></td>
                    </tr>
                <% } %>
                </tbody>
            </table>

            <table class="table">

                <thead class="thead-light">
                <tr>
                    <th colspan="3" style="text-align: center">Liste des <%=groupe.getModules().size()%> module(s) </th>
                </tr>

                </thead>
                <thead>
                    <th>Libelle</th>
                    <th>Moyenne</th>
                </thead>
                <tbody>

                <% for (Module module : groupe.getModules()) {%>
                <tr style="border-collapse:collapse;">
                    <td scope="row"><a class="badge badge-info" href="<%= application.getContextPath()%>/do/fichemodule?id=<%=module.getId()%>&modifie=false"><%=module.getLibelle()%></a></td>
                    <% float moyMod = 0.0F; for(Note note : module.getNote()){ moyMod += note.getValeur();} moyMod = moyMod/Float.valueOf(module.getNote().size());%>
                    <%if(moyMod >= 0.0F && moyMod<= 9.0F){%>
                        <td><span class="badge badge-danger"><%=moyMod%></span></td>
                    <%}else if(moyMod >= 10.0F && moyMod < 13.0F){%>
                        <td><span class="badge badge-warning"><%=moyMod%></span></td>
                    <%}else if(moyMod  >= 13.0F && moyMod <= 20.0F){%>
                        <td><span class="badge badge-success"><%=moyMod%></span></td>
                    <%}else{%>
                        <td><span class="badge badge-secondary"><%=moyMod%></span></td>
                    <%};%>
                        <td><button class="close"> <a href="<%= application.getContextPath()%>/do/deletemodulegroupe?idmodule=<%=module.getId()%>&idgroupe=<%=groupe.getId()%>">&times;</a></button></td>

                </tr>

                <% } %>
                </tbody>
            </table>
        </div>
        <% }else{ %>
        <div class="ficheEtudiant" style="">
            <div class="card" style="padding: 20px">
                <form method="post" action="<%= application.getContextPath()%>/do/modifieGroupe?id=<%=groupe.getId()%>&modifie = false  " >

                    <div class="form-group">
                        <label for="Libelle"> Libelle </label>
                        <input type="text" class="form-control" name="libelle" id="libelle"  style="border: 1px solid grey" value="<%=groupe.getNom()%>" required/>
                    </div>
                    <input id="btn" type="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Modifier" style="margin: auto"/>

                </form>
            </div>
        </div>
        <% } %>
    </div>
</div>


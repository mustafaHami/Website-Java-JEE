<%@ page import="fr.iut2.ProjetJPA.data.Module" %>
<%@ page import="fr.iut2.ProjetJPA.data.Groupe" %>
<%@ page import="fr.iut2.ProjetJPA.data.Note" %>
<%@ page import="fr.iut2.ProjetJPA.data.Etudiant" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Mod" %><%--
<%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 27/02/2022
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="module" class="fr.iut2.ProjetJPA.data.Module" scope="request"/>
<jsp:useBean id="groupes" type="java.util.List<fr.iut2.ProjetJPA.data.Groupe>" scope="request"/>
<jsp:useBean id="modifie" type = "java.lang.Boolean" scope ="request"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-9" style="align-items: center; margin: auto">

    <div class="card-body">

        <h3 style ="padding : 5px; border: 2px solid grey; color: #575757;text-align: center;margin: auto; margin-top: 10px;margin-bottom: 10px"> <strong><%=module.getLibelle()%></strong> <small>Groupe : <%=module.getGroupe().getNom()%></small> <% float moyenne =0.0F;
                for(Note note : module.getNote()){
                    moyenne += note.getValeur();
                };
                moyenne = moyenne/module.getNote().size();
                %>
        </h3>
            <%if(moyenne >= 0.0F && moyenne <= 9.0F){%>
        <h4 style="text-align: center"><small>Moyenne de ce Module : </small><a href="#" class="badge badge-danger"><%=moyenne%></a></h4>
            <%}else if(moyenne >= 10.0F && moyenne < 13.0F){%>
        <h4 style="text-align: center"><small>Moyenne de ce Module : </small><a href="#" class="badge badge-warning"><%=moyenne%></a></h4>
            <%}else if(moyenne >= 13.0F && moyenne <= 20.0F){%>
        <h4 style="text-align: center"><small>Moyenne de ce Module : </small><a href="#" class="badge badge-success"><%=moyenne%></a></h4>
            <%}else{%>
        <h4 style="text-align: center"><small>Moyenne de ce Module : </small><a href="#" class="badge badge-secondary"><%=moyenne%></a></h4>
            <%};%>
        <%if(!modifie){%>
        <ul class="list-group">
                <%
                // je parcours toutes les notes de ce modules et
                    // grâce à la note je pourrais récupérer les étudiants
                for(Note note : module.getNote()){%>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <%if(note.getValeur() >= 0.0F && note.getValeur() <= 9.0F){%>
                        <a href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=note.getEtudiant().getId()%>&modifie=false"><span class="badge badge-primary"><%=note.getEtudiant().getNom()%> <%=note.getEtudiant().getPrenom()%></span></a><span class="badge badge-danger badge-pill"><%=note.getValeur()%></span>
                        <%}else if(note.getValeur() >= 10.0F && note.getValeur() < 13.0F){%>
                        <a href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=note.getEtudiant().getId()%>&modifie=false"><span class="badge badge-primary"><%=note.getEtudiant().getNom()%> <%=note.getEtudiant().getPrenom()%></span></a><span class="badge badge-warning badge-pill"><%=note.getValeur()%></span>
                        <%}else if(note.getValeur()  >= 13.0F && note.getValeur() <= 20.0F){%>
                            <a href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=note.getEtudiant().getId()%>&modifie=false"><span class="badge badge-primary"><%=note.getEtudiant().getNom()%> <%=note.getEtudiant().getPrenom()%></span></a> <span class="badge badge-success badge-pill"><%=note.getValeur()%></span>
                        <%}else{%>
                            <%=note.getEtudiant().getNom()%> <%=note.getEtudiant().getPrenom()%> <span class="badge badge-secondary badge-pill"><%=note.getValeur()%></span>
                        <%};%>
                    </li>
               <% };%>

        </ul>
        <% }else{%>
            <div>
                <div class="card" style="padding: 20px">
                    <form method="post" action="<%= application.getContextPath()%>/do/modifiemodule?id=<%=module.getId()%>&modifie =false" >

                        <div class="form-group">
                            <label for="Libelle"> Libelle </label>
                            <input type="text" class="form-control" name="libelle" id="libelle"  style="border: 1px solid grey" value="<%=module.getLibelle()%>" required/>
                        </div>
                        <div class="form-group">
                            <label for="selection">Groupe</label>
                            <select id="selection" name="idGroupe"  class="form-control">
                                <option value="<%=module.getGroupe().getId()%>"><%=module.getGroupe().getNom()%></option>
                                <% for (Groupe groupe : groupes) {
                                    if(!groupe.getNom().equals(module.getGroupe().getNom())){%>
                                        <option value="<%=groupe.getId()%>"><%=groupe.getNom()%></option>
                                    <% } %>
                                <% } %>
                            </select>
                        </div>
                        <input id="btn" type="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Modifier" style="margin: auto"/>

                    </form>
                    <div class="alert alert-danger" role="alert" style="margin-top: 10px">
                        Si vous changer le groupe du module toutes ses notes de l'ancien groupe seront supprimées
                    </div>
                </div>
            </div>
        <% };%>
    </div>
</div>

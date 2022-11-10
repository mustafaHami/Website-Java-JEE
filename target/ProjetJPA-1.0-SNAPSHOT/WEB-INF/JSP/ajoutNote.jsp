<%@ page import="fr.iut2.ProjetJPA.data.Etudiant" %>
<%@ page import="fr.iut2.ProjetJPA.data.Module" %><%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 27/02/2022
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="etudiant" class="fr.iut2.ProjetJPA.data.Etudiant" scope="request"/>
<div class="card" style="padding: 20px">

    <form method="post" action="<%= application.getContextPath()%>/do/ajoutnote?id=<%=etudiant.getId()%>&ajout=true&modifie=false">
        <fieldset>
            <legend>Ajouter une note pour un étudiant à un module</legend>
            <div class="form-group">
                <label for="nom"> Nom </label>
                <span class="badge badge-light" id="nom" ><%=etudiant.getNom()%></span>
            </div>
            <div class="form-group">
                <label for="selection">Groupe</label>
                <select id="selection" name="idModule" class="form-control">
                    <% for (Module module : etudiant.getGroupe().getModules()){%>
                        <option value="<%=module.getId()%>"><%=module.getLibelle()%></option>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                <label> Valeur
                    <input  type="number" step="any" class="form-control" name="valeur" id="valeur" style="border: 1px solid grey" value="" required/>
                </label>
            </div>

        </fieldset>
        <input id="btn" type="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Ajouter" style="margin: auto"/>
    </form>
</div>
</div>
<%@ page import="fr.iut2.ProjetJPA.data.Etudiant" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 28/02/2022
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="etudiants" type="java.util.List<fr.iut2.ProjetJPA.data.Etudiant>" scope="request"/>
<div class="row">
    <div class="card col-sm-6" style="margin: 10px">
        <div class="card-body ">
            <!-- tableau d'étudiants  -->
            <table class="table">

                <thead class="">
                    <tr>
                        <th class="col"></th>
                        <th class="col"></th>
                        <th class="col"></th>
                    <tr>
                </thead>
                <tbody>
                    <%for(Etudiant etudiantabs : etudiants){

                        if(!(etudiantabs.getAbsences().size() >= 8)){%>
                        <tr scope="row">
                            <td>
                                <a class="badge badge-primary" href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=etudiantabs.getId()%>&modifie=false" >
                                    <%=etudiantabs.getPrenom()%> <%=etudiantabs.getNom()%>
                                </a>
                            </td>
                            <td>
                                <span class="badge badge-primary badge-pill"><%=etudiantabs.getAbsences().size()%></span>
                            </td>
                            <td>
                                <a class="badge badge-secondary" href="<%= application.getContextPath()%>/do/detailabsence?id=<%=etudiantabs.getId()%>" >
                                   Details
                                </a>
                            </td>
                        </tr>
                    <%}else{%>
                    <tr scope="row">
                        <td>
                            <a class="badge badge-danger" href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=etudiantabs.getId()%>&modifie=false" >
                                <%=etudiantabs.getPrenom()%> <%=etudiantabs.getNom()%>
                            </a>
                        </td>
                        <td>
                            <span class="badge badge-danger badge-pill"><%=etudiantabs.getAbsences().size()%></span>
                        </td>
                        <td>
                            <a class="badge badge-secondary" href="<%= application.getContextPath()%>/do/detailabsence?id=<%=etudiantabs.getId()%>" >
                                Detail
                            </a>
                        </td>
                    </tr>
                    <%};%>
                    <%};%>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card col-sm-4" style="margin: 10px;padding: 10px">
        <div class="card-body " style="margin: auto;align-items: center">
        <form method="post" action="<%= application.getContextPath()%>/do/ajoutAbsence" >
            <fieldset>
                <legend>Ajout d'une absences</legend>

                <div class="form-group">
                    <label for="selection">Groupe</label>
                    <select id="selection" name="idEtudiant"  class="form-control">
                        <% for (Etudiant etudiant : etudiants) {%>
                            <option value="<%=etudiant.getId()%>"><%=etudiant.getNom()%> <%=etudiant.getPrenom()%></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="date">Example textarea</label>
                    <input type="date" id="date" name="date" value = "" required>
                </div>
                <div class="form-group">
                    <label for="description">Example textarea</label>
                    <input type="text" class="form-control" name="description" id="description"  style="border: 1px solid grey" value="" required/>

                </div>

            </fieldset>
            <input id="btn" type="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Ajouter" style="margin: auto" />
        </form>
    </div>
    </div>
</div>
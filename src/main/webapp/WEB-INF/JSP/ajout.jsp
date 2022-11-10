<%@ page import="fr.iut2.ProjetJPA.data.Groupe" %><%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 24/02/2022
  Time: 00:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="groupes" type="java.util.List<fr.iut2.ProjetJPA.data.Groupe>" scope="request"/>
<div style="margin: 20px">
    <div class="row">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ajouter un groupe</h5>
                    <form action="<%= application.getContextPath()%>/do/ajoutgroupe" >
                        <div class="form-group">
                            <label for="Libelle"> Libelle </label>
                            <input type="text" class="form-control" name="libelle" id="libelle"  style="border: 1px solid grey" placeholder="Libelle" required/>
                        </div>
                        <input type ="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Ajouter un groupe" style="margin: auto"/>

                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ajouter un Module</h5>
                    <form action="<%= application.getContextPath()%>/do/ajoutmodule" >
                        <div class="form-group">
                            <label for="Libelle"> Libelle </label>
                            <input type="text" class="form-control" name="libellemodule" id="libellemodule"  style="border: 1px solid grey" placeholder="Libelle" required/>
                        </div>
                        <div class="form-group">
                            <label for="selection">Groupe</label>
                            <select id="selectionmodule" name="idGroupe"  class="form-control">
                                <% for (Groupe groupe : groupes) {%>
                                    <option value="<%=groupe.getId()%>"><%=groupe.getNom()%></option>
                                <% } %>
                            </select>
                        </div>
                        <input type ="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Ajouter un module" style="margin: auto"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ajouter un nouvel étudiant</h5>

                    <form action="<%= application.getContextPath()%>/do/ajoutetudiant" >

                        <div class="form-group">
                            <label for="nom"> Nom </label>
                            <input type="text" class="form-control" name="nom" id="nom"  placeholder="Nom" style="border: 1px solid grey" required/>
                        </div>
                        <div class="form-group">
                            <label> Prénom </label>
                            <input type="text" class="form-control"  name="prenom" id="prenom" style="border: 1px solid grey" placeholder="Prénom" required/>
                        </div>
                        <div class="form-group">
                            <label for="selection">Groupe</label>
                            <select id="selection" name="idGroupe"  class="form-control">
                                <% for (Groupe groupe : groupes) {%>
                                <option value="<%=groupe.getId()%>"><%=groupe.getNom()%></option>
                                <% } %>
                            </select>
                        </div>
                        <input type="submit"  class="btn btn-outline-primary btn-lg btn-block" value = "Ajouter un étudiant" style="margin: auto"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@page import="fr.iut2.ProjetJPA.data.Etudiant" %>
<%@page import="java.util.List" %>
<%@ page import="fr.iut2.ProjetJPA.data.Groupe" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<jsp:useBean id="etudiants" type="java.util.List<fr.iut2.ProjetJPA.data.Etudiant>" scope="request"/>
<jsp:useBean id="groupes" type="java.util.List<fr.iut2.ProjetJPA.data.Groupe>" scope="request"/>

<div class="card" style="padding: 10px; ">

    <div class="card-header" style="text-align: center" > <h3 style ="padding : 5px; border: 2px solid grey;border-radius: 5px; color: #575757;text-align: center;width: 40%;margin: auto; margin-top: 10px;margin-bottom: 10px"> Liste des étudiants </h3></div>

        <!-- tableau d'étudiants  -->
        <table class="table table-striped">

            <thead class="table-primary">
                <tr>
                    <th>Prénom/nom de l'étudiant</th>
                    <th >Son groupe</th>
                    <th></th>
                    <th></th>
                <tr>
            </thead>
            <tbody>
                <% for (Etudiant etudiant : etudiants) {%>
                <tr scope="row">
                    <td>
                       <h5>
                           <a class="badge badge-primary" href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=etudiant.getId()%>&modifie=false" >
                                <%=etudiant.getPrenom()%> <%=etudiant.getNom()%>
                            </a>
                       </h5>
                    </td>
                    <td >
                        <h6>
                            <a class="badge badge-info" href="<%= application.getContextPath()%>/do/fichegroupe?id=<%=etudiant.getGroupe().getId()%>&modifie=false" >
                                <%=etudiant.getGroupe().getNom()%>
                            </a>
                        </h6>
                    </td>

                    <td align="center">
                        <a href="<%= application.getContextPath()%>/do/ficheetudiant?id=<%=etudiant.getId()%>&modifie=true"><img  src="<%=request.getContextPath()%>/ressources/crayon.png" /></a></button>
                    </td>
                    <td style="margin-right: 200px">
                        <button class="badge badge-pill badge-danger"> <a style="color: white;" href="<%= application.getContextPath()%>/do/deleteetudiant?id=<%=etudiant.getId()%>">&times</a></button>
                    </td>
                </tr>

                <%}%>



            </tbody>
        </table>
</div>
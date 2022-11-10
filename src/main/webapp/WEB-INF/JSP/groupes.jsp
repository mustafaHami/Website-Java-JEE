<%@page import="fr.iut2.ProjetJPA.data.Groupe" %>
<%@page import="fr.iut2.ProjetJPA.data.Module" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<!-- jQuery and JS bundle w/ Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="groupes" type="java.util.List<fr.iut2.ProjetJPA.data.Groupe>" scope="request"/>
<jsp:useBean id="modules" type="java.util.List<fr.iut2.ProjetJPA.data.Module>" scope="request"/>



<div class="card" style="padding: 10px; ">

    <div class="card-header" style="text-align: center" > <h4 style ="padding : 5px; border: 2px solid grey;border-radius: 5px; color: #575757;text-align: center;width: 40%;margin: auto; margin-top: 10px;margin-bottom: 10px">Liste des groupes présents en BD</h4></div>
    <!-- tableau de groupes  -->
    <table class="table table-striped ">
        <thead class="table-secondary">
            <tr>
                <th>Nom du groupe</th>
                <th>Nombre d'étudiants</th>
                <th>Nombre de module</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>

            <% for (Groupe groupe : groupes) {%>

            <tr scope="row">
                <td>
                    <h5>
                        <a class="badge badge-secondary" href="<%= application.getContextPath()%>/do/fichegroupe?id=<%=groupe.getId()%>&modifie=false" >
                            <%=groupe.getNom()%>
                        </a>
                    </h5>
                </td>
                <td><%=groupe.getEtudiants().size()%>
                </td>
                <td><%=groupe.getModules().size()%>
                 </td>

                <td>
                    <a href="<%= application.getContextPath()%>/do/fichegroupe?id=<%=groupe.getId()%>&modifie=true" >
                        <img  src="<%=request.getContextPath()%>/ressources/crayon.png" />
                    </a>
                </td>

                <td><button class="badge badge-pill badge-danger"> <a style="color: white;" href="<%= application.getContextPath()%>/do/deletegroupe?id=<%=groupe.getId()%>">&times;</a></button></td>

            </tr>
            <%}%>
        </tbody>
    </table>
</div>
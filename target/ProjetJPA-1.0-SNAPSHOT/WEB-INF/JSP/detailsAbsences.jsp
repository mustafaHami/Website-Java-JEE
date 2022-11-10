<%@ page import="fr.iut2.ProjetJPA.data.Absences" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 28/02/2022
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="absences" type="java.util.List<fr.iut2.ProjetJPA.data.Absences>" scope="request"/>
<jsp:useBean id="etudiant" class="fr.iut2.ProjetJPA.data.Etudiant" scope="request"/>
<h5 style ="padding : 5px; border: 1px solid grey; color: #818181;text-align: center;margin: auto; margin-top: 10px;margin-bottom: 10px">Détail des Absences de l'étudiant <strong style="color: #4d4d4d"><%=etudiant.getNom()%> <%=etudiant.getPrenom()%></<strong> </h5>
<div class="row">

    <div class="card-body">
        <%for(Absences absence : absences){%>
            <%String pattern = "dd-MM-yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

                String date = simpleDateFormat.format(absence.getDateAbsence());%>
            <div class="col-sm-4" style="margin: 10px;margin: auto">
                <a href="<%= application.getContextPath()%>/do/deleteabsence?id=<%=absence.getId()%>" style="position: absolute;right: 20px;top: 2px;z-index: 999;cursor:pointer;">❌</a>
                <ul class="list-group">
                    <li class="list-group-item">Date : <%=date%></li>
                    <li class="list-group-item">Description : <%=absence.getDescription()%></li>
                </ul>
            </div>
        <%}%>
        <%if(absences.size() == 0){%>
            <h1 class=" badge-success badge-pill" style="text-align: center;margin: auto">Aucune absence </h1>
        <%};%>
    </div>
</div>
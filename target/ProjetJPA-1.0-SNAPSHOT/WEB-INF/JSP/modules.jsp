<%@ page import="fr.iut2.ProjetJPA.data.Groupe" %>
<%@ page import="fr.iut2.ProjetJPA.data.Module" %><%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 27/02/2022
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="modules" type="java.util.List<fr.iut2.ProjetJPA.data.Module>" scope="request"/>

    <div class="card" style="padding: 10px; ">

        <div class="card-header" style="text-align: center" > <h4 style ="padding : 5px; border: 2px solid grey;border-radius: 5px; color: #575757;text-align: center;width: 40%;margin: auto; margin-top: 10px;margin-bottom: 10px">Affichage de tous les modules</h4></div>
        <!-- tableau de groupes  -->
        <table class="table table-striped ">

            <thead class="table-info">
                <tr>
                    <th>Libelle</th>
                    <th>Groupe</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>

            <% for(Module module : modules){%>
                <tr scope="row">
                        <td>
                            <h5>
                                <a class="badge badge-info" href="<%= application.getContextPath()%>/do/fichemodule?id=<%=module.getId()%>&modifie=false">
                                    <%=module.getLibelle()%>
                                </a>
                            </h5>
                        </td>
                        <td>
                            <h6>
                                <a class="badge badge-primary" href="<%= application.getContextPath()%>/do/fichegroupe?id=<%if(module.getGroupe() != null){%><%=module.getGroupe().getId()%><%}%>&modifie=false">
                                    <%if(module.getGroupe() != null){%><%=module.getGroupe().getNom()%><%}%>
                                </a>
                            </h6>
                        </td>
                        <td>
                            <a href="<%= application.getContextPath()%>/do/fichemodule?id=<%=module.getId()%>&modifie=true" >
                                <img  src="<%=request.getContextPath()%>/ressources/crayon.png" />
                            </a>
                        </td>

                        <td><button class="badge badge-pill badge-danger"> <a style="color: white;" href="<%= application.getContextPath()%>/do/deletemodule?id=<%=module.getId()%>">&times;</a></button></td>

                </tr>
            <%}%>

            </tbody>
        </table>
    </div>
</div>
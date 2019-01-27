<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.objectif.onu.insarag_webapp.model.Alerte" %>
<%@ page import="java.util.List" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insarag WEBAPP</title>
</head>

<jsp:include page="../utils/header.jsp" />
<body>
	<div class="jumbotron main">
		<h3 class="display-5">Bienvenue sur la page de réponse aux alertes !</h3>
			<p class="lead">
				Vous pouvez sélectionner les alertes suivantes et y répondre positivement afin de confirmer votre participation.
			</p>
			
		    <% List<Alerte> list = (List<Alerte>)request.getAttribute("list_of_alerts"); 
		    	int counter = 0;
		    	if (list.size() != 0) { %>
			<table class="table table-striped custab">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Entete</th>
		            <th>Date de début</th>
		            <th>Date de fin</th>
		            <th>Pays</th>
		            <th>Ville</th>
		            <th class="text-center">Action</th>
		        </tr>
		    </thead>
		    <%		for (Alerte a : list) {
		    %>
		    	<tr>
		    		<td><%= ++counter %></td>
		    		<td><%= a.getEntete() %></td>
		    		<td><%= a.getDateDebut().toGMTString() %></td>
		    		<td><%= a.getDateFin().toGMTString() %></td>
		    		<td><%= a.getPays() %></td>
		    		<td><%= a.getVille() %></td>
		    		<td class="text-center">
		    			<a class='btn btn-success btn-xs' href="/alert/subscribe_to_alert?id=<%=a.getIdalerte()%>">
		    				<span class="glyphicon glyphicon-check"></span>S'inscrire !</a> 
		    			<a class="btn btn-info btn-xs" data-toggle="modal" data-target="#modalId<%=counter%>" style="color: white;">
		    				<span class="glyphicon glyphicon-edit"></span> Détails</a>
		    		</td>
		    		
		    	</tr>
		    	<% } %>
		            <!-- <tr>
		                <td>1</td>
		                <td>News</td>
		                <td>News Cate</td>
		                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr>
		            <tr>
		                <td>2</td>
		                <td>Products</td>
		                <td>Main Products</td>
		                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr>
		            <tr>
		                <td>3</td>
		                <td>Blogs</td>
		                <td>Parent Blogs</td>
		                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr> -->
		    </table>
<% 	   		counter = 0;
			for (Alerte a : list) {
				counter++;
				%> 
		    	<div class="modal fade" id="modalId<%=counter%>" tabindex="-1" role="dialog" aria-labelledby="modalLabelId<%=counter %>" aria-hidden="true">
		    		<div class="modal-dialog" role="document">
		    		<div class="modal-content">
		    			<div class="modal-header">
		    				<h5 class="modal-title" id="modalLabelId<%=counter%>"> Détails </h5>
		    				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
          					</button>
		    			</div>
		    			<div class="modal-body">
		    				<%= a.getInfosSupp() %>
		    			</div>
		    			 <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					     </div>
		    		</div>
				</div>
		    </div>
		    	<%
			}
		    	} else { 
			    	%>
		    	<div><p class="lead">Pas d'alerte disponible, revenez plus tard..</p></div>
	<% } %>	
	</div>
</body>

<jsp:include page="../utils/footer.jsp" />
</html>
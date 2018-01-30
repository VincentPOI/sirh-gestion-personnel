<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SGP - Index</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-4.0.0-
dist/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body class="ui container">

	<ul class="nav nav-tabs">
		<span class="border-bottom"></span>
		<li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/collaborateurs/lister">Collabrateurs</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="statistique.html">Statistique</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="activites.html">Activités</a>
		</li>
	</ul>
	<div class="row ">
		<div class="col-sm-12">
			<a href="<%=request.getContextPath()%>/collaborateurs/creer" class="btn btn-primary float-right">Ajouter
				un nouveau collaborteur</a>
		</div>
	</div>
	<h1 class="ui header center aligned">Les collaborateurs</h1>
	<div class="ui divider">
		<form>
			<div class="form-group row ">
				<label for="search" class="col-md-auto col-form-label">Rechercher
					un nom ou un prénom qui commence par : </label>
				<div class="col-md-auto">
					<input type="text" class="form-control" id="search">
				</div>
				<div class="col-md-auto">
					<button type="submit" class="btn btn-primary">Rechercher</button>
				</div>
				<div class="col-md-auto">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="collabDesactive" disabled> <label
							class="form-check-label" for="collabDesactive">Voir les
							collaborateurs désactivés</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="dpt" class="col-4 col-form-label">Filtrer par
					département : </label>
				<div class="col-4 ">
					<select class="form-control" id="dpt">
						<option selected='true'>Tous</option>
						<option>Comptabilité</option>
						<option>Ressources Humaines</option>
						<option>Informatique</option>
					</select>
				</div>
			</div>
		</form>
	</div>
	<main>

	<div class="row">
		<%
			List<Collaborateur> listeCollabs = (List<Collaborateur>) request.getAttribute("listeCollabs");
			for (Collaborateur collab : listeCollabs) {
		%>

		<div class="col">
			<div class="card">
				<h5 class="card-header"><%=collab.getNom()%> <%=collab.getPrenom()%></h5>
				<div class="card-body">
					<div class="row">
						<div class="col">
							<div class="card-img">
								<img src="<%=collab.getPhoto()%>">
							</div>
						</div>
						<div class="col-12">
							<p>
								<strong>Matricule: </strong><%=collab.getMatricule()%>
							</p>
							<p>
								<strong>Adresse: </strong><%=collab.getAdresse()%>
							</p>
							<p>
								<strong>Email: </strong><%=collab.getEmailPro()%>
							</p>
							<p>
								<strong>numéro sécurité : </strong><%=collab.getNumSecu()%>
							</p>
							<a href="editer-collab.html" class="btn btn-primary float-right">Editer</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</main> <br />
	<br />
</body>
</html>
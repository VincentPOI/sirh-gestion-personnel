<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SGP - Nouveau collaborateur</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-4.0.0-
dist/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="<%=request.getContextPath()%>/views/javaScript/creerCollaborateur.js"></script>
</head>
<body class="ui container">
  <ul class="nav nav-tabs">
    <span class="border-bottom"></span>
    <li class="nav-item">
      <a class="nav-link active" href="index.html">Collabrateurs</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="statistique.html">Statistique</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="activites.html">Activités</a>
    </li>
  </ul>
  <br/>
  <h1 class="ui header center aligned">Nouveau collaborateur</h1>
  <br/>
  <form method="POST" action="<%=request.getContextPath()%>/collaborateurs/creer" id="formfield">
    <div class="form-group row">
      <label for="nom" class="col-sm-2 col-form-label">Nom</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nom" placeholder="Nom" name="nom" required>
        <div class="invalid-feedback">
          Le nom est obligatoire
        </div>
      </div>
    </div>
    <div class="form-group row">
      <label for="prenom" class="col-sm-2 col-form-label">Prénom</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="prenom"  name="prenom" placeholder="Prénom" required>
        <div class="invalid-feedback">
          Le prénom est obligatoire
        </div>
      </div>
    </div>
    <div class="form-group row">
      <label for="dateNaissance" class="col-sm-2 col-form-label">Date de naissance</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="dateNaissance" name="dateNaissance" placeholder="jj/MM/AAAA" required>
        <div class="invalid-feedback" id="ifDate">
          La date de naissance est obligatoire
        </div>
      </div>
    </div>
    <div class="form-group row">
      <label for="adresse" class="col-sm-2 col-form-label">Adresse</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="adresse"  name="adresse" placeholder="Adresse" required>
        <div class="invalid-feedback">
          L'adresse est obligatoire
        </div>
      </div>
    </div>
    <div class="form-group row">
      <label for="numSecu" class="col-sm-2 col-form-label">Numéro de sécurité sociale</label>
      <div class="col-sm-10">
        <input type="text" class="form-control " id="numSecu" name="numSecu" placeholder="Numéro de sécurité sociale" required>
        <div class="invalid-feedback" id="ifSecu">
          Le numéro de sécurité sociale est obligatoire
        </div>
      </div>
    </div>
    <div class="form-group row">
      <div class="col-sm-12">

        <button type="button" id="btn" class="btn btn-primary float-right">Créer</button>


        <div class="modal" id="confirm-submit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                Création d'un collaborateur
              </div>
              <div class="modal-body" >
                <h4>Vous êtes sur le point de créer un nouveau collaborateur :</h4>
                <div class="row justify-content-md-center">
                  <div class="col">
                    <h4>Nom : </h4>
                  </div>
                  <div class="col" id="name">
                    input from $nom
                  </div>
                </div>
                <div class="row justify-content-md-center">
                  <div class="col">
                    <h4>Prénom : </h4>
                  </div>
                  <div class="col" id="firstName">
                    input from $prenom
                  </div>
                </div>
                <div class="row justify-content-md-center">
                  <div class="col">
                    <h4>Date de naissance : </h4>
                  </div>
                  <div class="col" id="birthDay">
                    input from $dateNaissance
                  </div>
                </div>

                <div class="row justify-content-md-center">
                  <div class="col">
                    <h4>Adresse : </h4>
                  </div>
                  <div class="col" id="adress">
                    input from $adresse
                  </div>
                </div>
                <div class="row justify-content-md-center">
                  <div class="col">
                    <h4>Numéro de sécurité sociale : </h4>
                  </div>
                  <div class="col" id="secuNumber">
                    input from $numSecu
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-primary" id="saveBtn">Sauvegarder</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</body>
</html>
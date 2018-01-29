package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateurController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matriculeParam = req.getParameter("matricule");
		String titreParam = req.getParameter("titre");
		String nomParam = req.getParameter("nom");
		String prenomParam = req.getParameter("prenom");
		resp.setContentType("text/html");


		if (matriculeParam == null) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST,"un matricule est attendu");
		} else {
			// code HTML ecrit dans le corps de la reponse
			resp.getWriter().write("<h1>Edition de collaborateurs</h1>");
			resp.getWriter().write( "<ul>" + "<li>Matricule :" + matriculeParam
					+ "</li>" + "</ul>");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matriculeParam = req.getParameter("matricule");
		String titreParam = req.getParameter("titre");
		String nomParam = req.getParameter("nom");
		String prenomParam = req.getParameter("prenom");
		resp.setContentType("text/html");

		if (matriculeParam == null ||matriculeParam.isEmpty() || titreParam == null || titreParam.isEmpty()|| nomParam == null || nomParam.isEmpty()|| prenomParam == null || prenomParam.isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST,("il manque les parametres suivants :"+isNull(matriculeParam,"matricule") + isNull(titreParam,"titre")+isNull(nomParam,"nom")+isNull(prenomParam,"prenom")));
		} else {
			resp.setStatus(HttpServletResponse.SC_CREATED);
			resp.getWriter().write("<h1>Edition de collaborateurs</h1>");
			resp.getWriter()
					.write("<ul>" + "<li>Creation d'un collaborateur avec les parametres suivants :</li>"
							+ "<li>matricule : " + matriculeParam + "</li>" + "<li>titre : " + titreParam + "</li>"
							+ "<li>nom : " + nomParam + "</li>" + "<li>prenom : " + prenomParam + "</li>" + "</ul>");
		}
	}
	private String isNull(String s, String p){
		if(s == null || s.isEmpty()){
			return (p);
		}
		return "";
	}
}

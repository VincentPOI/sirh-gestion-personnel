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
		resp.getWriter().write("<h1>Edition de collaborateurs</h1>");

		if (matriculeParam == null) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			resp.getWriter().write( "<ul>" + "<li> un matricule est attendu"
					+ "</li>" + "</ul>");
		} else {
			// code HTML ecrit dans le corps de la reponse
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
		resp.getWriter().write("<h1>Edition de collaborateurs</h1>");

		if (matriculeParam == null || titreParam == null || nomParam == null || prenomParam == null) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			resp.getWriter()
					.write("<ul>" + "<li> Les paramètres suivants sont incorrects </li>"+ isNull(matriculeParam,"matricule") + isNull(titreParam,"titre")+isNull(nomParam,"nom")+isNull(prenomParam,"prenom")+ "</ul>");
		} else {
			resp.setStatus(HttpServletResponse.SC_CREATED);
			resp.getWriter()
					.write("<ul>" + "<li>Creation d'un collaborateur avec les parametres suivants :</li>"
							+ "<li>matricule : " + matriculeParam + "</li>" + "<li>titre : " + titreParam + "</li>"
							+ "<li>nom : " + nomParam + "</li>" + "<li>prenom : " + prenomParam + "</li>" + "</ul>");
		}
	}
	private String isNull(String s, String p){
		if(s == null){
			return ("<li>"+p+"</li>");
		}
		return "";
	}
}

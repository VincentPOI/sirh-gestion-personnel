package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;

public class CreerCollaborateurController extends HttpServlet {

	
	public static CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.getRequestDispatcher("/views/collab/creerCollaborateur.jsp").forward(req, resp);		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		String matricule = generateMatricule();
		String nom = req.getParameter("nom");
		String prenom =req.getParameter("prenom");
		String[] dateForm = req.getParameter("dateNaissance").split("/");
		LocalDate dateNaissance = LocalDate.of(Integer.parseInt(dateForm[2]), Integer.parseInt(dateForm[1]), Integer.parseInt(dateForm[0]));
		String adresse = req.getParameter("adresse");
		String numSecu = req.getParameter("numSecu");
		String emailPro = prenom+"."+nom+"@societe.com";//@societe.com (le suffixe societe.com est à externaliser dans un fichier application.properties)
		String photo ="http://www.mykhe2hotel.com/wp/wp-content/uploads/2014/01/%E9%A7%84%E7%9B%AE%E3%81%AA%E3%81%AE%E3%81%8B%EF%BC%9F-300x300.jpg";
		ZonedDateTime dateHeureCreation =  ZonedDateTime.now();
		Boolean actif = true;
		List<Collaborateur> collabs = collabService.listerCollaborateurs();
		
		
		collabService.sauvegarderCollaborateur( new Collaborateur(matricule, nom, prenom, dateNaissance, adresse, numSecu, emailPro, photo, dateHeureCreation, actif));
		
		req.setAttribute("listeCollabs", collabService.listerCollaborateurs());
		req.getRequestDispatcher("/views/collab/listerCollaborateurs.jsp").forward(req, resp);	
	}
	
	private String generateMatricule(){
		String mat;
		List<Collaborateur> collabs = collabService.listerCollaborateurs();
		if(!collabs.isEmpty()){
			int i = Integer.parseInt(collabService.listerCollaborateurs().get(collabs.size()-1).getMatricule());
			i++;
			mat = Integer.toString(i);
		}else{
			mat = "1"; 
		}	
		return mat;
	}

}

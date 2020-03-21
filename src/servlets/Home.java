package servlets;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ressources.SubReddit;
import ressources.TasksDAO;


/**
 * Servlet implementation class Home
 */
@MultipartConfig(maxFileSize=10485760, maxRequestSize=52428800, fileSizeThreshold=1048576)
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String subName;
	private String postContent;
	private String action = null;
	private int idPost;
	private String comment;
	private String url;

	private final String CHEMIN = System.getProperty( "catalina.base" ) + "\\wtpwebapps\\Projet-JEE-Reddit\\img\\";
	private final int TAILLE_TAMPON = 10240;

	
	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/WEB-INF/home.jsp";
		
		if ("newSub".equals(action)) {

			SubReddit sub = new SubReddit();
			sub.setName(this.subName);
			tasksDAO.newSub(sub);
			this.action = null;
		}
		if ("newPost".equals(action)) {

			
			
			
			SubReddit sub = tasksDAO.getSubRedditByName(this.subName);
			ressources.Post post = new ressources.Post();
			

			
			
			post.setContent(this.postContent);
			post.setSubName(this.subName);
			post.setUrl(this.url);
			tasksDAO.newPost(post, sub);
			this.action = null;
		}
		
		if ("addComment".equals(action)) {

			ressources.Comment commentaire = new ressources.Comment();
			commentaire.setIdPost(this.idPost);
			commentaire.setContent(this.comment);
			tasksDAO.newComment(commentaire);
			this.action = null;
		}
		
		
		List<ressources.Post> votedPosts = tasksDAO.getMostVotedPosts(10);
		List<ressources.SubReddit> subList = tasksDAO.getSubs(5);
		
		request.setAttribute("posts", votedPosts);
		request.setAttribute("subList", subList);
		
		getServletContext()
		.getRequestDispatcher(url).
		forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("action") != null) this.action = request.getParameter("action");
		if (request.getParameter("subName") != null) this.subName = request.getParameter("subName");
		if (request.getParameter("postContent") != null) this.postContent = request.getParameter("postContent");
		if (request.getParameter("idPost") != null) this.idPost = Integer.valueOf(request.getParameter("idPost"));
		if (request.getParameter("comment") != null) this.comment = request.getParameter("comment");
		
		/** file input logic **/
		
		if ("newPost".equals(this.action)) {
		Part part = request.getPart("fichier");
		String nomFichier = getNomFichier ( part );
		
		if(nomFichier!= null  && !nomFichier.isEmpty()) {
			String nomChamp = part.getName();

			nomFichier= nomFichier.substring(nomFichier.lastIndexOf('/') + 1).substring(nomFichier.lastIndexOf('\\') + 1);
			
			this.url = "img/" + nomFichier;
			
			ecrireFichier (part, nomFichier, CHEMIN);
			
			request.setAttribute(nomChamp, nomFichier);
			}
		}
		
		
		/** End file inpu logic **/
		
		response.sendRedirect("Home");
		
	}


	private void ecrireFichier( Part part, String nomFichier, String chemin ) throws IOException {
	    
	    BufferedInputStream entree = null;
	    BufferedOutputStream sortie = null;
	    System.out.println(chemin + nomFichier);
        entree = new BufferedInputStream( part.getInputStream(), TAILLE_TAMPON );
        File file = new File( chemin + nomFichier );
        file.createNewFile();
        sortie = new BufferedOutputStream( new FileOutputStream(file),TAILLE_TAMPON );
 
        byte[] tampon = new byte[TAILLE_TAMPON];
        int longueur;
        while ( ( longueur = entree.read( tampon ) ) > 0 ) {
            sortie.write( tampon, 0, longueur );
        }
        sortie.close();
        entree.close();
	    }
		
	private static String getNomFichier( Part part ) {
	    
	    for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
	    	
	        if ( contentDisposition.trim().startsWith("filename") ) {
	
	            return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace("\"", "");
	        }
	    }
	   
	    return null;
	}
}
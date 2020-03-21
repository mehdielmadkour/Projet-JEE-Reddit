package servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

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
 * Servlet implementation class newPost
 */
@MultipartConfig(maxFileSize=10485760, maxRequestSize=52428800, fileSizeThreshold=1048576)
@WebServlet("/newPost")
public class newPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String subName;
	private String postContent;
	private Part part;
	
	private final String CHEMIN = System.getProperty( "catalina.base" ) + "\\wtpwebapps\\Projet-JEE-Reddit\\img\\";
	private final int TAILLE_TAMPON = 10240;
	
	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		SubReddit sub = tasksDAO.getSubRedditByName(this.subName);
		ressources.Post post = new ressources.Post();
		
		if (part != null) {
			String nomFichier = getNomFichier ( part );
			
			if(nomFichier!= null  && !nomFichier.isEmpty()) {
				String nomChamp = part.getName();

				nomFichier= nomFichier.substring(nomFichier.lastIndexOf('/') + 1).substring(nomFichier.lastIndexOf('\\') + 1);
				
				String url = "img/" + nomFichier;
				
				ecrireFichier (part, nomFichier, CHEMIN);

				post.setUrl(url);
			}
		}
		
		if (this.postContent != null || this.subName == null) {
			post.setContent(this.postContent);
			post.setSubName(this.subName);
			tasksDAO.newPost(post, sub);
		}
		

		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if (request.getParameter("subName") != null) this.subName = request.getParameter("subName");
		if (request.getParameter("postContent") != null) this.postContent = request.getParameter("postContent");
		if (request.getPart("fichier") != null) this.part = request.getPart("fichier");
		
		doGet(request, response);
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

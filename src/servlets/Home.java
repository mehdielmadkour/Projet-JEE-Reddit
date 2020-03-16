package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ressources.SubReddit;
import ressources.TasksDAO;


/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String subName;
	private String postContent;
	private String action = null;
	private int idPost;
	private String comment;
	
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
			tasksDAO.newPost(post, sub);
			this.action = null;
		}
		
		if ("addComment".equals(action)) {

			ressources.Comment commentaire = new ressources.Comment();
			commentaire.setId(this.idPost);
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
		
		
		
		response.sendRedirect("Home");
	}

}

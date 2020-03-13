package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recources.SubReddit;
import recources.TasksDAO;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String subName;
	private String postContent;
	private String action = null;
	
	
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
			recources.Post post = new recources.Post();
			post.setContent(this.postContent);
			post.setSubName(this.subName);
			tasksDAO.newPost(post, sub);
			this.action = null;
		}
		
		List<recources.Post> votedPosts = tasksDAO.getMostVotedPosts(10);
		
		request.setAttribute("posts", votedPosts);
		
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
		
		response.sendRedirect("Home");
	}

}

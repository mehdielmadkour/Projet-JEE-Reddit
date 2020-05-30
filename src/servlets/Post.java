package servlets;


import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ressources.TasksDAO;

/**
 * Servlet implementation class Post
 */
@WebServlet("/Post")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private int idPost;
	
	@EJB
	private TasksDAO tasksDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Post() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String url = "/WEB-INF/postPage.jsp";
		
		ressources.Post post = tasksDAO.getPost(this.idPost);
		request.setAttribute("post", post);
		
		//List<ressources.Comment> comments = tasksDAO.getPostComments(this.idPost);
		
		System.out.println(post.getCommentNumber());
		
		if (post.getCommentNumber() > 0) {
			List<ressources.Comment> comments = this.tasksDAO.getPostComments(post);
			request.setAttribute("comments", comments);
		} else {
			request.setAttribute("comments", new HashSet<>());
		}
		
		getServletContext()
		.getRequestDispatcher(url).
		forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getParameter("idPost") != null) this.idPost = Integer.valueOf(request.getParameter("idPost"));
		response.sendRedirect("Post");
	}

}

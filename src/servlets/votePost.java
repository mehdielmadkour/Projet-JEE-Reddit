package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ressources.TasksDAO;

/**
 * Servlet implementation class votePost
 */
@WebServlet("/votePost")
public class votePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private int idPost = 0;
	private int vote = 0;

	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public votePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (this.idPost != 0 && this.vote != 0) {
			ressources.Post post = this.tasksDAO.getPost(this.idPost);
			if (this.vote == 1) post.upVote();
			else if (this.vote == -1) post.downVote();
			
			this.tasksDAO.updatePost(post);
		}

		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request.getParameter("idPost"));
		System.out.println(request.getParameter("vote"));
		if (request.getParameter("idPost") != null) this.idPost = Integer.valueOf(request.getParameter("idPost"));
		if (request.getParameter("vote") != null) this.vote = Integer.valueOf(request.getParameter("vote"));
		
		doGet(request, response);
	}

}

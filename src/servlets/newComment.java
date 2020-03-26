package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ressources.Comment;
import ressources.TasksDAO;

/**
 * Servlet implementation class newComment
 */
@WebServlet("/newComment")
public class newComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private int idPost;
	private String commentContent;
	
	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Comment comment = new Comment();
		comment.setContent(this.commentContent);
		comment.setPostId(this.idPost);
		//ressources.Post post = this.tasksDAO.getPost(this.idPost);
		//post.addComments(comment);
		
		//tasksDAO.updatePost(post);
		tasksDAO.newComment(comment);

		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("idPost") != null) this.idPost = Integer.valueOf(request.getParameter("idPost"));
		if (request.getParameter("comment") != null) this.commentContent = request.getParameter("comment");
		
		response.sendRedirect("newComment");
	}

}

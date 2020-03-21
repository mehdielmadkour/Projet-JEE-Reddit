package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ressources.TasksDAO;

/**
 * Servlet implementation class SubReddit
 */
@WebServlet("/SubReddit")
public class SubReddit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String subName;
	
	
	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubReddit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "/WEB-INF/subReddit.jsp";
		
		if (request.getParameter("subName") != null) {
			List<ressources.Post> Posts = tasksDAO.getPosts("hello");
			request.setAttribute("posts", Posts);
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
		if (request.getParameter("subName") != null) this.subName = request.getParameter("subName");
		
		
		response.sendRedirect("SubReddit");
	}

}

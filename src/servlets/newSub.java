package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ressources.SubReddit;
import ressources.TasksDAO;

/**
 * Servlet implementation class newSub
 */
@WebServlet("/newSub")
public class newSub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String subName = null;
	
	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newSub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (this.subName != null) {
			SubReddit sub = new SubReddit();
			sub.setName(this.subName);
			tasksDAO.newSub(sub);
		}

		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("subName") != null) this.subName = request.getParameter("subName");
		
		response.sendRedirect("newSub");
	}

}

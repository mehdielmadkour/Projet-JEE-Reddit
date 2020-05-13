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
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String name = null;
	private String pass = null;
	
	@EJB
	private TasksDAO tasksDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String url = "/WEB-INF/signIn.jsp";
		if (name!= null && pass!= null) {
			ressources.User user = new ressources.User();
			user.setName(name);
			user.setPassword(pass);
			tasksDAO.newUser(user);
			url = "/WEB-INF/login.jsp";
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
		
		if (request.getParameter("name") != null) this.name = request.getParameter("name");
		if (request.getParameter("pass") != null) this.pass = request.getParameter("pass");
		
		
		
		response.sendRedirect("SignIn");
	}

}

package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ressources.TasksDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String name = null;
	private String pass = null;
       
	
	@EJB
	private TasksDAO tasksDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String url = "/WEB-INF/login.jsp";
		
		
				
		
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
		
		if(tasksDAO.UserExist(name, pass) == false){
			HttpSession session = request.getSession();
			
			session.setAttribute("name", name);

			
			response.sendRedirect("Userhome");
		}
		else {
			
		response.sendRedirect("Login");}
	}

}

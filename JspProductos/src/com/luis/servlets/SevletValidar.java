package com.luis.servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.luis.clases.Usuario;

/**
 * Servlet implementation class SevletValidar
 */
@WebServlet("/validarUsuario")
public class SevletValidar extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HashMap<String, Usuario> usuarios=
			(HashMap<String, Usuario>) getServletContext().getAttribute("usuarios");
		String login=request.getParameter("txtLogin");
		String password=request.getParameter("txtPassword");
		if(usuarios.containsKey(login)){
			Usuario us=usuarios.get(login);
			if(us.getPassword().equals(password) && us.isAutorizado()){
				
				HttpSession ses=request.getSession();
				ses.setAttribute("usuario", us);
				
			RequestDispatcher dsp=request.getRequestDispatcher("/privado/ver.jsp");
			dsp.forward(request, response);
				return;
				
			}
			
			
		}
		RequestDispatcher dsp=request.getRequestDispatcher("/error.jsp");
		dsp.forward(request, response);
		
		
	}

}

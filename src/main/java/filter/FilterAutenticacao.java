package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import connection.SingleConnection;

@WebFilter(urlPatterns = {"/principal/*"}) // Intercepta todas as requisições que vierem do projeto/mapeamento 
public class FilterAutenticacao implements Filter {
	
	private static Connection connection;
       
    public FilterAutenticacao() {
        super();
    }

    //Encerra os processos quando o servidor é parado
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Intercepta as requisições/repostas do projeto
	// Tudo do sistema vai passar por aqui!
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		try {
			
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			
			String usuarioLogado = (String) session.getAttribute("usuario");
			
			String urlAutenticar = req.getServletPath(); // Url que está sendo acessada	
			
			// Validar se está logado senão redirecionar para tela de login
			if (usuarioLogado == null  &&
					!urlAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				
				RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp?url=" + urlAutenticar);
				request.setAttribute("msg", "Por favor, realize o login.");
				redirecionar.forward(request, response);
				return; // Para a execução e redireciona para o login
			}else {
				chain.doFilter(request, response);
			}
			
			connection.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		 
	}

	// Inicia os processos ou recursos quando o servidor sobe o projeto
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnection.getConnection();
	}

}

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import java.util.*;

public class Validate implements Filter {
	
    public Validate() {
    }

	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("filter working,,");
		HttpServletRequest hreq = (HttpServletRequest)request;
		HttpServletResponse hres = (HttpServletResponse)response;
		HttpSession session = hreq.getSession(false);
		
		// System.out.println("session"+session.getAttribute("mobile"));
		if(session==null){
			System.out.println("session is null");
			// RequestDispatcher rd = hreq.getRequestDispatcher("index.html");
			// rd.forward(request,response);
			hres.sendRedirect("/Form/index.html");
			return ;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}

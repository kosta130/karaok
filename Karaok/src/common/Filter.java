package common;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Filter implements javax.servlet.Filter {

	private String encType;

	@Override
	public void init(FilterConfig config) throws ServletException {
		encType = config.getInitParameter("EncType");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// POST �ѱ� ó��
		if (encType != null) {
			request.setCharacterEncoding(encType);
		} else {
			request.setCharacterEncoding("UTF-8");
		}
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {

	}

}

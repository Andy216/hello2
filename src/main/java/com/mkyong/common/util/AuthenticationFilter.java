package com.mkyong.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.mkyong.common.domain.Usuario;
import com.mkyong.common.service.UsuarioService;

public class AuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	
	//final static Logger logger = Logger.getLogger(AuthenticationFilter.class);

	@Autowired
	private UsuarioService usuarioService;
	
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException {
        if (!request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }

        String username = obtainUsername(request);
        String password = obtainPassword(request);

       try {
					
			Usuario usua = usuarioService.get(new Usuario(username));
			if (usua != null) {

				request.getSession().setAttribute("USUA", new Usuario(usua.getId(), usua.getNombre()));
				UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
						username, password);
		       setDetails(request, authRequest);
		       return this.getAuthenticationManager().authenticate(authRequest);
		       
			} else {
				throw new BadCredentialsException("Error de acceso");
			}
		} catch (Exception e) {
			//logger.debug("mc AuthenticationSigafFilter Authentication " + e);
			throw new BadCredentialsException("Error de acceso");
		}
   
       
    }
}
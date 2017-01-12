package com.mkyong.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mkyong.common.domain.Usuario;
import com.mkyong.common.service.UsuarioService;
import com.mkyong.common.util.Filtro;
import com.mkyong.common.util.Respuesta;



@Controller
@RequestMapping(value = "/usua")
public class UsuarioController {
	
final static Logger logger = Logger.getLogger(UsuarioController.class);
	
	@Autowired
	private UsuarioService usuarioService;
	
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String page() {
		return "usuario";
	}
	
	@RequestMapping(value="saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Respuesta saveOrUpdate( @RequestBody Usuario pro) {
		try {
			 return usuarioService.saveOrUpdate(pro);
		} catch (Exception e) {
			logger.error("This is error : " + e);
			return null;
		}
	}

	@RequestMapping(value = "/lst", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody Map<String, Object> getLst(HttpServletRequest request, @ModelAttribute Filtro fil) {
		Map<String, Object> rpta = new HashMap<String, Object>();
		try {
			List<Usuario> lst = usuarioService.getLst(fil);	
			rpta.put("iTotalRecords", lst.size());
			rpta.put("aaData", lst);
		} catch (Exception e) {
			logger.error("This is error : " + e);
		}
		return rpta;
	}

	@RequestMapping(value="updateEstado", method = RequestMethod.POST)
	public @ResponseBody Respuesta baja( @RequestBody Usuario pro) {
		try {
			return usuarioService.updateEstado(pro);
		} catch (Exception e) {
			logger.error("This is error : " + e);
			return null;
		}
	}
	
	@RequestMapping(value="eliminar", method = RequestMethod.POST)
	public @ResponseBody Respuesta eliminar( @RequestBody Usuario pro) {
		try {
			return usuarioService.delete(pro);
		} catch (Exception e) {
			logger.error("This is error : " + e);
			return null;
		}
	}
	
	@RequestMapping(value = "pageCambio", method = RequestMethod.GET)
	public String pageCambio() {
		return "cambioClave";
	}

	@RequestMapping(value="updateClave", method = RequestMethod.POST)
	public @ResponseBody Respuesta updateClave( @RequestBody Usuario pro) {
		try {
			 return usuarioService.updateClave(pro);
		} catch (Exception e) {
			logger.error("This is error : " + e);
			return null;
		}
	}
	
	@RequestMapping(value="reinicioClave", method = RequestMethod.POST)
	public @ResponseBody Respuesta reinicioClave( @RequestBody Usuario pro) {
		try {
			 return usuarioService.reinicioClave(pro);
		} catch (Exception e) {
			logger.error("This is error : " + e);
			return null;
		}
	}
}

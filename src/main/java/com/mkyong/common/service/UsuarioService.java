package com.mkyong.common.service;

import java.util.List;

import com.mkyong.common.domain.Usuario;
import com.mkyong.common.util.Filtro;
import com.mkyong.common.util.Respuesta;



public interface UsuarioService {
		
	public List<Usuario> getLst(Filtro obj) throws Exception;
	public Respuesta saveOrUpdate(Usuario pro)throws Exception;
	public Respuesta delete(Usuario pro)throws Exception;
	public Respuesta updateEstado(Usuario pro)throws Exception;
	public Usuario get(Usuario pro) throws Exception;
	public Respuesta updateClave(Usuario pro) throws Exception;
	public Respuesta reinicioClave(Usuario pro) throws Exception;

}

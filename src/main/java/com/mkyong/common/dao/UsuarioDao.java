package com.mkyong.common.dao;

import java.util.List;

import com.mkyong.common.domain.Usuario;
import com.mkyong.common.util.Filtro;



public interface UsuarioDao {
	
	public List<Usuario> getLst(Filtro obj) throws Exception;
	public void save(Usuario pro) throws Exception;
	public void update(Usuario pro) throws Exception;
	public Usuario get(Usuario pro) throws Exception;
	public void delete(Usuario pro) throws Exception;
	public Integer validateAtencion(Usuario pro)throws Exception;
	public void updateEstado(Usuario pro) throws Exception;
	public void updateClave(Usuario pro) throws Exception;

}

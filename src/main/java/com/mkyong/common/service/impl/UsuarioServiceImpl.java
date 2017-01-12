package com.mkyong.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.mkyong.common.dao.UsuarioDao;
import com.mkyong.common.domain.Usuario;
import com.mkyong.common.service.UsuarioService;
import com.mkyong.common.util.Constant;
import com.mkyong.common.util.Filtro;
import com.mkyong.common.util.GetSession;
import com.mkyong.common.util.Respuesta;



@Service("usuarioService")
public class UsuarioServiceImpl implements UsuarioService{
	
	@Autowired
	private UsuarioDao usuarioDao; 

	public List<Usuario> getLst(Filtro obj) throws Exception {
		return usuarioDao.getLst(obj);
	}

	public Respuesta saveOrUpdate(Usuario pro) throws Exception {
		if(pro.getId()!=null){
			usuarioDao.update(pro);
			return new Respuesta(Constant.DATA_SAVE,Constant.MNSJ_SAVE);
		}else{
			pro.setClave(Constant.CLAVE_DEFAULT);
			pro.setRol(Constant.ROL_DEFAULT);
			pro.setEstado(Constant.TIP_ESTA_ACT);
			usuarioDao.save(pro);
			return new Respuesta(Constant.DATA_SAVE,Constant.MNSJ_SAVE);
		}
	}

	public Respuesta delete(Usuario pro) throws Exception {
		if(usuarioDao.validateAtencion(pro)>0){
			return new Respuesta(Constant.DATA_VALI_DELE,Constant.MSJ_VALI_DELE); 
		}
		usuarioDao.delete(pro);
		return new Respuesta(Constant.DATA_DELETE,Constant.MNSJ_DELETE); 
	}
	
	public Respuesta updateEstado(Usuario pro) throws Exception {
		pro = usuarioDao.get(pro);
		if(pro.getEstado()==Constant.TIP_ESTA_ACT){
			pro.setEstado(Constant.TIP_ESTA_INA);
		} else{
			pro.setEstado(Constant.TIP_ESTA_ACT);
		}
		usuarioDao.updateEstado(pro);
		return new Respuesta(Constant.DATA_UPDATE,Constant.MNSJ_UPDATE); 
	}
	
	public Usuario get(Usuario pro) throws Exception{
		return usuarioDao.get(pro);
	}
	public Respuesta updateClave(Usuario pro) throws Exception {
		pro.setId(GetSession.getUser().getId());
		usuarioDao.updateClave(pro);
		return new Respuesta(Constant.DATA_UPDATE,Constant.MNSJ_UPDATE_CLAVE); 
	}

	public Respuesta reinicioClave(Usuario pro) throws Exception {
		pro.setClave(Constant.CLAVE_DEFAULT);
		usuarioDao.updateClave(pro);
		return new Respuesta(Constant.DATA_UPDATE,Constant.MNSJ_RESTART_CLAVE); 
	}

}

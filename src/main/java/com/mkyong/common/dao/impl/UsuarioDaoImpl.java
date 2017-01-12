package com.mkyong.common.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mkyong.common.dao.UsuarioDao;
import com.mkyong.common.domain.Usuario;
import com.mkyong.common.util.Filtro;



@Repository("usuarioDao")
public class UsuarioDaoImpl implements UsuarioDao{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
		

	public List<Usuario> getLst(Filtro obj) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		List<Usuario> lst =null;
		try {
			lst = session.selectList("usuarioXml.getListTab",obj);			
		}
		finally{
			session.close();
		}
		return lst;
	}

	public void save(Usuario pro) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("usuarioXml.insert", pro);		
		}
		finally{
			session.commit();
			session.close();
		}	
	}

	public void update(Usuario pro) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("usuarioXml.update", pro);		
		}
		finally{
			session.commit();
			session.close();
		}
	}

	public Usuario get(Usuario pro) throws Exception {
		Usuario prov = null;
        SqlSession session = sqlSessionFactory.openSession();
        try {
        	prov = session.selectOne("usuarioXml.get",pro);
        } finally {
            session.close();
        }
		return prov;
	}

	public void delete(Usuario pro) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("usuarioXml.delete", pro);		
		}
		finally{
			session.commit();
			session.close();
		}
	}
	
	public void updateEstado(Usuario pro) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("usuarioXml.updateEstado", pro);		
		}
		finally{
			session.commit();
			session.close();
		}
	}
	
	public Integer validateAtencion(Usuario pro)throws Exception{
        SqlSession session = sqlSessionFactory.openSession();
        try {
        	return session.selectOne("usuarioXml.validateAtencion",pro);
        } finally {
            session.close();
        }
	}
	public void updateClave(Usuario pro) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("usuarioXml.updateClave", pro);		
		}
		finally{
			session.commit();
			session.close();
		}
	}
}

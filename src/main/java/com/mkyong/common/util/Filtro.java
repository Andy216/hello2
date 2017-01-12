package com.mkyong.common.util;

public class Filtro {
	
	private Integer cliente;
	private Integer sistema;
	private String fecha;
	private String estado;
	private String fechaFin;
	private String nombre;
	private String ruc;
	private Integer estadoAc;
	private Integer usuario;
	
	
	public Integer getUsuario() {
		return usuario;
	}
	public void setUsuario(Integer usuario) {
		this.usuario = usuario;
	}
	public Filtro(Integer estadoAc) {
		super();
		this.estadoAc = estadoAc;
	}
	public Integer getEstadoAc() {
		return estadoAc;
	}
	public void setEstadoAc(Integer estadoAc) {
		this.estadoAc = estadoAc;
	}
	public Filtro() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getCliente() {
		return cliente;
	}
	public void setCliente(Integer cliente) {
		this.cliente = cliente;
	}
	public Integer getSistema() {
		return sistema;
	}
	public void setSistema(Integer sistema) {
		this.sistema = sistema;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	
}

package com.cibertec.entity;

import java.io.Serializable;

public class Interfaz implements Serializable {
	
    private int cod_int;
    private String des_int;
    private String url_int;
    private TipoUsuario tipo_usuario;
    
	public int getCod_int() {
		return cod_int;
	}
	public void setCod_int(int cod_int) {
		this.cod_int = cod_int;
	}
	public String getDes_int() {
		return des_int;
	}
	public void setDes_int(String des_int) {
		this.des_int = des_int;
	}
	public String getUrl_int() {
		return url_int;
	}
	public void setUrl_int(String url_int) {
		this.url_int = url_int;
	}
	public TipoUsuario getTipo_usuario() {
		return tipo_usuario;
	}
	public void setTipo_usuario(TipoUsuario tipo_usuario) {
		this.tipo_usuario = tipo_usuario;
	}
    
    
}
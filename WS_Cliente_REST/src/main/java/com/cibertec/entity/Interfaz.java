package com.cibertec.entity;

import java.io.Serializable;

public class Interfaz implements Serializable {
	
    private int cod_int;
    private String des_int;
    private String url_int;
    private TipoUsuario cod_tip_usu;
    
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
	public TipoUsuario getCod_tip_usu() {
		return cod_tip_usu;
	}
	public void setCod_tip_usu(TipoUsuario cod_tip_usu) {
		this.cod_tip_usu = cod_tip_usu;
	}
    
}
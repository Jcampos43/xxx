package com.cibertec.entity;

import java.io.Serializable;

public class TipoUsuario  implements Serializable{
	
    private int cod_tip_usu;
    private String nom_tip_usu;
    
	public int getCod_tip_usu() {
		return cod_tip_usu;
	}
	public void setCod_tip_usu(int cod_tip_usu) {
		this.cod_tip_usu = cod_tip_usu;
	}
	public String getNom_tip_usu() {
		return nom_tip_usu;
	}
	public void setNom_tip_usu(String nom_tip_usu) {
		this.nom_tip_usu = nom_tip_usu;
	}    
	
}
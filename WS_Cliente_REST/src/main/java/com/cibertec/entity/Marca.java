package com.cibertec.entity;
import java.io.Serializable;
public class Marca implements Serializable{
	
	private int cod_mar;
	private String nom_mar;
	
	public int getCod_mar() {
		return cod_mar;
	}
	public void setCod_mar(int cod_mar) {
		this.cod_mar = cod_mar;
	}
	public String getNom_mar() {
		return nom_mar;
	}
	public void setNom_mar(String nom_mar) {
		this.nom_mar = nom_mar;
	}
	
	
}




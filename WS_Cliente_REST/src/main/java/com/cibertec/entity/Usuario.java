package com.cibertec.entity;
import java.io.Serializable;

public class Usuario implements Serializable {
    
    private int cod_usu;
	private String nom_usu;
    private String ape_usu;
    private int dni_usu;    
	private String pass_usu;    
	private TipoUsuario tipoUsuario;
	private Distrito distrito;
	
	/*Metodos GETTER Y SETTER*/
	
	public int getCod_usu() {
		return cod_usu;
	}
	public void setCod_usu(int cod_usu) {
		this.cod_usu = cod_usu;
	}
	public String getNom_usu() {
		return nom_usu;
	}
	public void setNom_usu(String nom_usu) {
		this.nom_usu = nom_usu;
	}
	public String getApe_usu() {
		return ape_usu;
	}
	public void setApe_usu(String ape_usu) {
		this.ape_usu = ape_usu;
	}
	public int getDni_usu() {
		return dni_usu;
	}
	public void setDni_usu(int dni_usu) {
		this.dni_usu = dni_usu;
	}
	public String getPass_usu() {
		return pass_usu;
	}
	public void setPass_usu(String pass_usu) {
		this.pass_usu = pass_usu;
	}
	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	public Distrito getDistrito() {
		return distrito;
	}
	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}
	
}
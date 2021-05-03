package com.cibertec.entity;
import java.io.Serializable;
public class Mascota implements Serializable{
	
	private int cod_mas;
	private String nom_mas;
	private Usuario cliente;
	private TipoMascota tipoMascota;
	
	public int getCod_mas() {
		return cod_mas;
	}
	public void setCod_mas(int cod_mas) {
		this.cod_mas = cod_mas;
	}
	public String getNom_mas() {
		return nom_mas;
	}
	public void setNom_mas(String nom_mas) {
		this.nom_mas = nom_mas;
	}
	public Usuario getUsuario() {
		return cliente;
	}
	public void setUsuario(Usuario cliente) {
		this.cliente = cliente;
	}
	public TipoMascota getTipoMascota() {
		return tipoMascota;
	}
	public void setTipoMascota(TipoMascota tipoMascota) {
		this.tipoMascota = tipoMascota;
	}
		
}



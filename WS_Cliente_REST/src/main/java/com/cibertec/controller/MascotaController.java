package com.cibertec.controller;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.cibertec.entity.Usuario;
import com.cibertec.entity.Mascota;
import com.cibertec.entity.TipoMascota;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/mascota")
public class MascotaController {
	private String REST_MASCOTA="http://localhost:8090/mascota/";
	private String REST_TIPO="http://localhost:8090/tipoMascota/";
	private String REST_USUARIO="http://localhost:8090/cliente/";

	@RequestMapping(value = "/crudMascota")
	public String index() {
		return "crudMascota";
	}
		
	@RequestMapping(value = "/listaMascotas")
	public @ResponseBody Map<String,Object> listaMascotas() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Mascota[]> response =rt.getForEntity(REST_MASCOTA+"listaMascota",Mascota[].class);
			Mascota[] lista=response.getBody();
			map.put("dataMascotas", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/listaUsuarios")
	public @ResponseBody Map<String,Object> listaClientes() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Usuario[]> response =rt.getForEntity(REST_USUARIO+"listaCliente",Usuario[].class);
			Usuario[] lista=response.getBody();
			map.put("dataClientes", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/listaTipoMascotas")
	public @ResponseBody Map<String,Object> listaTipo() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<TipoMascota[]> response =rt.getForEntity(REST_TIPO+"listaTipoMascota",TipoMascota[].class);
			TipoMascota[] lista=response.getBody();
			map.put("dataTipo", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="/saveMascotas")
	public @ResponseBody Map<String,Object> save(@RequestBody Mascota bean) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
		    RestTemplate restTemplate = new RestTemplate();
		    //Se trasnforma a json
			Gson gson = new Gson();
			String dataJson=  gson.toJson(bean);
			//
			HttpHeaders headers = new HttpHeaders();
			MediaType mediaType = new MediaType("application", "json", StandardCharsets.UTF_8);
			headers.setContentType(mediaType);
	    	HttpEntity<String> request = new HttpEntity<String>(dataJson.toString(), headers);
	    	//
		    if(bean.getCod_mas()==0) {
		    	restTemplate.postForObject(REST_MASCOTA+"registraMascota", request, String.class);
		    	map.put("dataMensaje",1);
		    }
		    else {
		       	restTemplate.put(REST_MASCOTA+"actualizaMascota", request, String.class);
		    	map.put("dataMensaje",1);
		    }
		} catch (Exception e) {
			map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value="/deleteMascota")
	public @ResponseBody Map<String,Object> deleteMascota(@RequestParam("cod_mas") int cod) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete(REST_MASCOTA+"eliminaMascota/"+cod);
			map.put("dataMensaje",1);	
		} catch (Exception e) {
			map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return map;
	}
}






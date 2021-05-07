package com.cibertec.controller;

import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
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

import com.cibertec.entity.Distrito;
import com.cibertec.entity.TipoUsuario;
import com.cibertec.entity.Usuario;
import com.google.gson.Gson;

@Controller
//@RequestMapping(value = "/usuario")
public class UsuarioController {
	
	private String REST_USUARIO="http://localhost:8090/usuario/";
	private String REST_INTERFAZ="http://localhost:8090/interfaz/";
	private String REST_DISTRITO="http://localhost:8090/distrito/listaDistrito/";
	private String REST_TIPOUSUARIO="http://localhost:8090/tipoUsuario/listaTipoUsuario";
	
	   @RequestMapping("/login")
	    public String index() {
	        
	            return "login";
	    }

	@RequestMapping(value = "/listaUsuarios")
	public @ResponseBody Map<String,Object> listaUsuarios() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Usuario[]> response =rt.getForEntity(REST_USUARIO+"listaUsuario",Usuario[].class);
			Usuario[] lista=response.getBody();
			map.put("dataUsuarios", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/listaTipoUsuario")
	public @ResponseBody Map<String,Object> listaTipoUsuario() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<TipoUsuario[]> response =rt.getForEntity(REST_TIPOUSUARIO,TipoUsuario[].class);
			TipoUsuario[] lista=response.getBody();
			map.put("dataTipoUsuario", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/listaDistritos")
	public @ResponseBody Map<String,Object> listaDistritos() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Distrito[]> response =rt.getForEntity(REST_DISTRITO,Distrito[].class);
			Distrito[] lista=response.getBody();
			map.put("dataDistritos", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="/saveUsuario")
	public @ResponseBody Map<String,Object> save(@RequestBody Usuario bean) {
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
		    if(bean.getCod_usu()==0) {
		    	restTemplate.postForObject(REST_USUARIO+"registraUsuario", request, String.class);
		    	map.put("dataMensaje",1);
		    }
		    else {
		       	restTemplate.put(REST_USUARIO+"actualizaUsuario", request, String.class);
		    	map.put("dataMensaje",1);
		    }
		} catch (Exception e) {
			map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value="/deleteUsuario")
	public @ResponseBody Map<String,Object> deleteUsuario(@RequestParam("codigo") int cod) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete(REST_USUARIO+"eliminaUsuario/"+cod);
			map.put("dataMensaje",1);	
		} catch (Exception e) {
			map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return map;
	}
	
    @RequestMapping("/iniciarSesion")
    public @ResponseBody Usuario iniciarSesion(@RequestBody Usuario bean) {
    	
    	Usuario users = null;
    	
    	
    	
    	Map<String,Object> map = new HashMap<String,Object>();
		try {
		    RestTemplate restTemplate = new RestTemplate();
		    //Se trasnforma a json
			Gson gson = new Gson();
			String dataJson=  gson.toJson(bean);
			HttpHeaders headers = new HttpHeaders();
			MediaType mediaType = new MediaType("application", "json", StandardCharsets.UTF_8);
			headers.setContentType(mediaType);
	    	HttpEntity<String> request = new HttpEntity<String>(dataJson.toString(), headers);
	    	   	
	    	users = restTemplate.postForObject(REST_USUARIO+"login", request, Usuario.class);
	    	System.out.println(users);	    	
	    	map.put("users",users);
			
	    	
	    	
	    	
    	}catch (Exception e) {
    		map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return users;       
    }
}






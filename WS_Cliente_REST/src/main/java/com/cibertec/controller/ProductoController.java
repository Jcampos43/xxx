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

import com.cibertec.entity.Marca;
import com.cibertec.entity.Producto;
import com.cibertec.entity.Proveedor;
import com.google.gson.Gson;
@Controller
@RequestMapping(value = "/producto")
public class ProductoController {
	private String REST_PRODUCTO="http://localhost:8090/producto/";
	private String REST_MARCA="http://localhost:8090/marca/listaMarca/";
	private String REST_PROVEEDOR="http://localhost:8090/proveedor/listaProveedor/";
	
	@RequestMapping(value = "/crudProducto")
	public String index() {
		return "crudProducto";
	}
	
	@RequestMapping(value = "/listaProductos")
	public @ResponseBody Map<String,Object> listaProductos() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Producto[]> response =rt.getForEntity(REST_PRODUCTO+"listaProducto",Producto[].class);
			Producto[] lista=response.getBody();
			map.put("dataProductos", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/listaMarcas")
	public @ResponseBody Map<String,Object> listaMarcas() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Marca[]> response =rt.getForEntity(REST_MARCA,Marca[].class);
			Marca[] lista=response.getBody();
			map.put("dataMarcas", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/listaProveedores")
	public @ResponseBody Map<String,Object> listaProveedores() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Proveedor[]> response =rt.getForEntity(REST_PROVEEDOR,Proveedor[].class);
			Proveedor[] lista=response.getBody();
			map.put("dataProveedores", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="/saveProductos")
	public @ResponseBody Map<String,Object> save(@RequestBody Producto bean) {
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
		    if(bean.getCod_pro()==0) {
		    	restTemplate.postForObject(REST_PRODUCTO+"registraProducto", request, String.class);
		    	map.put("dataMensaje",1);
		    }
		    else {
		       	restTemplate.put(REST_PRODUCTO+"actualizaProducto", request, String.class);
		    	map.put("dataMensaje",1);
		    }
		} catch (Exception e) {
			map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value="/deleteProducto")
	public @ResponseBody Map<String,Object> deleteCliente(@RequestParam("cod_pro") int cod) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete(REST_PRODUCTO+"eliminaProducto/"+cod);
			map.put("dataMensaje",1);	
		} catch (Exception e) {
			map.put("dataMensaje",-1);
			e.printStackTrace();
		}
		return map;
	}
}






package com.cibertec.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.cibertec.entity.Interfaz;

public class InterfazController {
	
	private String REST_INTERFAZ="http://localhost:8090/interfaz/";
	
	@RequestMapping(value = "/listaInterfaz")
	public @ResponseBody Map<String,Object> listaInterfaz() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			RestTemplate rt=new RestTemplate();
			ResponseEntity<Interfaz[]> response =rt.getForEntity(REST_INTERFAZ+"listaInterfaz",Interfaz[].class);
			Interfaz[] lista=response.getBody();
			map.put("dataInterfaz", lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}

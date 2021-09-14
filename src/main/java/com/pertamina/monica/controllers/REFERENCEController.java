package com.pertamina.monica.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pertamina.monica.helper.ResponseWrapper;

@RestController
@RequestMapping("/REFERENCE")
public class REFERENCEController {
	
	@RequestMapping(value="/POTEXT", method = RequestMethod.GET, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapper getPOTEXT() throws Exception {
		List<String> data = new ArrayList<String>();
		data.add("TYPE");
		data.add("LAMP QUANTITY");
		data.add("VOLTAGE RATING");
		data.add("FREQUENCY");
		data.add("BALLAST FACTOR");
		data.add("SIZE");
		data.add("MODEL");
		data.add("MANUFACTURE");
		return new ResponseWrapper(data);
	}
	
	@RequestMapping(value="/COMPANY", method = RequestMethod.GET, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapper getCOMPANY() throws Exception {
		List<Company> data = new ArrayList<Company>();
		data.add(new Company(2210, "2210 - Company 1"));
		data.add(new Company(2211, "2212 - Company 2"));
		data.add(new Company(2212, "2213 - Company 3"));
		return new ResponseWrapper(data);
	}
	
	@RequestMapping(value="/REQUESTEDBY", method = RequestMethod.GET, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapper getREQUESTEDBY() throws Exception {
		List<String> data = new ArrayList<String>();
		data.add("Asep");
		data.add("Bayu");
		data.add("Cecep");
		data.add("Dicky");
		data.add("Erik");
		data.add("Fajar");
		return new ResponseWrapper(data);
	}
	
}

class Company {
	
	private int id;
	private String name;
	
	public Company(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}

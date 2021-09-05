package com.pertamina.monica.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pertamina.monica.helper.MyMap;

@Configuration
@Controller
public class PageController {
	
	@Value("${server.contextPath}")
	private String contextPath;
	
	@RequestMapping("/")
	public String loadIndex(Model model){
		return "index";
	}
	
	@RequestMapping("/{jsp}")
	public String loadJsp(Model model, @PathVariable String jsp){
		List<MyMap> listTime = new ArrayList<MyMap>();
		listTime.add(new MyMap("any-time", "Any time"));
		listTime.add(new MyMap("past-hour", "Past hour"));
		listTime.add(new MyMap("past-day", "Past 24 hours"));
		listTime.add(new MyMap("past-week", "Past week"));
		listTime.add(new MyMap("past-month", "Past month"));
		listTime.add(new MyMap("past-year", "Past year"));
		listTime.add(new MyMap("custom-range", "Custom range.."));
		HashMap<String, String> mapTime = new HashMap<String, String>();
		for(MyMap myMap : listTime) { mapTime.put(myMap.getKey(), myMap.getValue()); }
		model.addAttribute("mapTime", mapTime);
		model.addAttribute("listTime", listTime);
		return jsp;
	}
	
	@RequestMapping("/admin/")
	public String loadAdminIndex(Model model, HttpServletRequest request){
		model.addAttribute("assetPath", request.getContextPath()+"/admin");
		return "admin/index";
	}
	
	@RequestMapping("/admin/{jsp}")
	public String loadAdminJsp(Model model, HttpServletRequest request, @PathVariable String jsp){
		model.addAttribute("assetPath", request.getContextPath()+"/admin");
		return "admin/"+jsp;
	}
	
}

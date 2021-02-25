package com.mbeti.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/*")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	logger.info("Welcome home! the client locale is "+ locale.toString());

	Date date = new Date();
	DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

	String formattedDate = dateFormat.format(date);

	model.addAttribute("serverTime", formattedDate );

	return "home";
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return "notice";
	}
	
	//연주씨 01
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}
	
	//연주씨 02
	@RequestMapping(value = "/search_result", method = RequestMethod.GET)
	public String search_result() {
		return "search_result";
	}
	
	//연주씨 03
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
	
	//연주씨 04
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	//공채달력
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar() {
		return "calendar";
	}
	
	@ResponseBody
	@RequestMapping(value = "/search_source", method = RequestMethod.GET)
	public String search_source() {
		return "search_source";
	}
	
    @RequestMapping(value = "/search_source", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public FileSystemResource getProvinceList(HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("/WEB-INF/views") + "/search_source.json";
        return new FileSystemResource(new File(path));
    }

    

		
		
		
		
}

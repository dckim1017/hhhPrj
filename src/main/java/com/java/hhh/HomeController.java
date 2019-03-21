package com.java.hhh;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.hhh.command.BoardCommand;
import com.java.hhh.command.NoticeCommand;
import com.java.hhh.command.VCommand;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	VCommand vcommand;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/introduction")
	public String introduction(Model model) {
		return "sub/introduction";
	}
	
	@RequestMapping("/facility")
	public String facility(Model model) {
		return "sub/facility";
	}
	
	@RequestMapping("/activity")
	public String activity(Model model) {
		return "sub/activity";
	}
	
	@RequestMapping("/alliance")
	public String alliance(Model model) {
		return "sub/alliance";
	}
	
	@RequestMapping("/address")
	public String address(Model model) {
		return "sub/c_address";
	}
	
	@RequestMapping("/FAQ")
	public String faq(Model model) {
		return "sub/c_FAQ";
	}
	
	@RequestMapping("/pp")
	public String pp(Model model) {
		return "sub/c_privacy";
	}
	
}

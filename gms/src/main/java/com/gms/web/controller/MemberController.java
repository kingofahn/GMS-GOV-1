package com.gms.web.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gms.web.domain.MemberDTO;
import com.gms.web.service.MemberService;
@Controller
@RequestMapping("/member")
public class MemberController {
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberDTO member;
	@Autowired MemberService memberService;
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute("member") MemberDTO member) {
		logger.info("\n --------- MemberController {} !!--------","add");
		memberService.add(member);
		return "login_page";
	}
	@RequestMapping("/list")
	public void list() {}
	
	@RequestMapping("/search")
	public void search() {}
	
	@RequestMapping("/retrieve/{userid}/{action}")
	public String retrieve(@PathVariable String userid, 
							@PathVariable String action, Model model) {
		logger.info("\n --------- MemberController {} !!--------","retrieve");
		String res = "";
		member.setUserid(userid);
		switch(action) {
		case "modify" :  
			res="modify_page";
			logger.info("\n --------- retrieve() {} !!--------",res);
			break;
		case "remove" :
			res="remove_page";
			logger.info("\n --------- retrieve() {} !!--------",res);
			break;
		default :  
			res="retrieve_page";
			logger.info("\n --------- retrieve() {} !!--------",res);
			break;
		}
		model.addAttribute("user",memberService.retrieve(member));
		return res;
	}
	@RequestMapping("/count")
	public void count() {}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@ModelAttribute("member") MemberDTO member, Model model) {
		logger.info("\n --------- MemberController {} !!--------","modify");
		memberService.modify(member);
		model.addAttribute("user", memberService.retrieve(member));
		return "retrieve_page";
	}
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@ModelAttribute("member") MemberDTO member) {
		logger.info("\n --------- MemberController {} !!--------","remove");
		memberService.remove(member);
		return "redirect:/";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute("member") MemberDTO member, Model model) {
		logger.info("\n --------- MemberController {} !!--------","login");
		member = memberService.login(member);
		String flag ="";
		if(member!=null) {
			flag = "login_success";
			model.addAttribute("user", memberService.retrieve(member));
		} else {
			flag = "login_page";
		}
		logger.info("\n login 결과 {}",flag);
		return flag;
	}
	@RequestMapping("/logout")
	public String logout() {
		logger.info("\n --------- MemberController {} !!--------","logout()");
		return "redirect:/";
	}
	@RequestMapping("/fileUpload")
	public void fileUpload() {} 
}
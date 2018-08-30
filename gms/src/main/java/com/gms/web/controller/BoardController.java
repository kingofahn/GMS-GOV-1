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

import com.gms.web.domain.ArticleDTO;
import com.gms.web.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired ArticleDTO Board;
	@Autowired BoardService BoardService;
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute("Board") ArticleDTO Board) {
		logger.info("\n --------- BoardController {} !!--------","add");
		BoardService.add(Board);
		return "login_page";
	}
	@RequestMapping("/list")
	public void list() {}
	
	@RequestMapping("/search")
	public void search() {}
	
	@RequestMapping("/retrieve/{userid}/{action}")
	public String retrieve(@PathVariable String userid, 
							@PathVariable String action, Model model) {
		logger.info("\n --------- BoardController {} !!--------","retrieve");
		String res = "";
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
		model.addAttribute("user",BoardService.retrieve(Board));
		return res;
	}
	@RequestMapping("/count")
	public void count() {}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@ModelAttribute("Board") ArticleDTO Board, Model model) {
		logger.info("\n --------- BoardController {} !!--------","modify");
		BoardService.modify(Board);
		model.addAttribute("user", BoardService.retrieve(Board));
		return "retrieve_page";
	}
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@ModelAttribute("Board") ArticleDTO Board) {
		logger.info("\n --------- BoardController {} !!--------","remove");
		BoardService.remove(Board);
		return "redirect:/";
	}
	@RequestMapping("/fileUpload")
	public void fileUpload() {} 

}

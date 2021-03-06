package cn.bdqn.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.bdqn.entity.Classes;
import cn.bdqn.entity.Faqs;
import cn.bdqn.service.ClassesService;
import cn.bdqn.service.FaqsService;

@Controller
public class FaqsController {
	@Resource
	private FaqsService faqsService;
	@Resource
	private ClassesService classesService;
	/**
	 * 根据关键字模糊查找问题信息
	 * @param model
	 * @param status
	 * @param keyword
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("listFaqs")
	public String listFaqs(Model model,
			@RequestParam(value="status",required=false) String status,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageIndex",required=false) String pageIndex) {
		if(keyword==null) {
			keyword="";
		}
		if(pageIndex==null||"".equals(pageIndex)||"-1".equals(pageIndex)) {
			pageIndex = "0";
		}
		
		Map<String, Object> result= faqsService.list(keyword,Integer.parseInt(pageIndex));
		result.put("pageIndex", pageIndex);
		result.put("status", status);
		result.put("keyword", keyword);
		model.addAttribute("result", result);
		return "faqsList";
	}
	
	@RequestMapping(value="/toAddFaqs",method=RequestMethod.GET)
	public String toAddFaq() {
		return "add"; 
	}
	
	//使用ajax加载分类
	@RequestMapping(value="/getClasses",method=RequestMethod.GET)
	@ResponseBody
	public List<Classes> getClasses() {
		List<Classes> list = classesService.list();
		return list; 
	}
	
	@RequestMapping(value="/toShowFaq",method=RequestMethod.GET)
	public String toShowFaq(@RequestParam("id")String id,Model model) {
		Map<String,Object> faqs = faqsService.get(Integer.parseInt(id));
		model.addAttribute("result",faqs);
		return "show"; 
	}
	
	
	@RequestMapping(value="/addFaq",method=RequestMethod.POST)
	public String addFaq(@ModelAttribute Faqs faqs) {
		int status = faqsService.add(faqs);
		return "redirect:/listFaqs?status="+status; 
	}
	

}

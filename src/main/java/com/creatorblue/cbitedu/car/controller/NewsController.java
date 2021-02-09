package com.creatorblue.cbitedu.car.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.domain.ModelNew;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;
import com.creatorblue.cbitedu.model.service.ModelImgService;
import com.creatorblue.cbitedu.model.service.ModelNewService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/*
 * 新闻
 */
@Controller
@RequestMapping("/api/NewsController.do")
public class NewsController extends HihBaseController{
	
	@Autowired
	private ModelNewService newService;
	@Autowired
	private ModelImgService<?> imgService;
	
	@RequestMapping(params = "method=queryEnterprise")
	public ModelAndView queryEnterprise(String type,HttpServletRequest request,Integer pageNum,Integer pageSize) {
		if(pageNum == null) {
			pageNum=1;
		}
		if(pageSize == null) {
			pageSize=8;
		}
		PageHelper.startPage(pageNum, pageSize);
		ModelNew news = new ModelNew();
		type = type==null? "enterprise":type;
		request.getSession().setAttribute("type", type);
		if(type.equals("enterprise")) {
			type="企业动态";
		}else {
			type="行业动态";
		}
		news.setNewType(type);
		List<ModelNew> list =newService.selectByEnterprise(news);
		//List<ModelImg> listImg =imgService.selectByType();
		
		PageInfo<ModelNew> page = new PageInfo<ModelNew>(list);
		//List<ModelNew> listIndustry =newService.selectByqueryIndustry(null);
		ModelAndView mv = new ModelAndView("/car/new-center");
		mv.addObject("news",list);
		//mv.addObject("img",listImg);
		mv.addObject("page",page);
		//mv.addObject("newsIndustry",listIndustry);
		
		request.getSession().setAttribute("list", list);
		return mv;
	}
	/*
	 * 详细内容
	 */
	@RequestMapping(params = "method=queryContent")
	public ModelAndView queryContent(String id,HttpServletRequest request) {
		List<ModelNew> news=(List) request.getSession().getAttribute("list");
		int k=0;
		for(int i=0;i<news.size();i++) {
			if(news.get(i).getNewId().equals(id)) {
				k=i;
				break;
			}
			
		}
		//ModelNew list = newService.selectContentById(id);
		ModelNew list = news.get(k);
		ModelNew last= k==0? null:news.get(k-1);
		ModelNew next= k==news.size()-1? null:news.get(k+1);
		ModelAndView mv = new ModelAndView("/car/news-read");
		mv.addObject("news",list);
		mv.addObject("last",last);
		mv.addObject("next",next);
		
		
		//mv.addObject("newsIndustry",listIndustry);
		return mv;
	}
}

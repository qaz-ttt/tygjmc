package com.creatorblue.cbitedu.car.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;
import com.creatorblue.cbitedu.model.service.ModelRecruitService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/*
 * 招聘
 */
@Controller
@RequestMapping("/api/RecruitController.do")
public class RecruitController extends HihBaseController{
	
	@Autowired
	private ModelRecruitService recruitService;
	
	@RequestMapping(params = "method=list")
	public ModelAndView query(Integer pageNum,Integer pageSize){
		if(pageNum == null) {
			pageNum=1;
		}
		if(pageSize == null) {
			pageSize=4;
		}
		PageHelper.startPage(pageNum, pageSize);
		List<ModelRecruit> list = recruitService.selectPageByMap(null);	
		ModelAndView mv = new ModelAndView("/car/recruit");
		PageInfo<ModelRecruit> page = new PageInfo<ModelRecruit>(list);		
		mv.addObject("recruit",list);
		mv.addObject("page",page);
		return mv;
	}
	@RequestMapping(params = "method=queryContent")
	public ModelAndView queryContent(String id) {
		
		ModelRecruit list =recruitService.selectById(id);
		ModelAndView mv = new ModelAndView("/car/recruit-read");
		mv.addObject("recruitContent",list);
		return mv;
	}
}

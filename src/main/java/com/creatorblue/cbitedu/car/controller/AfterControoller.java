package com.creatorblue.cbitedu.car.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.creatorblue.cbitedu.model.domain.ModelInformation;

import com.creatorblue.cbitedu.model.service.ModelInformationService;



@Controller
@RequestMapping("api/after.do")
public class AfterControoller {
	
	//站点表
		@Autowired
		private ModelInformationService<ModelInformation> informationService;
	@RequestMapping(params = "method=query")
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("car/after-service");
		Map<String, Object> param=new HashMap();
		param.put("infoType", "售后服务");
		param.put("res", "通过");
		List<ModelInformation> info = informationService.selectPageByMap(param);
		mv.addObject("info",info);
		return mv;
	}
}

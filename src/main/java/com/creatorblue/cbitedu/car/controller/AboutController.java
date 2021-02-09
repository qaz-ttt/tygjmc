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

import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.domain.ModelInformation;
import com.creatorblue.cbitedu.model.service.ModelImgService;
import com.creatorblue.cbitedu.model.service.ModelInformationService;

@Controller
@RequestMapping("api/about.do")
public class AboutController extends HihBaseController{
	
		//站点表
		@Autowired
		private ModelInformationService<ModelInformation> informationService;
		//图片
		@Autowired
		private ModelImgService<?> imgService;
		
		@RequestMapping(params = "method=query")
		public ModelAndView show(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView mv = new ModelAndView("car/about-us");
			Map<String, Object> param=new HashMap();
			param.put("infoType", "关于我们");
			param.put("res", "通过");
			List<ModelInformation> info = informationService.selectPageByMap(param);
			mv.addObject("info",info);
			return mv;
		}
		
		@RequestMapping(params = "method=queryContact")
		public ModelAndView contact(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView mv = new ModelAndView("car/contact-us");
			Map<String, Object> param=new HashMap();
			
			param.put("infoType", "联系我们");
			param.put("res", "通过");
			List<ModelInformation> info = informationService.selectPageByMap(param);
			
			//List<ModelImg> listImg =imgService.selectByTypeCode();

			mv.addObject("info",info);
			//mv.addObject("img",listImg);
			return mv;
		}
		
		
		@RequestMapping(params = "method=ditu")
		public ModelAndView showDitu(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView mv = new ModelAndView("car/ditu");
			return mv;
		}

}

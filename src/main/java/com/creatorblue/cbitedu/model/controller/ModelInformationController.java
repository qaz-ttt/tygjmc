package com.creatorblue.cbitedu.model.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.alibaba.druid.util.StringUtils;
import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.core.page.Page;
import com.creatorblue.cbitedu.core.utils.Identities;
import com.creatorblue.cbitedu.model.domain.ModelAudit;
import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.domain.ModelInformation;
import com.creatorblue.cbitedu.model.service.ModelAuditService;
import com.creatorblue.cbitedu.model.service.ModelDictService;
import com.creatorblue.cbitedu.model.service.ModelInformationService;

@Controller
@RequestMapping("/InformationController.do")
public class ModelInformationController extends HihBaseController{
	@Autowired
	private ModelInformationService mis;
	@Autowired
	private ModelDictService dictService;
	
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/information/informationlist");
		
		List informationType = dictService.selectInformationType();
		
		List<ModelInformation> list = mis.selectPageByMap(null);
		List<String> infoType= list.stream().map(a -> a.getInfoType()).distinct().collect(Collectors.toList());
		mv.addObject("infoType",informationType);
		return mv;
	}
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		Page page = this.getPage(request);
		Map<String, Object> param = WebUtils.getParametersStartingWith(request,
				"information_");
		param.put("page", page);
		List<ModelInformation> list = mis.selectPageByMap(param);
		System.out.println(list);
		renderJson(list, page, response);
	}
	
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,HttpServletResponse response) {
		String[] infoIds = request.getParameterValues("infoIds");
		boolean flag = true;
		try {
			for (int i = 0; i < infoIds.length; i++) {
				//ModelInformation info = (ModelInformation) mis.selectDetailById(infoIds[i]);
				//String auditId = info.getAudit().getAuditId();
				//auditService.delete(auditId);
				mis.delete(infoIds[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + "}";
		this.renderJson(response, result);
	}
	
	@RequestMapping(params = "method=add")
	public ModelAndView add(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/model/information/informationform");
		List<ModelInformation> list = mis.selectPageByMap(null);
		List<String> infoType= list.stream().map(a -> a.getInfoType()).distinct().collect(Collectors.toList());
		List informationType = dictService.selectInformationType();
		mav.addObject("infoType",informationType);
		return mav;
	}
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response) {
		ModelInformation Information = new ModelInformation();
		this.setValue(request, Information);
		String creater = (String) request.getSession().getAttribute("user");
		Information.setCreater(creater);
		boolean flag = true;
		String msg = null;
		if(StringUtils.isEmpty(Information.getInfoId())) {
			Information.setInfoId(Identities.uuid());
			if(mis.selectByName(Information) != null) {
				msg = "信息名称已存在";
				flag = false;
			}else {
				
			
			mis.insert(Information);
			msg = "保存成功！";
			}
		}else{
			mis.update(Information);
			msg = "修改成功！";
		}

		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
	}
	
	 @RequestMapping(params = "method=modify") 
	 public ModelAndView modify(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/information/informationform"); 
		 String id =request.getParameter("id");
		 List<ModelInformation> list = mis.selectPageByMap(null);
		 List<String> infoType= list.stream().map(a -> a.getInfoType()).distinct().collect(Collectors.toList());
		 List informationType = dictService.selectInformationType();
		 mav.addObject("infoType",informationType);
		 ModelInformation Information = (ModelInformation) mis.selectDetailById(id);
		 mav.addObject("Information", Information); 
		 return mav; 
	 }
	@RequestMapping(params = "method=preview") 
	 public ModelAndView preview(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/information/informationpreview"); 
		 String id =request.getParameter("id");
		 List<ModelInformation> list = mis.selectPageByMap(null);
		 List<String> infoType= list.stream().map(a -> a.getInfoType()).distinct().collect(Collectors.toList());
		 List informationType = dictService.selectInformationType();
		 mav.addObject("infoType",informationType);
		 ModelInformation Information = (ModelInformation) mis.selectDetailById(id);
		 mav.addObject("Information", Information); 
		 return mav; 
	 }
	 
}

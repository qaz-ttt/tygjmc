package com.creatorblue.cbitedu.model.controller;

import java.util.HashMap;
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
import com.creatorblue.cbitedu.model.domain.ModelCar;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.domain.ModelNew;
import com.creatorblue.cbitedu.model.service.ModelAuditService;
import com.creatorblue.cbitedu.model.service.ModelCarService;
import com.creatorblue.cbitedu.model.service.ModelDictService;
import com.creatorblue.cbitedu.model.service.ModelImgService;
import com.creatorblue.cbitedu.model.service.ModelNewService;

@Controller
@RequestMapping("/auditController.do")
public class ModelAuditController extends HihBaseController{
	
	@Autowired
	private ModelAuditService auditService;
	
	@Autowired
	private ModelCarService<ModelCar> carService;
	
	@Autowired
	private ModelNewService newService;
	
	@Autowired
	private ModelImgService<ModelImg> imgServer;
	
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/audit/auditlist");
		List<ModelAudit> list = auditService.selectPageByMap(null);
		List<String> type = list.stream().map(a ->a.getAuditType()).distinct().collect(Collectors.toList());
		mv.addObject("Type",type);
		return mv;
	}
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		Page page = this.getPage(request);
		Map<String, Object> param = WebUtils.getParametersStartingWith(request,"audit_");
		
		param.put("auditResult", param.get("result"));
		param.remove("result");
		
		param.put("auditType", param.get("type"));
		param.remove("type");
		
		
		param.put("page", page);
		
		
		List<ModelAudit> list = auditService.selectPageByMap(param);
		System.out.println(list);
		renderJson(list, page, response);
	}
	
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,HttpServletResponse response) {
		String[] auditIds = request.getParameterValues("auditIds");
		boolean flag = true;
		try {
			for (int i = 0; i < auditIds.length; i++) {
				auditService.delete(auditIds[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + "}";
		this.renderJson(response, result);
	}
	
	@RequestMapping(params = "method=form")
	public ModelAndView add(HttpServletRequest request,
			HttpServletResponse response) {
			ModelAndView mav = new ModelAndView("/model/audit/auditform");
			return mav;
	}
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response) {
		ModelAudit audit = new ModelAudit();
		this.setValue(request, audit);
		boolean flag = true;
		String msg = null;
		audit.setAuditPeople((String) request.getSession().getAttribute("user"));
		audit.setCreater((String) request.getSession().getAttribute("user"));
		if(StringUtils.isEmpty(audit.getAuditId())) {
			audit.setAuditId(Identities.uuid());
			auditService.insert(audit);
			msg = "保存成功！";
		}else{
			auditService.update(audit);
			msg = "修改成功！";
		}

		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
	}
	
	 @RequestMapping(params = "method=modify") 
	 public ModelAndView modify(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/audit/auditform"); 
		 String id =request.getParameter("id"); 
		 ModelAudit audit = (ModelAudit)auditService.selectDetailById(id);
		 mav.addObject("audit", audit); 
		 return mav; 
	 }
	 @RequestMapping(params = "method=preview") 
	 public ModelAndView preview(HttpServletRequest request,HttpServletResponse response) {

		 ModelAndView mav = new ModelAndView(); 
		 String id =request.getParameter("id"); 

		 ModelAudit audit = (ModelAudit)auditService.selectDetailById(id);
		 if(audit.getAuditType().equals("汽车审核")) {
			 ModelCar car = carService.selectByAudit(audit.getAuditId());
			 String[] imgId = car.getImg().get(0).getImgId().split(",");
			 List<ModelImg> modelImg = imgServer.selectBeach(imgId);
			 
			 //图片
			 List<String> url = modelImg.stream().map(a ->a.getImgUrl()).collect(Collectors.toList());
			 String img="[";
			 for(int i=0;i<imgId.length;i++) {
				 img +="{\"url\" :"+"'"+url.get(i)+"'"+"},";
			 }
			 img = img.substring(0,img.length()-1);
			 img+="]";
			 mav.setViewName("/model/car/carpreview");
			 mav.addObject("car",car);
			 mav.addObject("title","预览汽车基本信息");
			 mav.addObject("url",img);
		 }
		 if(audit.getAuditType().equals("新闻审核")) {
			 ModelNew news = newService.selectnewByAudit(audit.getAuditId());
			 mav.setViewName("/model/new/newpreview");
			 mav.addObject("new",news);
			 mav.addObject("title","预览新闻基本信息");
		 }
		 
		
		 return mav; 
	 }
	 
	 
	 
	 
}

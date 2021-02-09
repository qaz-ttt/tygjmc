package com.creatorblue.cbitedu.model.controller;

import java.util.HashMap;
import java.util.Iterator;
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
import com.creatorblue.cbitedu.model.domain.ModelInformation;
import com.creatorblue.cbitedu.model.domain.ModelQuestion;
import com.creatorblue.cbitedu.model.service.ModelAuditService;
import com.creatorblue.cbitedu.model.service.ModelQuestionService;
import com.creatorblue.cbitedu.system.domain.TsysPost;

@Controller
@RequestMapping("/questionController.do")
public class ModelQuestionController extends HihBaseController{
	
	//问题服务
	@Autowired
	private ModelQuestionService mqs;
	

	
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/question/questionlist");
		return mv;
	}
	
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		Page page = this.getPage(request);
		
		Map<String, Object> param = WebUtils.getParametersStartingWith(request,"question_");
		
		
		param.put("page", page);
		
		List<ModelQuestion> list = mqs.selectPageByMap(param);
		
		renderJson(list, page, response);
	}
	
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,HttpServletResponse response) {
		String[] questionIds = request.getParameterValues("questionIds");
		boolean flag = true;
		try {
			for (int i = 0; i < questionIds.length; i++) {
				//ModelQuestion question = (ModelQuestion) mqs.selectDetailById(questionIds[i]);
				//String auditId = question.getAudit().getAuditId();
				//auditService.delete(auditId);
				mqs.delete(questionIds[i]);
				
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

		mav.setViewName("/model/question/questionform");
		return mav;
	}
	
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response) {
		ModelQuestion question = new ModelQuestion();
		this.setValue(request, question);
		
		String creater = (String) request.getSession().getAttribute("user");
	    question.setCreater(creater);
		boolean flag = true;
		String msg = null;
		
		if(StringUtils.isEmpty(question.getQuestionId())) {
			question.setQuestionId(Identities.uuid());

			//创建审核对象
			//ModelAudit audit = new ModelAudit();
			//audit.setAuditId(Identities.uuid());
			//audit.setAuditState("未审核");
			//audit.setAuditType("问题审核");
			//audit.setCreater(creater);
			//question.setAudit(audit);
			//auditService.insert(audit);
			mqs.insert(question);
			msg = "保存成功！";
		}else{
			mqs.update(question);
			msg = "修改成功！";
		}

		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
	}
	
	 @RequestMapping(params = "method=modify") 
	 public ModelAndView modify(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/question/questionform"); 
		 String id =request.getParameter("id"); 
		 ModelQuestion question = (ModelQuestion)mqs.selectDetailById(id);
		 mav.addObject("question", question); 
		 return mav; 
	 }
	 @RequestMapping(params = "method=preview") 
	 public ModelAndView preview(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/question/questionpreview"); 
		 String id =request.getParameter("id"); 
		 ModelQuestion question = (ModelQuestion)mqs.selectDetailById(id);
		 mav.addObject("question", question); 
		 return mav; 
	 }
}

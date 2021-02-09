	package com.creatorblue.cbitedu.model.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.core.page.Page;
import com.creatorblue.cbitedu.core.utils.Identities;
import com.creatorblue.cbitedu.model.domain.ModelAudit;
import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.domain.ModelNew;
import com.creatorblue.cbitedu.model.service.ModelAuditService;
import com.creatorblue.cbitedu.model.service.ModelNewService;



@Controller
@RequestMapping("/NewController.do")
public class ModelNewController extends HihBaseController {
	
	@Autowired
	private ModelNewService newService;
	@Autowired
	private ModelImgController imgController;
	@Autowired
	private ModelAuditService  auditService;
	
	@RequestMapping(params ="method=list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/new/newlist");
		return mv;
	}
	@RequestMapping(params ="method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		Page page = this.getPage(request);

		Map<String, Object> param = WebUtils.getParametersStartingWith(request,
				"post_");

		param.put("page", page);
		List<ModelNew> list = newService.select(param);
		log.info("数据几条" + list.size());
		renderJson(list, page, response);
	}
	/**
	 * 删除一条或多条数据
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,
			HttpServletResponse response) {
		String[] newIds = request.getParameterValues("newId");
		log.info(newIds);
		boolean flag = true;
		try {
			for (int i = 0; i <newIds.length; i++) {
			newService.delete(newIds[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + "}";
		this.renderJson(response, result);

	}
	
	/**
	 * 修改选中的数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=modify")
	public ModelAndView modify(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/model/new/newfrom");
		String id = request.getParameter("newId");
		log.info(id);
		ModelNew m = (ModelNew) newService.selectnewById(id);
		mav.addObject("new", m);
		return mav;
	}
	/*
	 * 预览
	 */
	@RequestMapping(params = "method=preview")
	public ModelAndView preview(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/model/new/newpreview");
		String id = request.getParameter("newId");
		ModelNew m = (ModelNew) newService.selectnewById(id);
		mav.addObject("new", m);
		return mav;
	}
	
	 
	/**
	 * 异步提交表单， 保存数据。
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="file", required = false) MultipartFile[] file) {
		ModelNew n = new ModelNew();
		this.setValue(request, n);
		
		if(file != null && !"".equals(file) ) {
			ModelImg img = new ModelImg();
       	 try {
       		 
       		img.setImgId(Identities.uuid());
				imgController.add(img, file,"新闻图片");
			} catch (Exception e) {
				
				e.printStackTrace();
			} finally {
				n.setImg(img);
			}
		}

				String creater = (String) request.getSession().getAttribute("user");
				n.setCreater(creater);
				n.setNewReleMan(creater);
				boolean flag = true;
				String msg = null;
				if(StringUtils.isEmpty(n.getNewId())) {
					n.setNewId(Identities.uuid());

					ModelAudit audit = new ModelAudit();
					audit.setAuditId(Identities.uuid());
					audit.setCreater(creater);
					audit.setAuditState("待审核");
					audit.setAuditType("新闻审核");
					audit.setAuditResult("");

					audit.setAuditTitle(n.getNewTitle());
				
					 auditService.insert(audit);
					 n.setAudit(audit);

					if(newService.selectBytitle(n) != null) {
						msg = "新闻标题存在";
						
					}else {
						newService.insert(n);
						msg = "保存成功！";
					}
				}else{
					newService.update(n);
					msg = "修改成功！";
				}
				
				String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
				this.renderJson(response, result);
	}
	
	/**
	 * 進入新增頁面， 并初始化新增页面所需要的数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=add")
	public ModelAndView add(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/model/new/newfrom");
		return mav;
	}


}

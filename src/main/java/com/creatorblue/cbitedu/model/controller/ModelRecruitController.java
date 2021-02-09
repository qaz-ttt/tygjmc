package com.creatorblue.cbitedu.model.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.core.page.Page;
import com.creatorblue.cbitedu.core.utils.Identities;
import com.creatorblue.cbitedu.model.domain.ModelAudit;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;
import com.creatorblue.cbitedu.model.service.ModelAuditService;
import com.creatorblue.cbitedu.model.service.ModelRecruitService;



@Controller
@RequestMapping("/recruitController.do")
public class ModelRecruitController extends HihBaseController{
	
	
	@Autowired
	private ModelRecruitService<ModelRecruit> modelRecruitService;
	
	
	//审核服务
	@Autowired
	private ModelAuditService  auditService;
	
	/**
	 * 访问列表， 并且初始化列表中所需的数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView("/model/recruit/modelRecruitlist");
		return mv;
	}
	
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		
		//获取当前请求的页面
		Page page = this.getPage(request);
		
		//获取一个比表单元素map集合，里面的元素的name都是以recruit_开头
		Map<String, Object> param = WebUtils.getParametersStartingWith(request,"reruit_");
		param.put("reruitName", param.get("name"));
		param.remove("name");
		//把当前的页面放到表单元素集合
		param.put("page", page);
		
		//获取的是根据表单数据查询的模糊查询集合
		List<ModelRecruit> list = modelRecruitService.select1(param);
		System.out.println(list);
		//转换为指定的数据类型，第一个参数是一个数据集合，第二个是需要转换的类型名称（与定义的javabean一致），第三个是参数类型
		this.convertParam(list, "modelRecruit", "modelRecruit");

		
		//直接返回数据，参数为：数据集合，页面，响应对象
		renderJson(list, page, response);
	}
	
	
	
	
	//跳转
	@RequestMapping(params = "method=form")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/model/recruit/modelRecruitform");
		String id = request.getParameter("id");
		ModelRecruit recruit = modelRecruitService.selectById(id);
		mav.addObject("recruit",recruit);
		return mav;
	}
	
	@RequestMapping(params = "method=preview")
	public ModelAndView preview(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/model/recruit/recruitpreview");
		String id = request.getParameter("id");
		ModelRecruit recruit = modelRecruitService.selectById(id);
		mav.addObject("recruit",recruit);
		return mav;
	}
	
	//删除
	@RequestMapping(params = "method=del")
	public void del(HttpServletRequest request, HttpServletResponse response) {
		String[] recryitIds = request.getParameterValues("ids");
		boolean flag = true;
		try {
			for (int i = 0; i < recryitIds.length; i++) {
				modelRecruitService.del(recryitIds[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + "}";
		this.renderJson(response, result);
	}
	
	
	
	/**
	 * 异步提交表单， 保存数据。
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request, HttpServletResponse response) {
		ModelRecruit recruit = new ModelRecruit();
		String creater = (String) request.getSession().getAttribute("user");
		recruit.setCreater(creater);
		
		this.setValue(request, recruit);
		boolean flag = true;
		String msg = null;
		try {
			
			if (StringUtils.isEmpty(recruit.getRecruitId())) {
				//创建审核对象
				ModelAudit audit = new ModelAudit();
				audit.setAuditId(Identities.uuid());
				audit.setAuditState("未审核");
				audit.setAuditType("招聘审核");
				audit.setAuditResult("未通过 ");

				audit.setCreater(creater);
				auditService.insert(audit);
				
				recruit.setAudit(audit);
				recruit.setRecruitId((Identities.uuid()));
				modelRecruitService.add(recruit);
				msg = "保存成功！";
			} else {
				modelRecruitService.update(recruit);
				msg = "修改成功！";
			}

		} catch (Exception e) {
			flag = false;
			msg = StringUtils.isEmpty(recruit.getRecruitId()) ? "保存失败！" : "修改失败";
			e.printStackTrace();
		}
		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
	}
	
}

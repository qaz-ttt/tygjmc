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
import com.creatorblue.cbitedu.model.domain.ModelDict;

import com.creatorblue.cbitedu.model.service.ModelDictService;


@Controller
@RequestMapping("/ModelDictController.do")
public class ModelDictController extends HihBaseController{
	
	
	@Autowired
	private ModelDictService dictService;
	
	
	/**
	 * 返回页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/dict/modelDictlist");
		List<ModelDict> list = dictService.list();
		request.getSession().setAttribute("list", list);
		mv.addObject("list",list);
		return mv;
	} 
	
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		
		//获取当前请求的页面
				Page page = this.getPage(request);
				
				//获取一个比表单元素map集合，里面的元素的name都是以recruit_开头
				Map<String, Object> param = WebUtils.getParametersStartingWith(request,"dict_");
				param.put("dictType", param.get("type"));
				param.remove("type");
				//把当前的页面放到表单元素集合
				param.put("page", page);
				
				//获取的是根据表单数据查询的模糊查询集合
				List<ModelDict> list1 = dictService.select(param);
				System.out.println(list1);
				//转换为指定的数据类型，第一个参数是一个数据集合，第二个是需要转换的类型名称（与定义的javabean一致），第三个是参数类型
				this.convertParam(list1, "modelDict", "modelDict");
				//直接返回数据，参数为：数据集合，页面，响应对象
				renderJson(list1, page, response);
	}
	
	
			//跳转
			@RequestMapping(params = "method=form")
			public ModelAndView form(HttpServletRequest request, HttpServletResponse response) {
				ModelAndView mav = new ModelAndView("/model/dict/modelDictform");
				String id = request.getParameter("id");
				ModelDict dict = dictService.selectById(id);
				mav.addObject("dict",dict);
				return mav;
			}
	
	
			//删除
			@RequestMapping(params = "method=del")
			public void del(HttpServletRequest request, HttpServletResponse response) {
				String[] dictIds = request.getParameterValues("ids");
				boolean flag = true;
				try {
					for (int i = 0; i < dictIds.length; i++) {
						dictService.del(dictIds[i]);
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
				ModelDict dict = new ModelDict();
				String creater = (String) request.getSession().getAttribute("user");
				dict.setCreater(creater);
				
				this.setValue(request, dict);
				boolean flag = true;
				String msg = null;
				try {
					if (!StringUtils.isEmpty(dict.getDictId())) {
						
						List result = dictService.selectexist(dict);
						
						if (result != null && result.size() > 0) {
							msg = "所选父节点下已经存在相同名称的岗位,请重新输入岗位名称！";
							String checkResult = "{\"flag\" : " + false
									+ " , \"msg\" : \"" + msg + "\"}";
							this.renderJson(response, checkResult);
							return;
						}
						
					}
					if (StringUtils.isEmpty(dict.getDictId())) {
						dict.setDictId((Identities.uuid()));
						dictService.add(dict);
						msg = "保存成功！";
					} else {
						dictService.edit(dict);
						msg = "修改成功！";
					}

				} catch (Exception e) {
					flag = false;
					msg = StringUtils.isEmpty(dict.getDictId()) ? "保存失败！" : "修改失败";
					e.printStackTrace();
				}
				String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
				this.renderJson(response, result);
			}
	
}

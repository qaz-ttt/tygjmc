package com.creatorblue.cbitedu.model.controller;


import java.util.List;
import java.util.Map;

import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.alibaba.druid.util.StringUtils;
import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.core.page.Page;
import com.creatorblue.cbitedu.core.utils.Identities;

import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.domain.ModelImg;

import com.creatorblue.cbitedu.model.service.ModelBrandService;

@Controller
@RequestMapping("/brandController.do")
public class ModelBrandController extends HihBaseController{
	
	@Autowired
	private ModelBrandService brandService;
	
	@Autowired
	private ModelImgController imgController;
	
	
	
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/brand/brandlist");
		List<ModelBrand> list = brandService.selectPageByMap(null);
		List<String>  brand= list.stream().map(a -> a.getBrandName()).distinct().collect(Collectors.toList());
		mv.addObject("list",brand);
		return mv;
	}
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		Page page = this.getPage(request);
		Map<String, Object> param = WebUtils.getParametersStartingWith(request,"brand_");
		param.put("page", page);
		List<ModelBrand> list = brandService.selectPageByMap(param);
		System.out.println(list);
		renderJson(list, page, response);
	}
	
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,HttpServletResponse response) {
		String[] brandIds = request.getParameterValues("brandId");
		boolean flag = true;
		String msg = null; 
		try {
			for (int i = 0; i < brandIds.length; i++) {
				if( brandService.selectCar(brandIds[i]) !=null && brandService.selectCar(brandIds[i])>0 ) {
					flag=false;
					msg= "删除失败，该品牌下还有汽车";
				}else {
					brandService.delete(brandIds[i]);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
	}
	
	@RequestMapping(params = "method=add")
	public ModelAndView add(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/model/brand/brandfrom");
		return mav;
	}
	@RequestMapping(params = "method=ajaxSave")
	@ResponseBody
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response ,@RequestParam(value="file", required = false) MultipartFile[] file){
		ModelBrand brand = new ModelBrand();
		this.setValue(request, brand);
		boolean flag = true;
		String msg = null;
		
		
		if(file != null && !"".equals(file)) {
			ModelImg img = new ModelImg();
       	 try {
       		 
       		img.setImgId(Identities.uuid());
				imgController.add(img, file,"品牌图片");

				

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				brand.setImg(img);
			}
		}
	
				String creater = (String) request.getSession().getAttribute("user");
				brand.setCreater(creater);

				if(StringUtils.isEmpty(brand.getBrandId())) {
					brand.setBrandId(Identities.uuid());
					if(brandService.selectByName(brand) != null) {
						msg = "品牌名称存在";
						flag = false;
					}else {
						brandService.insert(brand);
						msg = "保存成功！";
					}
				}else{
					brandService.update(brand);
					msg = "修改成功！";
				}
				

				String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
				this.renderJson(response, result);	
	}
	
	 @RequestMapping(params = "method=modify") 
	 public ModelAndView modify(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/brand/brandfrom"); 
		 String id =request.getParameter("brandId"); 
		 ModelBrand brand = (ModelBrand)brandService.selectDetailById(id);
		 mav.addObject("brand", brand); 
		 return mav; 
	 }
}

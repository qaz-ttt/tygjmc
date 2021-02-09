package com.creatorblue.cbitedu.model.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.alibaba.druid.util.StringUtils;
import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.core.page.Page;
import com.creatorblue.cbitedu.core.utils.Identities;
import com.creatorblue.cbitedu.model.controller.ModelImgController;
import com.creatorblue.cbitedu.model.domain.ModelAudit;
import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.domain.ModelCar;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.service.ModelAuditService;
import com.creatorblue.cbitedu.model.service.ModelBrandService;
import com.creatorblue.cbitedu.model.service.ModelCarService;
import com.creatorblue.cbitedu.model.service.ModelDictService;
import com.creatorblue.cbitedu.model.service.ModelImgService;

@Controller
@RequestMapping("/carController.do")
public class ModelCarController extends HihBaseController{
	@Autowired
	private ModelCarService mcs;
	
	@Autowired
	private ModelBrandService brandService;
	
	@Autowired
	private ModelDictService dictService;
	
	@Autowired
	private ModelImgController imgController;
	
	@Autowired
	private ModelImgService<ModelImg> imgServer;
	
	@Autowired
	private ModelAuditService<ModelAudit> auditService;
	
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/car/carlist");
		List<ModelBrand> brand = brandService.selectPageByMap(null);
		
		List<ModelDict> dict = dictService.select(null);
		
		List price = dict.stream().filter(a -> a.getDictType().equals("价格区间管理")).collect(Collectors.toList());
		List type = dict.stream().filter(a -> a.getDictType().equals("车辆类型管理")).collect(Collectors.toList());
		
		mv.addObject("brand",brand);
		mv.addObject("type",type);
		mv.addObject("price", price);
		request.getSession().setAttribute("brand", brand);
		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("price", price);
		return mv;
	}
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		
		Page page = this.getPage(request);
		Map<String, Object> param = WebUtils.getParametersStartingWith(request,"car_");
		param.put("page", page);
		List<ModelCar> list = mcs.selectPageByMap(param);
	
		renderJson(list, page, response);
	}
	
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,HttpServletResponse response) {
		String[] carIds = request.getParameterValues("carIds");
		boolean flag = true;
		try {
			for (int i = 0; i < carIds.length; i++) {
				mcs.delete(carIds[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + "}";
		this.renderJson(response, result);
	}
	
	@RequestMapping(params = "method=add")
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/model/car/carform");
		 mav.addObject("url","[]");
		return mav;
	}
	
	
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response) {
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
		
		
		//进行文件传值
		List<MultipartFile> file=multipartRequest.getFiles("file");
		MultipartFile[] fs=new MultipartFile[file.size()];
		for(int i=0;i<file.size();i++) {
			fs[i]=file.get(i);
		}
		
		
		
		ModelCar car = new ModelCar();
		this.setValue(request, car);
		boolean flag = true;
		String msg = null;
		String imgId="";
		if(file != null) {
			
			List<ModelImg> imgs=new ArrayList();
			ModelImg img =new ModelImg();
			
		   	 try {	
		   		 	for(int i=0;i<file.size();i++) {
			   		 	img.setImgId(Identities.uuid());
			   		 	imgId+=img.getImgId()+",";
						imgController.addBeach(img, fs[i],"汽车图片");
						imgs.add(img);
		   		 	}
		   		    
				} catch (Exception e) {	
					e.printStackTrace();

				} finally {
					car.setImg(imgs);
		}
		}
				String creater = (String) request.getSession().getAttribute("user");
				car.setCreater(creater);
		
		//创建之前先新建一个审核，在创建的时候绑定审核
		ModelAudit audit = new ModelAudit();
			audit.setAuditId(Identities.uuid());
			audit.setCreater(creater);
			audit.setAuditState("待审核");
			audit.setAuditType("汽车审核");
			audit.setAuditResult("");
			audit.setAuditTitle(car.getCarName());
			//同时创建审核表
			auditService.insert(audit);
			car.setAudit(audit);
			
		//设置品牌
		ModelBrand brand = new ModelBrand();
		String brandId = request.getParameter("brandId");
		brand.setBrandId(brandId);
		car.setBrand(brand);
		
		//设置价格区间
		ModelDict price = new ModelDict();
		String priceId =  request.getParameter("priceRange");
		price.setDictId(priceId);
		car.setPriceRange(price);
		
		
		//设置车辆类型
		ModelDict type = new ModelDict();
		String typeId=request.getParameter("carType");
		type.setDictId(typeId);
		car.setCarType(type);
		car.setCreater((String) request.getSession().getAttribute("user"));
		
		if(StringUtils.isEmpty(car.getCarId())) {
			car.setCarId(Identities.uuid());
			if(mcs.selectCountBytitle(car.getCarName()) >= 1) {
				msg = "汽车名称重复";
			}else {
				mcs.insert(car);
				msg = "保存成功！";
			}
		}else{
			mcs.update(car);
			msg = "修改成功！";
		}
		Map<String, Object> param =new HashMap();
		param.put("carId", car.getCarId());
	
	
		if(imgId.length() !=0) {
			imgId = imgId.substring(0,imgId.length()-1);
			param.put("imgId", imgId);
			mcs.updateImg(param);
			
		}
		
		
		
		
		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
		
		
	}
	
	 @RequestMapping(params = "method=modify") 
	 public ModelAndView modify(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/car/carform"); 
		 String id =request.getParameter("id"); 
		 ModelCar car = (ModelCar)mcs.selectDetailById(id);
		 String[] imgId = car.getImg().get(0).getImgId().split(",");
		 List<ModelImg> modelImg = imgServer.selectBeach(imgId);
		 List<String> url = modelImg.stream().map(a ->a.getImgUrl()).collect(Collectors.toList());
		 String img="[";
		 for(int i=0;i<imgId.length;i++) {
			 img +="{\"url\" :"+"'"+url.get(i)+"'"+"},";
		 }
		 img = img.substring(0,img.length()-1);
		 img+="]";
		 System.out.println(img);
		 List<ModelBrand> brand = brandService.selectPageByMap(null);
		 List<ModelDict> dict = dictService.select(null);
		 List price = dict.stream().filter(a -> a.getDictType().equals("价格区间管理")).collect(Collectors.toList());
		 mav.addObject("price",price);
		 mav.addObject("brand",brand);
		 List type = dict.stream().filter(a -> a.getDictType().equals("车辆类型管理")).collect(Collectors.toList());
		 mav.addObject("type",type);
		 mav.addObject("car", car);
		 mav.addObject("url",img);
		 return mav; 
	 }
	 
	 
	 @RequestMapping(params = "method=preview") 
	 public ModelAndView preview(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/car/carpreview"); 
		 String id =request.getParameter("id"); 
		 ModelCar car = (ModelCar)mcs.selectDetailById(id);
		 String[] imgId = car.getImg().get(0).getImgId().split(",");
		 List<ModelImg> modelImg = imgServer.selectBeach(imgId);
		 List<String> url = modelImg.stream().map(a ->a.getImgUrl()).collect(Collectors.toList());
		 String img="[";
		 for(int i=0;i<imgId.length;i++) {
			 img +="{\"url\" :"+"'"+url.get(i)+"'"+"},";
		 }
		 img = img.substring(0,img.length()-1);
		 img+="]";
		 System.out.println(img);
		 List<ModelBrand> brand = brandService.selectPageByMap(null);
		 List<ModelDict> dict = dictService.select(null);
		 List price = dict.stream().filter(a -> a.getDictType().equals("价格区间管理")).collect(Collectors.toList());
		 mav.addObject("price",price);
		 mav.addObject("brand",brand);
		 List type = dict.stream().filter(a -> a.getDictType().equals("车辆类型管理")).collect(Collectors.toList());
		 mav.addObject("type",type);
		 mav.addObject("car", car);
		 mav.addObject("url",img);
		 return mav; 
	 }
}

package com.creatorblue.cbitedu.car.controller;

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

import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.domain.ModelCar;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;
import com.creatorblue.cbitedu.model.service.ModelBrandService;
import com.creatorblue.cbitedu.model.service.ModelCarService;
import com.creatorblue.cbitedu.model.service.ModelDictService;
import com.creatorblue.cbitedu.model.service.ModelImgService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/api/rulecar.do")
public class RuleCarController extends HihBaseController{
	
	//图片的service
		@Autowired
		private ModelImgService<ModelImg> imgService;
		
		//品牌的service
		@Autowired
		private ModelBrandService<ModelBrand> brandService;
		
		//字典表（用于查询价格区间和类型）
		@Autowired
		private ModelDictService<ModelDict> dictService;
		
		//汽车表
		@Autowired
		private ModelCarService<ModelCar> carService;
		
		
		@RequestMapping(params = "method=query")
		public ModelAndView show(HttpServletRequest request,HttpServletResponse response,Integer pageNum,Integer pageSize) {
			
			String brandPara = request.getParameter("brandName");			//品牌
			String typePara = request.getParameter("CarType");				//类型
			String pricePara = request.getParameter("price");			//价格区间 15~20w
			
			request.setAttribute("qaz", brandPara);
			
			
			ModelAndView mv = new ModelAndView("car/rule-car");
			Map<String, Object> param=new HashMap();
			
			
			//品牌
		 	param.put("brandState","上架");
			param.put("brandName", request.getParameter("brand"));
			List brand = brandService.selectPageByMap(param);
			mv.addObject("brand",brand);
			
			
			//价格区间和类型
			param.put("dictType","价格区间管理");
			List price = dictService.select(param);
			mv.addObject("price",price);
			
			param.put("dictType","车辆类型管理");
			List type = dictService.select(param);
			mv.addObject("type",type);
			
			//汽车
			param.put("","已通过" );
			param.put("carType",request.getParameter("carType"));
			param.put("priceRange",request.getParameter("priceRange"));
			param.put("brandName",request.getParameter("brandName"));
			if(pageNum == null) {
				pageNum=1;
			}
			if(pageSize == null) {
				pageSize=12;
			}
			PageHelper.startPage(pageNum, pageSize);
			List<ModelCar> list= carService.selectPageByMap(param);
			if(pricePara!=null) {
				
				//过滤
				list = list.stream().filter(a -> a.getPriceRange().getDictValue().equals(pricePara)).collect(Collectors.toList());
//				for(ModelCar c: list) {
//					if(!c.getPriceRange().getDictValue().equals(pricePara)) {
//						list.remove(c);
//					}
//				}
			}
			List<String> imgIds = list.stream().map(a ->a.getImg().get(0).getImgId()).collect(Collectors.toList());
			
			for(int i=0;i<list.size();i++) {
				String[] L = imgIds.get(i).split(",");
				
				List<ModelImg> img = imgService.selectBeach(L);
				list.get(i).setImg(img);
				
			}
			PageInfo<ModelCar> page = new PageInfo<ModelCar>(list);
			
			mv.addObject("car",list);
			//分页

			mv.addObject("page",page);
			return mv;
		}
		
		@RequestMapping(params = "method=queryById")
		public ModelAndView showRead(HttpServletRequest request,HttpServletResponse response,ModelCar car) {
			 ModelAndView mv = new ModelAndView("car/car-read");
			 
			 Map<String, Object> param=new HashMap();
				//热销
					param.clear();
					param.put("carSellNum1","123");
					List<ModelCar> recommend = carService.selectPageByMap(param);
					List<String> imgIds = recommend.stream().map(a ->a.getImg().get(0).getImgId()).collect(Collectors.toList());
					
					for(int i=0;i<recommend.size();i++) {
						String[] L = imgIds.get(i).split(",");
						
						List<ModelImg> img = imgService.selectBeach(L);
						recommend.get(i).setImg(img);
						
					}
					mv.addObject("recommend",recommend);
					
					//新推荐
					param.clear();
					param.put("createDate1","123");
					List<ModelCar> sellCar = carService.selectPageByMap(param);
					imgIds = sellCar.stream().map(a ->a.getImg().get(0).getImgId()).collect(Collectors.toList());
					
					for(int i=0;i<sellCar.size();i++) {
						String[] L = imgIds.get(i).split(",");
						
						List<ModelImg> img = imgService.selectBeach(L);
						sellCar.get(i).setImg(img);
						
					}
					mv.addObject("sellCar",sellCar);
					
			
			 ModelCar cars = carService.selectDetailById(car.getCarId());
			 mv.addObject("car",cars);
			 
			 List<String>  imgs= cars.getImg().stream().map(a ->a.getImgId()).collect(Collectors.toList());
			 String id="";
			
			 for(int i=0;i<imgs.size();i++) {
				 id=imgs.get(i);
			 }
			String[] ids = id.split(",");
			 System.out.println(ids);
			 List img = imgService.selectBeach(ids);
			 mv.addObject("img",img);
			 
			
			 return mv;
			
		}
	
}

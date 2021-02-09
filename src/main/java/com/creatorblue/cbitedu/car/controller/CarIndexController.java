package com.creatorblue.cbitedu.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.domain.ModelCar;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.domain.ModelInformation;
import com.creatorblue.cbitedu.model.domain.ModelNew;
import com.creatorblue.cbitedu.model.domain.ModelQuestion;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;
import com.creatorblue.cbitedu.model.service.ModelBrandService;
import com.creatorblue.cbitedu.model.service.ModelCarService;
import com.creatorblue.cbitedu.model.service.ModelDictService;
import com.creatorblue.cbitedu.model.service.ModelImgService;
import com.creatorblue.cbitedu.model.service.ModelInformationService;
import com.creatorblue.cbitedu.model.service.ModelNewService;
import com.creatorblue.cbitedu.model.service.ModelQuestionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller

public class CarIndexController extends HihBaseController {
	
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
	
	//新闻表
	@Autowired
	private ModelNewService newService;
	
	//站点表
	@Autowired
	private ModelQuestionService<ModelQuestion> questionService;
	
	
	@RequestMapping("/api/index.do")
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) {

		String brandPara = request.getParameter("brand");			//品牌
		String typePara = request.getParameter("type");				//类型
		String pricePara = request.getParameter("price");			//价格区间 15~20w
		
		
		
		
		ModelAndView mv = new ModelAndView("car/index");
		//轮播图
		Map<String, Object> param=new HashMap();
		param.put("imgType", "轮播");
		List lb = imgService.selectPageByMap(param);
		mv.addObject("lb",lb);
		
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
		param.put("result","已通过" );
		param.put("carType",request.getParameter("carType"));
		param.put("priceRange",request.getParameter("priceRange"));
		param.put("brandName",request.getParameter("brandName"));
		param.put("limit","9");

		List<ModelCar> car = carService.selectPageByMap(param);
		if(pricePara!=null) {
			
			//过滤
			car.stream().filter(a -> a.getPriceRange().equals(pricePara)).collect(Collectors.toList());
		}
		
		List<String> imgIds = car.stream().map(a ->a.getImg().get(0).getImgId()).collect(Collectors.toList());
		
		for(int i=0;i<car.size();i++) {
			String[] L = imgIds.get(i).split(",");
			
			List<ModelImg> img = imgService.selectBeach(L);
			car.get(i).setImg(img);
			
		}
		
		mv.addObject("car",car);
		
		
		//新推荐
		param.clear();
		param.put("carSellNum","123");
		List<ModelCar> recommend = carService.selectPageByMap(param);
		imgIds = recommend.stream().map(a ->a.getImg().get(0).getImgId()).collect(Collectors.toList());
		
		for(int i=0;i<recommend.size();i++) {
			String[] L = imgIds.get(i).split(",");
			
			List<ModelImg> img = imgService.selectBeach(L); 	
			recommend.get(i).setImg(img);
			
		}
		mv.addObject("recommend",recommend);
		
		//热销
		param.clear();
		param.put("createDate","123");
		List<ModelCar> sellCar = carService.selectPageByMap(param);
		imgIds = sellCar.stream().map(a ->a.getImg().get(0).getImgId()).collect(Collectors.toList());
		for(int i=0;i<sellCar.size();i++) {
			String[] L = imgIds.get(i).split(",");
			
			List<ModelImg> img = imgService.selectBeach(L); 	
			sellCar.get(i).setImg(img);
			
		}
		mv.addObject("sellCar",sellCar);
		
		
		
		
		//新闻
		param.clear();
		param.put("size", "123");
		List<ModelNew> new1 = newService.select(param);
		param.put("newType", "首页动态");
		List<ModelNew> new2 = newService.select(param);
		mv.addObject("new1",new1);
		mv.addObject("new2",new2);			//待优化，只能有一个，所以说不能当存在的时候不能进行创建
		
		
		//问题
		param.clear();
		param.put("Num","123");
		List question = questionService.selectPageByMap(param);
		mv.addObject("question",question);
		return mv;
		
	}
	@RequestMapping("/api/questionContent.do")
	public ModelAndView questionContent(HttpServletRequest request,HttpServletResponse response,String id) {
		ModelAndView mv = new ModelAndView("/car/questionContent");
		ModelQuestion questionContent = questionService.selectDetailById(id);
		mv.addObject("questionContent",questionContent);
		return mv;
	}
	@RequestMapping("/api/questionMore.do")
	public ModelAndView questionMore(HttpServletRequest request,HttpServletResponse response,Integer pageNum,Integer pageSize) {
		if(pageNum == null) {
			pageNum=1;
		}
		if(pageSize == null) {
			pageSize=4;
		}
		PageHelper.startPage(pageNum, pageSize);
		ModelAndView mv = new ModelAndView("/car/questionMore");
		List question = questionService.selectPageByMap(null);
		mv.addObject("question",question);
		PageInfo<ModelRecruit> page = new PageInfo<ModelRecruit>(question);		
		mv.addObject("page",page);
		
		return mv;
	}
}

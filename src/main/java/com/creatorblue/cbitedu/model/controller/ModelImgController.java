package com.creatorblue.cbitedu.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.alibaba.fastjson.JSONObject;
import com.creatorblue.cbitedu.core.baseclass.controller.HihBaseController;
import com.creatorblue.cbitedu.core.page.Page;
import com.creatorblue.cbitedu.core.utils.Identities;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.core.utils.PropertiesUtil;
import com.creatorblue.cbitedu.model.domain.ToJson;
import com.creatorblue.cbitedu.model.service.ModelDictService;
import com.creatorblue.cbitedu.model.service.ModelImgService;

@PropertySource(value={"classpath:dev.properties"}) 
@Controller
@RequestMapping("/imgController.do")

public class ModelImgController extends HihBaseController{
	
	@Autowired
	private ModelImgService imgService;
	@Autowired
	private ModelDictService dictService;
	
	ModelImgController(){
		File file=new File(PropertiesUtil.getValue("dev.fileUrl"));
		if(!file.exists())
			file.mkdirs();
	}

	/**
	 * 图片上传
	 * @param img
	 * @param file
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(params = "method=add")
	@ResponseBody
	public String add(ModelImg img ,@RequestParam(value="file",required=false) MultipartFile[] file,String imgType) throws IllegalStateException, IOException {

		String imgString = JSONObject.toJSONString(img);
		if(imgString.equals("{}")) {
			  img = new ModelImg();
			  img.setImgId(Identities.uuid());
		  }
		String json="";
		if(file !=null && !"".equals(file))
			for(int i=0;i<file.length;i++) {
				String aaa = file[i].getOriginalFilename();
				String fileName =Identities.uuid()+"."+file[i].getOriginalFilename().substring(aaa.lastIndexOf(".")+1);
				  
				  img.setImgName(fileName);
				
				  img.setImgUrl(PropertiesUtil.getValue("dev.imgUrl")+fileName);

				  ToJson to = new ToJson();
				  to.setLocation(img.getImgUrl());
				  json = JSONObject.toJSONString(to);
				  file[i].transferTo(new File(PropertiesUtil.getValue("dev.fileUrl")+"//"+fileName));
				  img.setImgType(imgType);
	
				 imgService.add(img);
			}
	
			return json;
	}
	
	
	
	
	
	/**
	 * 图片批量上传
	 * @param img
	 * @param file
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(params = "method=addBeach")
	@ResponseBody
	public void addBeach(ModelImg img ,@RequestParam(value="file",required=false) MultipartFile file,String imgType) throws IllegalStateException, IOException {
		String imgString = JSONObject.toJSONString(img);
		if(imgString.equals("{}")) {
			  img = new ModelImg();
			  img.setImgId(Identities.uuid());
		  }
		
		if(file !=null) {
			String aaa = file.getOriginalFilename();
			String fileName =Identities.uuid()+"."+file.getOriginalFilename().substring(aaa.lastIndexOf(".")+1);
			  
			  img.setImgName(fileName);
			 
			  img.setImgUrl(PropertiesUtil.getValue("dev.imgUrl")+fileName);

			  ToJson to = new ToJson();
			  to.setLocation(img.getImgUrl());
			 
			  file.transferTo(new File(PropertiesUtil.getValue("dev.fileUrl")+"//"+fileName));
			  img.setImgType(imgType);

			 imgService.add(img);
			
		}		
	}
	
	@RequestMapping(params = "method=list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/model/img/imglist");
			
		return mv;
	}
	
	
	@RequestMapping(params = "method=query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		Page page = this.getPage(request);
		Map<String, Object> param = new HashMap();
		param.put("imgType", "轮播图");
		param.put("page", page);
		
		List<ModelImg> list = imgService.selectPageByMap(param);
//		Date date = new Date();																//当前时间
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");				//时间格式
//		Calendar calendar = Calendar.getInstance();
		
//		//比较开始时间
//		list = list.stream().filter(a ->{
//			try {
//				return sdf.parse(a.getImgStartTime()).getTime()<=date.getTime();
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			return false;
//		}).collect(Collectors.toList());
//		
//		
//		//比较结束时间
//		list = list.stream().filter(b ->{
//			try {
//				return sdf.parse(b.getImgEndTime()).getTime()>=date.getTime();
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			return false;
//		}).collect(Collectors.toList());
		
		
		renderJson(list, page, response);
	}
	
	
	@RequestMapping(params = "method=del")
	public void deleteById(HttpServletRequest request,HttpServletResponse response) {
		String[] imgIds = request.getParameterValues("imgIds");
		boolean flag = true;
		try {
			for (int i = 0; i < imgIds.length; i++) {
				imgService.delete(imgIds[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		String result = "{\"flag\" : " + flag + "}";
		this.renderJson(response, result);
	}
	
	
	@RequestMapping(params = "method=jumpadd")
	public ModelAndView add1(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		List<ModelDict> list = dictService.selectImgType();
		
		mav.addObject("imgType",list);
		mav.setViewName("/model/img/imgfrom");
		return mav;
	}
	
	
	@RequestMapping(params = "method=ajaxSave")
	public void ajaxSave(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="file", required = false) MultipartFile[] file) {
		ModelImg img = new ModelImg();
		this.setValue(request, img);
		img.setImgType("轮播图");
		boolean flag = true;
		String msg = null;
		
   	 try {
   		 add(img,file,img.getImgType());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(StringUtils.isEmpty(img.getImgId())) {
				log.info("nanananaananananananaananananananananananananananananana"+img.getImgId());
				img.setImgId(Identities.uuid());
				imgService.add(img);
				msg = "新增成功！";
			}else{
				imgService.update(img);
				msg = "修改成功！";
		}
			
		}
		String result = "{\"flag\" : " + flag + " , \"msg\" : \"" + msg + "\"}";
		this.renderJson(response, result);
	}
	
	
	
	 @RequestMapping(params = "method=modify") 
	 public ModelAndView modify(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("/model/img/imgfrom"); 
		 String id =request.getParameter("imgId"); 
		 ModelImg img = (ModelImg)imgService.selectDetailById(id);
		 List<ModelDict> list = dictService.selectImgType();
		 mav.addObject("imgType",list);
		 mav.addObject("img", img); 
		 return mav; 
	 }

}

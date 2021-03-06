package com.easycms.common;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
public class FreeMarkerUtils {
	 private static  Configuration config = new Configuration();   
     
	    /** 
	     * @param templateName 模板名字 
	     * @param root 模板根 用于在模板内输出结果集 
	     * @param out 输出对象 具体输出到哪里 
	     */  
	    public static void processTemplate(String templateName, Map<?,?> root, String resultPath){  
	    	Writer out = null;
	        try{  
	            //获得模板  
	            Template template=config.getTemplate(templateName,"UTF-8");  
	            //生成文件（这里是我们是生成html）  
	            out = new OutputStreamWriter(new FileOutputStream(new File(resultPath)), "UTF-8" );
	            template.process(root, out);     
	            out.flush();     
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        } catch (TemplateException e) {  
	            e.printStackTrace();  
	        }finally{  
	             try {  
	                out.close();  
	                out=null;  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
	    /** 
	     * 初始化模板配置 
	     * @param servletContext javax.servlet.ServletContext 
	     * @param templateDir 模板位置 
	     */  
	    public static void initConfig(ServletContext servletContext,String templateDir){  
	            config.setLocale(Locale.CHINA);  
	            config.setDefaultEncoding("UTF-8");  
	            config.setEncoding(Locale.CHINA, "UTF-8");  
	            config.setServletContextForTemplateLoading(servletContext, templateDir);  
	            config.setObjectWrapper(new DefaultObjectWrapper());  
	    }  
}

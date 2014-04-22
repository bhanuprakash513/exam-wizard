package com.quizcomm.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.HttpRequestHandler;


@Component("imageServlet")
public class ImageServlet implements HttpRequestHandler {

    public void handleRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {           
    	// get the thumb from the user entity
    	String requestURL = request.getPathInfo();
    	String fileName;
    	if(requestURL.startsWith("/"))
    		fileName =requestURL.substring(1);
    	else
    		fileName =requestURL;
    	String path = null;
    	ServletContext ctx= request.getSession().getServletContext();
    	if(!StringUtils.isEmpty(fileName)&& fileName.endsWith(".png")){    		    	
        	String dir= ctx.getInitParameter("profileDir");
        	path=dir+fileName;
    	}
    	File f =null;
    	String tmpPath= ctx.getRealPath("resources/images/avatar.png");
    	if(!StringUtils.isEmpty(path) ){
    		f = new File(path);
    		if(!f.exists())
    			f=new File(tmpPath);
    	}else{
    		
    		f=new File(tmpPath);
    	}
    	if(!f.exists()){
	    		response.sendError(HttpServletResponse.SC_NOT_FOUND);
	    		return;
    		}
        response.setContentType("image/jpeg");
        response.setContentLength((int) f.length());
        response.setHeader("Content-Disposition", "inline; filename=\"" + fileName
                + "\"");

        BufferedInputStream input = null;
        BufferedOutputStream output = null;
        boolean error =false;
        try {
            input = new BufferedInputStream(new FileInputStream(f));
            output = new BufferedOutputStream(response.getOutputStream());
            byte[] buffer = new byte[8192];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        } catch (IOException e) {
            System.out.println("There are errors in reading/writing image stream "
                    + e.getMessage());
            error =true;
        } finally {
            if (output != null)
                try {
                    output.close();
                } catch (IOException ignore) {
                }
            if (input != null)
                try {
                    input.close();
                } catch (IOException ignore) {
                }
        }
        if(error)
        	response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
}
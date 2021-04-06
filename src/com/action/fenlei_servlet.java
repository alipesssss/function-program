package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tfenlei;
import com.orm.Tgoods;
import com.orm.Tuser;

public class fenlei_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		if(type.endsWith("fenleiAdd"))
		{
			fenleiAdd(req, res);
		}
		if(type.endsWith("fenleiMana"))
		{
			fenleiMana(req, res);
		}
		if(type.endsWith("fenleiDel"))
		{
			fenleiDel(req, res);
		}
		if(type.endsWith("fenleiDetailQian"))
		{
			fenleiDetailQian(req, res);
		}
		if(type.endsWith("fenleiList"))
		{
			fenleiList(req, res);
		}
		if(type.endsWith("fenleiid"))
		{
			fenleiid(req, res);
		}
		if(type.endsWith("fenleiUpdate"))
		{
			fenleiUpdate(req, res);
		}
		
	}
	public void fenleiAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String fenleiName=req.getParameter("fenleiName");
		String fenleiNeirong=req.getParameter("fenleiNeirong");
		
		String sql="insert into t_fenlei(id,fenleiName,fenleiNeirong) values(?,?,?)";
		Object[] params={id,fenleiName,fenleiNeirong};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "添加成功");
		req.setAttribute("path", "fenlei?type=fenleiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	public void fenleiDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_fenlei where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "fenlei?type=fenleiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void fenleiid(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List fenleiList=new ArrayList();
		String id = req.getParameter("id");
		String sql = "select * from t_fenlei where id = ?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tfenlei fenlei=new Tfenlei();
				
				fenlei.setId(rs.getString("id"));
				fenlei.setFenleiName(rs.getString("fenleiName"));
				fenlei.setFenleiNeirong(rs.getString("fenleiNeirong"));
				fenleiList.add(fenlei);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("fenleixx", fenleiList);
		req.getRequestDispatcher("admin/fenlei/fenleiEdit.jsp").forward(req, res);
	}
	public void fenleiUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		String id = req.getParameter("id");
		String fenleiName=req.getParameter("fenleiName");
		String fenleiNeirong=req.getParameter("fenleiNeirong");
		String sql="Update t_fenlei set fenleiName=?,fenleiNeirong=? where id=?";
		Object[] params={fenleiName,fenleiNeirong,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "修改成功");
		req.setAttribute("path", "fenlei?type=fenleiMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void fenleiMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List fenleiList=new ArrayList();
		String sql="select * from t_fenlei";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tfenlei fenlei=new Tfenlei();
				
				fenlei.setId(rs.getString("id"));
				fenlei.setFenleiName(rs.getString("fenleiName"));
				fenlei.setFenleiNeirong(rs.getString("fenleiNeirong"));
				fenleiList.add(fenlei);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("fenleiList", fenleiList);
		req.getRequestDispatcher("admin/fenlei/fenleiMana.jsp").forward(req, res);
	}
	public void fenleiList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List fenleiList=new ArrayList();
		String sql="select * from t_fenlei";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
	           Tfenlei fenlei=new Tfenlei();
				
				fenlei.setId(rs.getString("id"));
				fenlei.setFenleiName(rs.getString("fenleiName"));
				fenlei.setFenleiNeirong(rs.getString("fenleiNeirong"));
				fenleiList.add(fenlei);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("fenleiList", fenleiList);
		req.getRequestDispatcher("qiantai/fenlei/fenleiList.jsp").forward(req, res);
	}
	public void fenleiDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tfenlei fenlei=new Tfenlei();
		
		String sql="select * from t_fenlei where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			fenlei.setId(rs.getString("id"));
			fenlei.setFenleiName(rs.getString("fenleiName"));
			fenlei.setFenleiNeirong(rs.getString("fenleiNeirong"));
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("fenlei", fenlei);
		req.getRequestDispatcher("/qiantai/fenlei/fenleiDetailQian.jsp").forward(req, res);
	}
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}

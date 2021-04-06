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
import com.orm.Tgonggao;
import com.orm.Tuser;

public class gonggao_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("gonggaoAdd"))
		{
			gonggaoAdd(req, res);
		}
		if(type.endsWith("gonggaoMana"))
		{
			gonggaoMana(req, res);
		}
		if(type.endsWith("gonggaoDel"))
		{
			gonggaoDel(req, res);
		}
		if(type.endsWith("gonggaoDetail"))
		{
			gonggaoDetail(req, res);
		}
		
		if(type.endsWith("gonggaoDetailQian"))
		{
			gonggaoDetailQian(req, res);
		}
		if(type.endsWith("gonggaoList"))
		{
			gonggaList(req, res);
		}
		if(type.endsWith("jifenAdd"))
		{
			jifenAdd(req, res);
		}
		if(type.endsWith("gonggaoMana1"))
		{
			gonggaoMana1(req, res);
		}
		if(type.endsWith("gonggaoMana2"))
		{
			gonggaoMana2(req, res);
		}
	}
	
	
	public void gonggaoAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		int jifen=0;
		String shijian=new Date().toLocaleString();
		Tuser user=(Tuser)req.getSession().getAttribute("user");
	    int user_id=user.getId();
		
		String sql="insert into t_gonggao(id,title,content,shijian,jifen,yonghuID) values(?,?,?,?,?,?)";
		Object[] params={id,title,content,shijian,jifen,user_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "添加成功");
		req.setAttribute("path", "gonggao?type=gonggaoMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	
	public void gonggaoDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_gonggao where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "gonggao?type=gonggaoMana1");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void gonggaoMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Tuser user=(Tuser)req.getSession().getAttribute("user");
	    int user_id=user.getId();
		List gonggaoList=new ArrayList();
		String sql="select * from t_gonggao where yonghuID="+user_id+" ";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgonggao gonggao=new Tgonggao();
				
				gonggao.setId(rs.getString("id"));
				gonggao.setTitle(rs.getString("title"));
				gonggao.setContent(rs.getString("content"));
				gonggao.setShijian(rs.getString("shijian"));
				gonggao.setJifen(rs.getInt("jifen"));
				gonggaoList.add(gonggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggaoList", gonggaoList);
		req.getRequestDispatcher("qiantai/xinwen/myxinwen.jsp").forward(req, res);
	}
	public void gonggaList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List gonggaoList=new ArrayList();
		String sql="select * from t_gonggao";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgonggao gonggao=new Tgonggao();
				
				gonggao.setId(rs.getString("id"));
				gonggao.setTitle(rs.getString("title"));
				gonggao.setContent(rs.getString("content"));
				gonggao.setShijian(rs.getString("shijian"));
				gonggao.setJifen(rs.getInt("jifen"));
				gonggaoList.add(gonggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggaoList", gonggaoList);
		req.getRequestDispatcher("qiantai/xinwen/xinwenQuery.jsp").forward(req, res);
	}
	
	public void gonggaoDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tgonggao gonggao=new Tgonggao();
		
		String sql="select * from t_gonggao where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			gonggao.setId(rs.getString("id"));
			gonggao.setTitle(rs.getString("title"));
			gonggao.setContent(rs.getString("content"));
			gonggao.setShijian(rs.getString("shijian"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggao", gonggao);
		req.getRequestDispatcher("admin/gonggao/gonggaoDetail.jsp").forward(req, res);
	}
	
	public void gonggaoDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tgonggao gonggao=new Tgonggao();
		
		String sql="select * from t_gonggao where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			gonggao.setId(rs.getString("id"));
			gonggao.setTitle(rs.getString("title"));
			gonggao.setContent(rs.getString("content"));
			gonggao.setShijian(rs.getString("shijian"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggao", gonggao);
		req.getRequestDispatcher("/qiantai/xinwen/xinwenDetailQian.jsp").forward(req, res);
	}
	public void gonggaoMana2(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List gonggaoList=new ArrayList();
		String sql="select * from t_gonggao where jifen=0";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgonggao gonggao=new Tgonggao();
				
				gonggao.setId(rs.getString("id"));
				gonggao.setTitle(rs.getString("title"));
				gonggao.setContent(rs.getString("content"));
				gonggao.setShijian(rs.getString("shijian"));
				gonggao.setJifen(rs.getInt("jifen"));
				gonggaoList.add(gonggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggaoList", gonggaoList);
		req.getRequestDispatcher("admin/gonggao/gonggaoMana.jsp").forward(req, res);
	}
	public void gonggaoMana1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{

		List gonggaoList=new ArrayList();
		String sql="select * from t_gonggao";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgonggao gonggao=new Tgonggao();
				
				gonggao.setId(rs.getString("id"));
				gonggao.setTitle(rs.getString("title"));
				gonggao.setContent(rs.getString("content"));
				gonggao.setShijian(rs.getString("shijian"));
				gonggao.setJifen(rs.getInt("jifen"));
				gonggaoList.add(gonggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggaoList", gonggaoList);
		req.getRequestDispatcher("admin/gonggao/gonggaoDel.jsp").forward(req, res);
	}
	public void jifenAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		int jifen=Integer.parseInt(req.getParameter("jifen"));	
		DB mydb=new DB();
		
		String sql="Update t_gonggao set jifen=? where id=?";
		Object[] params={jifen,id};
		mydb.doPstm(sql, params);
		
		String sql1="Update t_user set jifen=jifen+? where id =(select yonghuID from t_gonggao where id=?)";
		Object[] params1={jifen,id};
		mydb.doPstm(sql1, params1);
		mydb.closed();
		
		req.setAttribute("message", "给予积分成功");
		req.setAttribute("path", "gonggao?type=gonggaoMana2");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
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

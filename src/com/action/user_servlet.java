package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
import com.orm.Tuser;

public class user_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("userReg"))
		{
			userReg(req, res);
		}
		if(type.endsWith("userLogout"))
		{
			userLogout(req, res);
		}
		if(type.endsWith("userUpdate"))
		{
			userUpdate(req, res);
		}
		if(type.endsWith("userMana"))
		{
			userMana(req, res);
		}
		if(type.endsWith("huiyuanshezhi"))
		{
			huiyuanshezhi(req, res); 
		}
		if(type.endsWith("userXinxi"))
		{
			userXinxi(req, res);
		}
		
		if(type.endsWith("userMana1"))
		{
			userMana1(req, res);
		}
		if(type.endsWith("guanliyuanshezhi"))
		{
			guanliyuanshezhi(req, res); 
		}
		if(type.endsWith("dengjiAdd1"))
		{
			dengjiAdd1(req, res); 
		}
		if(type.endsWith("userdengji"))
		{
			userdengji(req, res); 
		}
		if(type.endsWith("quxiao"))
		{
			quxiao(req, res); 
		}
		if(type.endsWith("huiyuanDel"))
		{
			huiyuanquxiao(req, res); 
		}
		if(type.endsWith("guanliyuanDel"))
		{
			guanliyuanquxiao(req, res); 
		}
	}
	public void userReg(HttpServletRequest req,HttpServletResponse res)
	{
		String zhanghao=req.getParameter("zhanghao");
		String mima=req.getParameter("mima");
		String xingming=req.getParameter("xingming");
		String dianhua=req.getParameter("dianhua");
		String weixin=req.getParameter("weixin");
		String quanxian="普通用户";
		int jifen=0;
		String s=panduan(zhanghao);
		if(s.equals("yizhan"))
		{
			req.setAttribute("message", "该账号已经存在，不能重复注册");
			req.setAttribute("path", "qiantai/yonghu/yonghuzhuce.jsp");
	        String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
		else
		{
		String sql="insert into t_user(zhanghao,mima,xingming,dianhua,weixin,quanxian,jifen) values(?,?,?,?,?,?,?)";
		Object[] params={zhanghao,mima,xingming,dianhua,weixin,quanxian,jifen};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "注册成功");
		req.setAttribute("path", "qiantai/index.jsp");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
		}
	}
	
	public static String panduan(String zhanghao)
	{
		String s="meizhan";
		
		String sql="select * from t_user where zhanghao=?";
		Object[] params={zhanghao};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="yizhan";
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return s;
	}
	
	public void userLogout(HttpServletRequest req,HttpServletResponse res)
	{
		req.getSession().setAttribute("user", null);
		String targetURL = "/qiantai/default.jsp";
		dispatch(targetURL, req, res);		
	}
	
	public void userUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String zhanghao=req.getParameter("zhanghao");
		String xingming=req.getParameter("xingming");
		String dianhua=req.getParameter("dianhua");
		String weixin=req.getParameter("weixin");
		
		String sql="update t_user set zhanghao=?,xingming=?,dianhua=?,weixin=? where id=?";
		Object[] params={zhanghao,xingming,dianhua,weixin,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "修改成功");
		req.setAttribute("path", "qiantai/index.jsp");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void huiyuanshezhi(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="Update t_user set quanxian='会员用户' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "设置成功");
		req.setAttribute("path", "user?type=userMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void guanliyuanshezhi(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="Update t_user set quanxian='管理员' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();	
		req.setAttribute("message", "设置成功");
		req.setAttribute("path", "user?type=userMana1");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void huiyuanquxiao(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="Update t_user set quanxian='普通用户' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "取消成功");
		req.setAttribute("path", "user?type=userMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void guanliyuanquxiao(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="Update t_user set quanxian='会员用户' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();	
		req.setAttribute("message", "取消成功");
		req.setAttribute("path", "user?type=userMana1");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void userMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select * from t_user where quanxian='普通用户' or quanxian='会员用户'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				 user.setId(rs.getInt("id"));
				  user.setZhanghao(rs.getString("zhanghao"));
				  user.setMima(rs.getString("mima"));
				  user.setXingming(rs.getString("xingming"));
				  user.setDianhua(rs.getString("dianhua"));
				  user.setWeixin(rs.getString("weixin"));
				  user.setQuanxian(rs.getString("quanxian"));
				  user.setJifen(rs.getInt("jifen"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
	}
	public void userMana1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select * from t_user where quanxian='会员用户' or quanxian='管理员'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				 user.setId(rs.getInt("id"));
				  user.setZhanghao(rs.getString("zhanghao"));
				  user.setMima(rs.getString("mima"));
				  user.setXingming(rs.getString("xingming"));
				  user.setDianhua(rs.getString("dianhua"));
				  user.setWeixin(rs.getString("weixin"));
				  user.setQuanxian(rs.getString("quanxian"));
				  user.setJifen(rs.getInt("jifen"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/user/userMana1.jsp").forward(req, res);
	}
	public void userXinxi(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("user_id");
		
		List userList=new ArrayList();
		String sql="select * from t_user where del='no' and id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				 user.setId(rs.getInt("id"));
				  user.setZhanghao(rs.getString("zhanghao"));
				  user.setMima(rs.getString("mima"));
				  user.setXingming(rs.getString("xingming"));
				  user.setDianhua(rs.getString("dianhua"));
				  user.setWeixin(rs.getString("weixin"));
				  user.setQuanxian(rs.getString("quanxian"));
				  user.setJifen(rs.getInt("jifen"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/order/userXinxi.jsp").forward(req, res);
	}
	public void dengjiAdd1(HttpServletRequest req,HttpServletResponse res)
	{
		String shijian=new SimpleDateFormat("yyyy-MM").format(new Date());
		String dizhi=req.getParameter("dizhi");
		int jifen=0;
		Tuser user=(Tuser)req.getSession().getAttribute("user");
	    int user_id=user.getId();
	    String quanxian=user.getQuanxian();
	    
		if(quanxian.equals("普通用户"))
		{
			String s=putong(user_id);
			if(s.equals("yizhan"))
			{
				req.setAttribute("message", "你已经领取了一次了，不能重复领取");
				req.setAttribute("path", "qiantai/index.jsp");
		        String targetURL = "/common/success.jsp";
				dispatch(targetURL, req, res);
			}
			else
			{
				String sql="insert into t_dengji(yonghuID,dizhi,shijian) values(?,?,?)";
				Object[] params={user_id,dizhi,shijian};
				DB mydb=new DB();
				mydb.doPstm(sql, params);
				mydb.closed();
				
				req.setAttribute("message", "登记成功");
				req.setAttribute("path", "qiantai/index.jsp");
				
		        String targetURL = "/common/success.jsp";
				dispatch(targetURL, req, res);
				
			}
		}
		if(quanxian.equals("会员用户"))
		{
			String s=huiyuan(user_id,shijian);
			if(s.equals("yizhan"))
			{
				req.setAttribute("message", "本月已经领取了一次了，不能重复领取");
				req.setAttribute("path", "qiantai/index.jsp");
		        String targetURL = "/common/success.jsp";
				dispatch(targetURL, req, res);
			}
			else
			{
				String sql="insert into t_dengji(yonghuID,dizhi,shijian) values(?,?,?)";
				Object[] params={user_id,dizhi,shijian};
				DB mydb=new DB();
				mydb.doPstm(sql, params);
				mydb.closed();
				req.setAttribute("message", "登记成功");
				req.setAttribute("path", "qiantai/index.jsp");
		        String targetURL = "/common/success.jsp";
				dispatch(targetURL, req, res);
			}
		}
	}
	public static String putong(int user_id)
	{
		String s="meizhan";
		
		String sql="select * from t_dengji where yonghuID=?";
		Object[] params={user_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="yizhan";
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return s;
	}
	public static String huiyuan(int user_id,String shijian)
	{
		String s="meizhan";
		
		String sql="select * from t_dengji where yonghuID=? and shijian=?";
		Object[] params={user_id,shijian};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="yizhan";
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return s;
	}
	
	public void userdengji(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select a.*,b.xingming,b.dianhua,b.weixin from t_dengji a left join t_user b on a.yonghuID=b.id";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				 user.setId(rs.getInt("id"));
				  user.setXingming(rs.getString("xingming"));
				  user.setDianhua(rs.getString("dianhua"));
				  user.setWeixin(rs.getString("weixin"));
				  user.setDizhi(rs.getString("dizhi"));
				  user.setQuanxian(rs.getString("shijian"));
				  userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/dengji/dengjiMana.jsp").forward(req, res);
	}
	public void quxiao(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from  t_dengji where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();	
		req.setAttribute("message", "取消成功");
		req.setAttribute("path", "user?type=userdengji");
		
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

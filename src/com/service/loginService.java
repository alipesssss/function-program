package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext; 
import org.directwebremoting.WebContextFactory;


import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tuser;

public class loginService
{
	public String login(String userName,String userPw,int userType)
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		
		if(userType==0)
		{
			String sql="select * from t_admin where userName=? and userPw=?";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			try 
			{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					 result="no";
				}
				else
				{
					 result="yes";
					 TAdmin admin=new TAdmin();
					 admin.setUserId(rs.getInt("userId"));
					 admin.setUserName(rs.getString("userName"));
					 admin.setUserPw(rs.getString("userPw"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 0);
		             session.setAttribute("admin", admin);
				}
				rs.close();
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				mydb.closed();
			}
			
		}
		if(userType==1)
		{
			String sql="select * from t_user where zhanghao=? and mima=? and quanxian='π‹¿Ì‘±' ";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					result="no";
				}
				if(mark==true)
				{
					 result="yes";
					 
					  Tuser user=new Tuser();
					  user.setId(rs.getInt("id"));
					  user.setZhanghao(rs.getString("zhanghao"));
					  user.setMima(rs.getString("mima"));
					  user.setXingming(rs.getString("xingming"));
					  user.setDianhua(rs.getString("dianhua"));
					  user.setWeixin(rs.getString("weixin"));
					  user.setQuanxian(rs.getString("quanxian"));
					  user.setJifen(rs.getInt("jifen"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 1);
		             session.setAttribute("user", user);
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		}
		
		if(userType==2)
		{
			String sql="select * from t_user where zhanghao=? and mima=? ";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					result="no";
				}
				if(mark==true)
				{
					 result="yes";
					 
					  Tuser user=new Tuser();
					  user.setId(rs.getInt("id"));
					  user.setZhanghao(rs.getString("zhanghao"));
					  user.setMima(rs.getString("mima"));
					  user.setXingming(rs.getString("xingming"));
					  user.setDianhua(rs.getString("dianhua"));
					  user.setWeixin(rs.getString("weixin"));
					  user.setQuanxian(rs.getString("quanxian"));
					  user.setJifen(rs.getInt("jifen"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 2);
		             session.setAttribute("user", user);
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		}
		if(userType==2)
		{
			
		}
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		
		String sql="update t_admin set userPw=? where userId=?";
		Object[] params={userPwNew,admin.getUserId()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		return "yes";
    }
    
    
    public String yonghuPwEdit(String userPwNew)
    {
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		Tuser user=(Tuser)session.getAttribute("user");
		String sql="update t_user set mima=? where id=?";
		Object[] params={userPwNew,user.getId()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		return "yes";
    }
    public void logout()
    {
    	WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		session.setAttribute("userType", null);
		session.setAttribute("user", null);
    }
}

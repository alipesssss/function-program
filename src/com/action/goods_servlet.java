package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tgoods;
import com.orm.Tuser;
import com.service.liuService;

public class goods_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("goodsAdd"))
		{
			goodsAdd(req, res);
		}
		if(type.endsWith("goodsUpdate"))
		{
			goodsUpdate(req, res);
		}
		if(type.endsWith("goodsMana"))
		{
			goodsMana(req, res);
		}
		if(type.endsWith("shangjia"))
		{
			shangjia(req, res);
		}
		if(type.endsWith("xiajia"))
		{
			xiajia(req, res);
		}
		if(type.endsWith("goodsDetailHou"))
		{
			goodsDetailHou(req, res);
		}
		if(type.endsWith("goodsManaid"))
		{
			goodsManaid(req, res);
		}
		if(type.endsWith("goodsDetailQian"))
		{
			goodsDetailQian(req, res);
		}
		if(type.endsWith("goodsList"))
		{
			goodsList(req, res);
		}
		if(type.endsWith("duihuan"))
		{
			duihuan(req, res);
		}
		if(type.endsWith("myduihuan1"))
		{
			myduihuan(req, res);
		}
		
		
	}
	public void goodsAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String fujian=req.getParameter("fujian");
		int jifen=Integer.parseInt(req.getParameter("jifen"));		
		int kucun=Integer.parseInt(req.getParameter("kucun"));
		String flag="上架";
		String sql="insert into t_goods(bianhao,mingcheng,jieshao,fujian,jifen,kucun,flag) " +
				   "values(?,?,?,?,?,?,?)";
		Object[] params={bianhao,mingcheng,jieshao,fujian,jifen,kucun,flag};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "商品添加成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void goodsUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String fujian=req.getParameter("fujian");
		int jifen=Integer.parseInt(req.getParameter("jifen"));		
		int kucun=Integer.parseInt(req.getParameter("kucun"));

		String sql="Update t_goods set bianhao=?,mingcheng=?,jieshao=?,fujian=?"+
		",jifen=?,kucun=? where id=?";

		Object[] params={bianhao,mingcheng,jieshao,fujian,jifen,kucun,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "修改成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void xiajia(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="update t_goods set flag='下架' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "下架成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void shangjia(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="update t_goods set flag='上架' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "上架成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void goodsManaid(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		int id = Integer.parseInt(req.getParameter("id"));
		String sql = "select * from t_goods where id = ?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setBianhao(rs.getString("bianhao"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				goods.setJifen(rs.getInt("jifen"));
				goods.setKucun(rs.getInt("kucun"));
				goods.setFlag(rs.getString("flag"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("goodsxx", goodsList);
		req.getRequestDispatcher("admin/goods/goodsEdit.jsp").forward(req, res);
	}

	
	public void goodsMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setBianhao(rs.getString("bianhao"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				goods.setJifen(rs.getInt("jifen"));
				goods.setKucun(rs.getInt("kucun"));
				goods.setFlag(rs.getString("flag"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}
	public void goodsList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where flag='上架'" ;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setBianhao(rs.getString("bianhao"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				goods.setJifen(rs.getInt("jifen"));
				goods.setKucun(rs.getInt("kucun"));
				goods.setFlag(rs.getString("flag"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("qiantai/shangpin/shangpinQuery.jsp").forward(req, res);
	}
	public void goodsDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("admin/goods/goodsDetailHou.jsp").forward(req, res);
	}
	
	public void goodsDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("qiantai/shangpin/shangpinDetailQian.jsp").forward(req, res);
	}
	public void duihuan(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("goods_id"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		int jifen1=Integer.parseInt(req.getParameter("jifen"));
		String shijian=new Date().toLocaleString();
		Tuser user=(Tuser)req.getSession().getAttribute("user");
	    int user_id=user.getId();
	    int jifen=user.getJifen();
	    int zongjifen= quantity*jifen1;
		if(zongjifen>jifen)
		{
			req.setAttribute("message", "你的积分不足");
			req.setAttribute("path", "goods?type=goodsDetailQian&id="+id+"");
	        String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
		else
		{
		String sql="insert into t_duihuan(shangpinID,yonghuID,shuliang,zongjifen,shijian) values(?,?,?,?,?)";
		Object[] params={id,user_id,quantity,zongjifen,shijian};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		liuService.updateGoodsKucun(id, quantity);//更新商品库存
		liuService.updateyonghujifen(user_id, zongjifen);//更新用户积分
		
		mydb.closed();
		
		req.setAttribute("message", "兑换成功");
		req.setAttribute("path", "goods?type=goodsList");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
		}
        
	}
	public void myduihuan(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Tuser user=(Tuser)req.getSession().getAttribute("user");
        int user_id=user.getId();
		List goodsList=new ArrayList();
		String sql="select a.*,b.mingcheng from t_duihuan a left join t_goods b on a.shangpinID=b.id where a.yonghuID=?";
		Object[] params={user_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setBianhao(rs.getString("shijian"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJifen(rs.getInt("zongjifen"));
				goods.setKucun(rs.getInt("shuliang"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("qiantai/shangpin/myduihuan.jsp").forward(req, res);
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

}

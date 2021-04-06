package com.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tgoods;

public class liuService
{
	
	
	public static String getUserName(String id)
	{
		String name="";
		
		String sql="select * from t_user where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			name=rs.getString("xingming");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return name;
	}
	
	
	public static Tgoods getGoods(int id)
	{
		Tgoods goods=new Tgoods();
		
		String sql="select * from t_goods where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			goods.setId(rs.getInt("id"));
			goods.setBianhao(rs.getString("bianhao"));
			
			goods.setMingcheng(rs.getString("mingcheng"));
			goods.setJieshao(rs.getString("jieshao"));
			goods.setFujian(rs.getString("fujian"));
			
			goods.setJifen(rs.getInt("jifen"));
			goods.setKucun(rs.getInt("kucun"));
			goods.setFlag(rs.getString("flag"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goods;
	}
	
	public static void updateGoodsKucun(int goods_id,int goods_quantity)
	{
		String sql="update t_goods set kucun=kucun-? where id=?";
		Object[] params={goods_quantity,goods_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	public static void updateyonghujifen(int yonghuiD,int jifen )
	{
		String sql="update t_user  set jifen=jifen-? where id=?";
		Object[] params={jifen,yonghuiD};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	
}

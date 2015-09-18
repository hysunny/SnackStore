package com;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Goods;
import com.utils.DBConn;

public class GoodsHandller {
	public static List<Goods> getGoods() throws SQLException{
		List list = new ArrayList<Goods>();
		ResultSet rs=null;  
        DBConn db=new DBConn();  
        rs=db.doSelect("select * from TB_GOODSINFO ");  
        try{
		  while(rs.next()){
			Goods goods = new Goods();
			goods.setGoodsSort(rs.getString(2));
			goods.setGoodsName(rs.getString(3));
			goods.setGoodsDesc(rs.getString(4));
			goods.setGoodsUrl(rs.getString(6));
			goods.setGoodsCount(rs.getInt(5));
			goods.setGoodsPrice(rs.getFloat(7));
			list.add(goods);
		  }
        }catch(Exception e){
        	   e.printStackTrace();
        }
		
		return list;
		
	}

}

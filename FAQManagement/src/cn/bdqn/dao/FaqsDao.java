package cn.bdqn.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.entity.Faqs;

public interface FaqsDao {
	
	
	Map<String,Object> get(@Param("id") int id);
	int getCount(@Param("keyword") String keyword);
	List<Faqs> list(@Param("keyword") String keyword,@Param("pageIndex") int pageIndex);
	int add(Faqs faqs);
	
}

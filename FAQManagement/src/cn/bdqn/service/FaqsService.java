package cn.bdqn.service;

import java.util.Map;

import cn.bdqn.entity.Faqs;

public interface FaqsService {

	Map<String,Object> list(String keyword,int pageIndex);
	
	Map<String,Object> get(int id);
	
	int add(Faqs faqs);
	
}

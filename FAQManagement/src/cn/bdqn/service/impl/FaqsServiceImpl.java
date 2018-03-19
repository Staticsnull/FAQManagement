package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.dao.FaqsDao;
import cn.bdqn.entity.Faqs;
import cn.bdqn.service.FaqsService;

@Service
public class FaqsServiceImpl implements FaqsService {

	@Resource
	private FaqsDao faqsDao;

	@Override
	public Map<String,Object> get(int id) {
		 Map<String,Object> faqs = faqsDao.get(id);
		return faqs;
	}

	@Override
	public Map<String, Object> list(String keyword, int pageIndex) {
		int tatolCount = faqsDao.getCount(keyword);
		int pageCount = mod(tatolCount, 4);

		Map<String, Object> result = new HashMap<String, Object>();
		List<Faqs> list = faqsDao.list(keyword, pageIndex*4);

		result.put("pageCount", pageCount);
		result.put("list", list);

		return result;
	}

	@Override
	public int add(Faqs faqs) {
		return faqsDao.add(faqs);
	}

	private int mod(int x, int y) {
		if (x % y > 0) {
			return (x / y) + 1;
		} else {
			return x / y;
		}
	}


}

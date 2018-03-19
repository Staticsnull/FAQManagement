package cn.bdqn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.dao.ClassesDao;
import cn.bdqn.entity.Classes;
import cn.bdqn.service.ClassesService;

@Service
public class ClassesServiceImpl implements ClassesService {
	
	@Resource
	private ClassesDao classesDao;

	@Override
	public List<Classes> list() {
		List<Classes> list = classesDao.list();
		return list;
	}

}

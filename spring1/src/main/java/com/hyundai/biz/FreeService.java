package com.hyundai.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.domain.Free;
import com.hyundai.per.FreeMapper;

@Service
public class FreeService implements FreeBiz{
	
	@Autowired
	private FreeMapper freeDAO;

	@Override
	public int getTotalCount() {
		return freeDAO.getTotalCount();
	}

	@Override
	public List<Free> getFreeList() {
		return freeDAO.getFreeList();
	}

	@Override
	public Free getFree(int no) {
		return freeDAO.getFree(no);
	}

	@Override
	public void insFree(Free free) {
		freeDAO.insFree(free);
	}

	@Override
	public void upFree(Free free) {
		freeDAO.upFree(free);
	}

	@Override
	public void hitCount(int no) {
		freeDAO.hitCount(no);
	}

	@Override
	public void delFree(int no) {
		freeDAO.delFree(no);
	}
}
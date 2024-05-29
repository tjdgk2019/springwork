package com.hyundai.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyundai.domain.Fileboard;
import com.hyundai.per.FileboardMapper;
import com.hyundai.util.PagingBean;

@Service
public class FileboardServiceImpl implements FileboardService {

	@Autowired
	private FileboardMapper fileboardDAO;

	@Override
	public List<Fileboard> getPostList() {
		return fileboardDAO.getFileboardListAll();
	}

	@Override
	public List<Fileboard> getPostList(String pageNo) {
		int cnt = fileboardDAO.getTotalCount();
		int no = Integer.parseInt(pageNo);
		PagingBean pagingBean = new PagingBean(cnt, no);
		return fileboardDAO.getFileboardList(pagingBean);
	}


	@Override
	public void write(Fileboard fileboard) {
		fileboardDAO.insFileboard(fileboard);		
	}

	@Override
	public Fileboard getPostDetailNoHits(int no) {
		return fileboardDAO.getFileboard(no);
	}

	@Override
	@Transactional
	public Fileboard getPostDetailHasHits(int no) {
		fileboardDAO.hitCount(no);
		return fileboardDAO.getFileboard(no);
	}

	@Override
	public void updateHits(int no) {
		fileboardDAO.hitCount(no);
	}

	@Override
	public void deletePost(int no) {
		fileboardDAO.delFileboard(no);
	}

	@Override
	public void updatePost(Fileboard fileboard) {
		fileboardDAO.upFileboard(fileboard);
	}

	@Override
	public int getTotalCount() {
		return fileboardDAO.getTotalCount();
	}
	
	
}

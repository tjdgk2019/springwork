package com.hyundai.biz;

import java.util.List;

import com.hyundai.domain.Board;

public interface BoardBiz {
	public int getTotalCount();
	public List<Board> getBoardList();
	public Board getBoard(int bno);
	public Board selBoard(int bno);
	public void insBoard(Board board);
	public void upBoard(Board board);
	public void countUpCnt(int bno);
	public void delBoard(int bno);
}
package kr.co.service;

import java.util.List;

import kr.co.vo.ReviewVO;

public interface ReviewService {

	// 리뷰 작성
	public void reviewwrite(ReviewVO reviewVO) throws Exception;
	
	// 리뷰 목록 조회
	public List<ReviewVO> reviewlist() throws Exception;
	
	// 게시물 목록 조회
	public ReviewVO reviewread(int bnos) throws Exception;
}
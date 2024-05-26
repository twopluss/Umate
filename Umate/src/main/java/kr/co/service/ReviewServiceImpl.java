package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ReviewDAO;
import kr.co.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;

	// 게시글 작성
	@Override
	public void reviewwrite(ReviewVO reviewVO) throws Exception {
		dao.reviewwrite(reviewVO);
	}

	// 게시물 목록 조회
	@Override
	public List<ReviewVO> reviewlist() throws Exception {

		return dao.reviewlist();
	}

	// 게시물 목록 조회
	@Override
	public ReviewVO reviewread(int bnos) throws Exception {

		return dao.reviewread(bnos);
	}

}

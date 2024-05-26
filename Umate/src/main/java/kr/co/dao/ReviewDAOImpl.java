package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 리뷰 작성하기
	@Override
	public void reviewwrite(ReviewVO reviewVO) throws Exception {
		sqlSession.insert("boardMapper.reviewinsert", reviewVO);
		
	}
	
	// 리뷰 목록 조회
			@Override
			public List<ReviewVO> reviewlist() throws Exception {
			
				return sqlSession.selectList("boardMapper.reviewlist");

			}
			
			// 리뷰 내용 조회
			@Override
			public ReviewVO reviewread(int bnos) throws Exception {
					
				return sqlSession.selectOne("boardMapper.reviewread", bnos);
			}

}
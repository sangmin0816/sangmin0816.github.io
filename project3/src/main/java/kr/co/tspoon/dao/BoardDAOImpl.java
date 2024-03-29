package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Board;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Board> boardList() throws Exception {
        return sqlSession.selectList("board.boardList");
    }

    @Override
    public Board boardDetail(int seq) throws Exception {
        sqlSession.update("board.countUp", seq);
        return sqlSession.selectOne("board.boardDetail", seq);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("board.boardInsert", dto);
    }

    @Override
    public void boardDelete(int seq) throws Exception {
        sqlSession.delete("board.boardDelete", seq);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("board.boardEdit", dto);
    }
}

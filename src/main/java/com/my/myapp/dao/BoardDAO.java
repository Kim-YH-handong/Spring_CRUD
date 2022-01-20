package com.my.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.my.myapp.bean.BoardVO;

public class BoardDAO {
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	private final String BOARD_INSERT = "insert into BOARD (name, salary, designation) values (?, ?, ?)";
	private final String BOARD_UPDATE = "update BOARD set name=?, salary=?, designation=? where id=?";
	private final String BOARD_DELETE = "delete from BOARD where id=?";
	private final String BOARD_GET = "select * from BOARD where id=?";
	private final String BOARD_LIST = "select * from BOARD order by id desc";
	
	public int insertBoard(BoardVO vo) {
		return template.update(BOARD_INSERT, new Object[] {
				vo.getName(),
				vo.getSalary(),
				vo.getDesignation()
		});
	}
	
	public int deleteBoard(int id) {
		return template.update(BOARD_DELETE, new Object[] {
				id
		});
	}
	
	public int updateBoard(BoardVO vo) {
		return template.update(BOARD_UPDATE, new Object[] {
				vo.getName(),
				vo.getSalary(),
				vo.getDesignation(),
				vo.getId()
		});
	}
	
	public BoardVO getBoard(int id) {
		return template.queryForObject(BOARD_GET,
				new Object[] {id},
				new BeanPropertyRowMapper<BoardVO>(BoardVO.class));
	}
	
	public List<BoardVO> getBoardList(){
		return template.query(BOARD_LIST, new RowMapper<BoardVO>() {
			
			@Override
			public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException{
				BoardVO data = new BoardVO();
				data.setId(rs.getInt("id"));
				data.setName(rs.getString("name"));
				data.setSalary(rs.getInt("salary"));
				data.setDesignation(rs.getString("designation"));
				return data;
			}
		});
	}
}

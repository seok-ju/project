package com.conn.spring.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.OrderVO;

@Repository
public class OrderVoDao {
	@Autowired	
	private SqlSessionTemplate sqlSessionTemplate;
		
		public OrderVoDao(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}

		public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
				this.sqlSessionTemplate =sqlSessionTemplate;
		}
		
		public List<OrderVO> list(){
				return sqlSessionTemplate.selectList("orderDAO.list");
		}
		public int delete(OrderVO orderVO) {
				return sqlSessionTemplate.delete("orderDAO.delete", orderVO);
		}
		public int update(OrderVO orderVO) {
				return sqlSessionTemplate.update("orderDAO.update", orderVO);
		}
		public void insert(OrderVO orderVO) {
				 sqlSessionTemplate.insert("orderDAO.insert", orderVO);
		}
		public OrderVO select(int ProNum) {
			OrderVO vo = (OrderVO) sqlSessionTemplate.selectOne("orderDAO.select", ProNum);
				return vo;
		}
		

}

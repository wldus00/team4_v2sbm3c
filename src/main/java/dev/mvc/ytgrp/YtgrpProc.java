package dev.mvc.ytgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;





	// Autowired ��ɿ����� �ڵ� �Ҵ�� �� ���Ǵ� �̸�
	@Component("dev.mvc.ytgrp.YtgrpProc")
	public class YtgrpProc implements YtgrpProcInter {
	  /* DI: ��ü�� �ʿ��� ���� ��ü�� �ڵ����� �����Ͽ� �Ҵ�
	      Autowired: DI ��� ����
	     �� Spring�� �ڵ����� CategrpDAOInter�� ����(DAO class ����)
	     �� ��ü ����: private CategrpDAOInter categrpDAO = new CategrpDAO();
	     �� categrpDAO�� ������ ��ü�� �Ҵ� */     
	  @Autowired 
	  private YtgrpDAOInter YtgrpDAO;

	  @Override
	  public int create(YtgrpVO ytgrpVO) {
	    int cnt = YtgrpDAO.create(ytgrpVO);
	    
	    return cnt;
	  }

	@Override
	public List<YtgrpVO> list_ytgrpno_asc() {
		List<YtgrpVO> list =this.YtgrpDAO.list_ytgrpno_asc();
		return list;
	}
	@Override
	public int update(YtgrpVO ytgrpVO) {
		 int cnt = 0;
		cnt =this.YtgrpDAO.update(ytgrpVO);
		return cnt;
	}

	@Override
	public YtgrpVO read(int ytgrpno) {
		YtgrpVO ytgrpVO =this.YtgrpDAO.read(ytgrpno);
		return ytgrpVO;
	}

	@Override
	public int delete(int ytgrpno) {
		int cnt = 0;
	    cnt = this.YtgrpDAO.delete(ytgrpno);
	    
	    return cnt;
	}
	

}

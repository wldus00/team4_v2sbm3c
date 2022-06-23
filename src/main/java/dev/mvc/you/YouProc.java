package dev.mvc.you;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.you.YouProc")
public class YouProc implements YouProcInter{
	 @Autowired
	  private YouDAOInter youDAO;
	 
	  public YouProc() {
	    System.out.println("-> YouProc created");
	  }

	@Override
	public int create(YouVO youVO) {
		   int cnt = this.youDAO.create(youVO);
		    return cnt;
	}

	@Override
	public List<YouVO> list_all() {
		  List<YouVO> list = this.youDAO.list_all();
	        return list;
	}

	@Override
	public List<YouVO> list_by_ytgrpno(int ytgrpno) {
		 List<YouVO> list = this.youDAO.list_by_ytgrpno(ytgrpno);
		    
		    return list;
	}

	@Override
	public YouVO read(int youno) {
		YouVO youVO = this.youDAO.read(youno);
		    return youVO;
	}

	@Override
	public int update(YouVO youVO) {
		  int cnt = this.youDAO.update(youVO);
		    return cnt;
	}

	@Override
	public int delete(int youno) {
		  int cnt = this.youDAO.delete(youno);
		    return cnt;
	}

}

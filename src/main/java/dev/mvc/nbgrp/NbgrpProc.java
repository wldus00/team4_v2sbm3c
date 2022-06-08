package dev.mvc.nbgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.nbgrp.NbgrpProc")
public class NbgrpProc implements NbgrpProcInter {
    /*
     * DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당 Autowired: DI 사용 선언 ① Spring이 자동으로
     * CategrpDAOInter를 구현(DAO class 생성) ② 객체 생성: private CategrpDAOInter categrpDAO
     * = new CategrpDAO(); ③ categrpDAO에 생성된 객체를 할당
     */
    @Autowired
    private NbgrpDAOInter nbgrpDAO;

    @Override
    public int create(NbgrpVO nbgrpVO) {
        int cnt = nbgrpDAO.create(nbgrpVO);

        return cnt;
    }

    @Override
    public List<NbgrpVO> list_nbgrpno_asc() {
        List<NbgrpVO> list = this.nbgrpDAO.list_nbgrpno_asc();
        return list;
    }

    @Override
    public NbgrpVO read(int nbgrpno) {
        NbgrpVO nbgrpVO = this.nbgrpDAO.read(nbgrpno);
        return nbgrpVO;
    }

    @Override
    public int update(NbgrpVO nbgrpVO) {
        int cnt = 0;
        cnt = this.nbgrpDAO.update(nbgrpVO);
        
        return cnt;
    }

    @Override
    public int delete(int nbgrpno) {
        int cnt = this.nbgrpDAO.delete(nbgrpno);
        
        return cnt;
    }

    

}






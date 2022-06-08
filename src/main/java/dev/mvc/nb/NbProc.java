package dev.mvc.nb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.nb.NbVO;
import dev.mvc.nb.Nbgrp_NbVO;


@Component("dev.mvc.nb.NbProc")
public class NbProc implements NbProcInter {

  @Autowired
  private NbDAOInter nbDAO;
 
  public NbProc() {
    System.out.println("-> nbProc created");
  }
  
  @Override
  public int create(NbVO nbVO) {
    int cnt = this.nbDAO.create(nbVO);
    return cnt;
  }
  
  @Override
  public List<NbVO> list_all() {
      List<NbVO> list = this.nbDAO.list_all();
      return list;
  }

  @Override
  public List<NbVO> list_by_nbgrpno(int nbgrpno) {
      List<NbVO> list = this.nbDAO.list_by_nbgrpno(nbgrpno);
      return list;
  }
  
  @Override
  public List<Nbgrp_NbVO> list_all_join() {
    List<Nbgrp_NbVO> list = this.nbDAO.list_all_join();
    return list;
  }

  @Override
  public NbVO read(int nbno) {
      NbVO nbVO = this.nbDAO.read(nbno);
      return nbVO;
  }

  @Override
  public int update(NbVO nbVO) {
      int cnt = this.nbDAO.update(nbVO);
      return cnt;
  }

  @Override
  public int delete(int nbno) {
      int cnt = this.nbDAO.delete(nbno);
      return cnt;
  }
  
  @Override
  public int count_by_nbgrpno(int nbgrpno) {
    int cnt = this.nbDAO.count_by_nbgrpno(nbgrpno);
    return cnt;
  }

}
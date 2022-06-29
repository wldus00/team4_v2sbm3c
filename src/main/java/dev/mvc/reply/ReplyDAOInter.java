package dev.mvc.reply;

import java.util.List;
import java.util.Map;

public interface ReplyDAOInter {
  public int create(ReplyVO replyVO);
  
  public List<ReplyVO> list();
  
  public List<ReplyVO> list_by_noticeno(int noticeno);
  
  public List<ReplyMemberVO> list_by_noticeno_join(int noticeno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int replyno);
  
  public List<ReplyMemberVO> list_member_join();

}
package dev.mvc.notice;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
    private int noticeno;
    private int MEMBERNO;
    private String title = "";
    private String content = "";
    private String file1 = "";
    private String file1saved = "";
    private String thumb1 = "";
    private long size1;
    private String rdate;
    
    private MultipartFile file1MF;
    
    /**
     * 파일 크기 단위 출력
     */
    private String size1_label;
    
    public NoticeVO(){
        
    }

    public int getNoticeno() {
        return noticeno;
    }

    public void setNoticeno(int noticeno) {
        this.noticeno = noticeno;
    }

    public int getMEMBERNO() {
        return MEMBERNO;
    }

    public void setMEMBERNO(int mEMBERNO) {
        MEMBERNO = mEMBERNO;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1;
    }

    public String getFile1saved() {
        return file1saved;
    }

    public void setFile1saved(String file1saved) {
        this.file1saved = file1saved;
    }

    public String getThumb1() {
        return thumb1;
    }

    public void setThumb1(String thumb1) {
        this.thumb1 = thumb1;
    }

    public long getSize1() {
        return size1;
    }

    public void setSize1(long size1) {
        this.size1 = size1;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public MultipartFile getFile1MF() {
        return file1MF;
    }

    public void setFile1MF(MultipartFile file1mf) {
        file1MF = file1mf;
    }

    public String getSize1_label() {
        return size1_label;
    }

    public void setSize1_label(String size1_label) {
        this.size1_label = size1_label;
    }
    
    
    
}

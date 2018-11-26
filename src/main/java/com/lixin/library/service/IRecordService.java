package com.lixin.library.service;

import com.lixin.library.domain.Record;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface IRecordService {

    public void addRecord(Record record );//添加记录

    public void updateRecord(Record record );//更新记录

    public void findAllRecord(HttpSession session);//所有记录

    public List<Record >findByState(int state);//一个用户的所有记录

    public void returnRecord(HttpSession session);//还书时的记录

    public Record findById(int id);//id查找记录
}

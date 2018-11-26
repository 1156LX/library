package com.lixin.library.service.impl;

import com.lixin.library.domain.Record;
import com.lixin.library.domain.User;
import com.lixin.library.mapper.RecordMapper;
import com.lixin.library.service.IRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Service
public class RecordService implements IRecordService {
    @Autowired
    private RecordMapper recordMapper;

    @Override
    public void addRecord(Record record) {
        recordMapper.addRecord(record);
    }

    @Override
    public void updateRecord(Record record) {
        recordMapper.updateRecord(record);
    }

    @Override
    public void findAllRecord(HttpSession session) {
        User user= (User) session.getAttribute("user");
        List<Record>allRecord=recordMapper.findByState(user.getId());
        session.setAttribute("allRecord",allRecord);
    }

    @Override
    public List<Record> findByState(int state) {
        return recordMapper.findByState(state) ;
    }

    @Override
    public void returnRecord(HttpSession session ) {
        User user= (User) session.getAttribute("user");
        List<Record>returnRecord=recordMapper.returnRecord(user.getId());
        session.setAttribute("returnRecord",returnRecord);
    }

    @Override
    public Record findById(int id) {
        return recordMapper.findById(id);
    }


}

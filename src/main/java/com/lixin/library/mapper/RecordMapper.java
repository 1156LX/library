package com.lixin.library.mapper;

import com.lixin.library.domain.Record;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecordMapper {

    public void addRecord(Record record);//添加记录

    public List <Record>findAllRecord();//查找所有记录

    public List <Record >findByState(int state);//一个用户的所有记录

    public void updateRecord(Record record );//更新记录

    public List<Record>returnRecord(int state);//还书显示的记录

    public Record  findById(int id);//id查找记录
}

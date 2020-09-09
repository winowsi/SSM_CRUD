package com.wnowsi.crud.service.impl;

import com.wnowsi.crud.entity.Student;
import com.wnowsi.crud.entity.StudentExample;
import com.wnowsi.crud.repository.StudentMapper;
import com.wnowsi.crud.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-10 21:23
 **/
@Service
public class StudentServiceimpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public List<Student> findAll() {
        StudentExample studentExample=new StudentExample();
        return studentMapper.selectByExampleWithClass(studentExample);
    }

    @Override
    public Student findAllById(Integer id) {

        return studentMapper.selectByPrimaryKey(id);
    }

    @Override
    public void deleteById(Integer id) {
        studentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(Student student) {
        int insert = studentMapper.insertSelective(student);
        return insert;
    }

    @Override
    public int upData(Student student) {
        int i = studentMapper.updateByPrimaryKeySelective(student);
        return i;
    }


    @Override
    public boolean findName(String putName) {
        StudentExample studentExample=new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andNameEqualTo(putName);
        long l = studentMapper.countByExample(studentExample);
        return l==0;
    }

    @Override
    public boolean UpDataById(Integer id) {
        return false;
    }

    @Override
    public void deleteBath(List<Integer> split) {
        StudentExample studentExample=new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andIdIn(split);
        studentMapper.deleteByExample(studentExample);
    }


}

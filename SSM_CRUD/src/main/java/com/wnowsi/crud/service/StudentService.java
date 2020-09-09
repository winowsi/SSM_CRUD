package com.wnowsi.crud.service;

import com.wnowsi.crud.entity.Student;

import java.util.List;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-10 21:22
 **/
public interface StudentService {
    public List<Student> findAll();
    public Student findAllById(Integer id);
    public void deleteById(Integer id);
    public  int save(Student student);
    public  int upData(Student student);
    boolean findName(String putName);

    boolean UpDataById(Integer id);

    void deleteBath(List<Integer> split);
}

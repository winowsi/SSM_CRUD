package com.wnowsi.crud.service;

import com.wnowsi.crud.entity.Classes;
import com.wnowsi.crud.entity.Student;

import java.util.List;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-12 19:44
 **/
public interface ClassesService {
    public List<Classes> findAll();
    public Classes findAllById(Integer id);
    public void deleteById(Integer id);
    public  int save(Classes classes);
    public  int upData(Classes classes);
}

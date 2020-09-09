package com.wnowsi.crud.service.impl;

import com.wnowsi.crud.entity.Classes;
import com.wnowsi.crud.entity.ClassesExample;
import com.wnowsi.crud.repository.ClassesMapper;
import com.wnowsi.crud.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-12 19:44
 **/
@Service
public class ClassesServiceimpl implements ClassesService{
    @Autowired
    private ClassesMapper classesMapper;
    @Override
    public List<Classes> findAll() {
        return classesMapper.selectByExample(new ClassesExample());
    }

    @Override
    public Classes findAllById(Integer id) {
        return null;
    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public int save(Classes classes) {
        return 0;
    }

    @Override
    public int upData(Classes classes) {
        return 0;
    }
}

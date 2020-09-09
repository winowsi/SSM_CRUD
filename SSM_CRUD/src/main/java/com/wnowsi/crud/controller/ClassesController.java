package com.wnowsi.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wnowsi.crud.entity.Classes;
import com.wnowsi.crud.entity.Student;
import com.wnowsi.crud.information.Information;
import com.wnowsi.crud.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-12 19:39
 **/
@Controller
@RequestMapping("/classes")
public class ClassesController {
    @Autowired
    private ClassesService classesService;
    @GetMapping("/finaByPagRJ")
    @ResponseBody
    private Information finaByPagRJ() {
        List<Classes> all = classesService.findAll();
        return Information.Success().AddData("Classes",all);
    }

}

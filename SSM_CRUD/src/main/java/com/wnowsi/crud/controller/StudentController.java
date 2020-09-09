package com.wnowsi.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wnowsi.crud.entity.Student;
import com.wnowsi.crud.information.Information;
import com.wnowsi.crud.service.StudentService;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-10 21:07
 **/
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @GetMapping("/finaByPag")
    private ModelAndView finaByPag(@RequestParam(value = "pageNumber",defaultValue = "1") Integer pagNumber,ModelAndView modelAndView) {
        //引用分页插件pagHelper
        PageHelper.startPage(pagNumber,10);
        List<Student> list = studentService.findAll();
        //包装分页的详细信息以及数据
        PageInfo pageInfo=new PageInfo(list,5);
        modelAndView.addObject("studentByPag", pageInfo);
        modelAndView.setViewName("studentPag");
        return modelAndView;
    }
    @GetMapping("/finaByPagRJ")
    @ResponseBody
    private Information finaByPagRJ(@RequestParam(value = "pageNumber",defaultValue = "1") Integer pagNumber, ModelAndView modelAndView) {
        //引用分页插件pagHelper
        PageHelper.startPage(pagNumber,10);
        List<Student> list = studentService.findAll();
        //包装分页的详细信息以及数据
        PageInfo pageInfo=new PageInfo(list,5);
        return Information.Success().AddData("pageInfo",pageInfo);
    }
    @PostMapping("/save")
    @ResponseBody
    private Information save(@Validated Student student, BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误信息字段名"+fieldError.getField());
                System.out.println("错误信息"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Information.Defeated().AddData("fieldErrors",map);
        }
        else {
            int save = studentService.save(student);
            return Information.Success();
        }
    }
    @GetMapping("/findName")
    @ResponseBody
    private Information findName(@RequestParam("putName") String putName){
        String zZ="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!putName.matches(zZ)){
            return Information.Defeated().AddData("FNS","您输入的用户名不正确确");
        }
       boolean bool= studentService.findName(putName);
       if (bool){
           return Information.Success();
       }
       else {
           return Information.Defeated().AddData("FNS","用户名不可用");
       }
    }
    @GetMapping("/UpData/{id}")
    @ResponseBody
    private  Information FUpData( @PathVariable("id") Integer id){
        Student allById = studentService.findAllById(id);
        return Information.Success().AddData("allById",allById);
    }
    //put请求tomcat不会数据封装
    //Spring mvc 配置put请求
    @PutMapping("/SupData/{id}")
    @ResponseBody
    private Information UpDataById(Student student){
        int i = studentService.upData(student);
        return Information.Success();
    }

//    @DeleteMapping("/delete/{id}")
//    @ResponseBody
//    private Information DeleteById(@PathVariable("id") Integer id){
//        studentService.deleteById(id);
//        return Information.Success();
//    }

    //DeletePlus
    @DeleteMapping("/delete/{ids}")
    @ResponseBody
    private Information DeleteById(@PathVariable("ids") String idS){
        if (idS.contains("-")){
            List<Integer> list=new ArrayList<>();
            String[] split = idS.split("-");
            for (String s : split) {
                list.add(Integer.parseInt(s));
            }
            studentService.deleteBath(list);

        }
        else {
            Integer id=Integer.parseInt(idS);
            studentService.deleteById(id);
        }

        return Information.Success();
    }

}

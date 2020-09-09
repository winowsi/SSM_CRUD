package com.wnowsi.crud.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Pattern;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private Integer id;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "保存失败name有错误🙅")
    private String name;

    private String sex;

//    @Pattern(regexp = "^100|(^([1-9]{0,1})([0-9]{1})(\\.[0-9])?)$",message = "成绩最低10分最高100分")
   @DecimalMax(value = "100",message = "保存失败成绩不能大于100")
   @DecimalMin(value = "0",message = "保存失败成绩必须大于等于0")
    private Integer sour;

    private Integer classes;

    private  Classes classesnmae;


    public Student(Integer id, String name, String sex, Integer sour, Integer classes) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.sour = sour;
        this.classes = classes;
    }
}
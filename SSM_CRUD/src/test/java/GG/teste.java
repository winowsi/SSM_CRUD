package GG;

import com.wnowsi.crud.entity.Student;
import com.wnowsi.crud.entity.StudentExample;
import com.wnowsi.crud.repository.StudentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-10 18:21
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class teste {
    @Autowired
 private  StudentMapper studentMapper;
    @Test
    public void  save (){
      studentMapper.insertSelective(new Student(null,"小名","男",97,1));
    }
    @Test
    public void upData (){
        studentMapper.updateByPrimaryKey(new Student(14,"小名","男",97,1));
    }
    @Test
    public void delete (){
        studentMapper.deleteByPrimaryKey(14);
    }
    @Test
    public void findAllById (){
        studentMapper.selectByPrimaryKeyWithClass(15);
    }
    @Test
    public void findAll (){
        StudentExample studentExample=new StudentExample();
        studentMapper.selectByExampleWithClass(studentExample);
    }
    @Test
    public void steAllS (){
        for (int i = 0; i < 100; i++) {
            String s = UUID.randomUUID().toString().substring(0, 5)+i;
            studentMapper.insertSelective(new Student(null,s,"男",97,1));
        }



    }

}

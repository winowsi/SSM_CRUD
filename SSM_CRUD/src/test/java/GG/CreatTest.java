package GG;

import com.github.pagehelper.PageInfo;
import com.wnowsi.crud.entity.Student;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.sound.midi.Soundbank;
import java.util.List;

/**
 * @program: SSM_CRUD
 * @description:
 * @author: 赵尧
 * @date: 2020-07-10 22:14
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"classpath:applicationContext.xml","classpath:Spring_mvc.xml"})
public class CreatTest {
    //传入Springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟请求
    MockMvc mockMv;
    @Before
    public void initMocMvc(){
       mockMv= MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public  void  testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult aReturn = mockMv.perform(MockMvcRequestBuilders.get("/student/finaByPag").param("pageNumber", "1")).andReturn();
        //请求成功后page作用域中存有studentByPag
        MockHttpServletRequest request = aReturn.getRequest();
        PageInfo studentByPag = (PageInfo) request.getAttribute("studentByPag");
        System.out.println("当前页码"+studentByPag.getPageNum());
        System.out.println("总页码"+studentByPag.getPages());
        System.out.println("总记录数"+studentByPag.getTotal());
        System.out.println("页面显示的页码数");
        int[] navigatepageNums = studentByPag.getNavigatepageNums();
        for (int navigatepageNum : navigatepageNums) {
            System.out.println(" "+navigatepageNum);
        }
        //获取员工数据
        List<Student> list = studentByPag.getList();
        for (Student student : list) {
            System.out.println("ID"+student.getId()+"==>"+student.getName());
        }

    }
}


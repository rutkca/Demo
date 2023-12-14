package com.bijing.demo.controller;
import com.bijing.demo.bean.Department;
import com.bijing.demo.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("/depts")
    @ResponseBody
    public List<Department> getAll(){
        List<Department> departments = departmentService.getAll();
        return departments;
    }
}

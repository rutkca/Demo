package com.bijing.demo.controller;

import com.bijing.demo.bean.Employee;
import com.bijing.demo.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/emps")
    public String getAll(Model model, @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(1,5);
        List<Employee> employeeList =employeeService.getAll();
        PageInfo pageInfo =new PageInfo(employeeList);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}

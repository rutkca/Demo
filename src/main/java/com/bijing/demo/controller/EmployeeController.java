package com.bijing.demo.controller;

import com.bijing.demo.bean.Employee;
import com.bijing.demo.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/emps",method = {RequestMethod.GET})
    public String getAll(Model model, @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> employeeList =employeeService.getAll();
        PageInfo pageInfo =new PageInfo(employeeList);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
    @RequestMapping(value = "/emps",method = {RequestMethod.POST})
    public Map save(Employee employee){
        Map msg = new HashMap();
        msg.put("code",200);
        try {
            employeeService.save(employee);
        }catch (Exception e){
            msg.put("code",500);
            e.printStackTrace();
        }finally {
            return msg;
        }
    }
    @RequestMapping(value = "/emps",method = {RequestMethod.PUT})
    @ResponseBody
    public Map update(Employee employee){
        Map map = new HashMap();
        map.put("code",200);
        try{
            employeeService.update(employee);
        }catch (Exception e){
            map.put("code",500);
            e.printStackTrace();
        }finally {
            return map;
        }
    }
    @RequestMapping(value = "/emps/{id}",method = {RequestMethod.GET})
    @ResponseBody
    public Employee getById(@PathVariable Integer id){
        return employeeService.getById(id);
    }

    @RequestMapping(value = "/emps/{id}",method = {RequestMethod.DELETE})
    @ResponseBody
    public Map delete(@PathVariable Integer id){
        Map map = new HashMap();
        map.put("code",200);
        try{
            employeeService.deleteById(id);
        }catch (Exception e){
            map.put("code",500);
            e.printStackTrace();
        }finally {
            return map;
        }

    }
}

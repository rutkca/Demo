package com.bijing.demo.service;

import com.bijing.demo.bean.Department;
import com.bijing.demo.bean.DepartmentExample;
import com.bijing.demo.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    public List<Department> getAll() {
       List<Department> departments = departmentMapper.selectByExample(new DepartmentExample());
       return  departments;
    }
}

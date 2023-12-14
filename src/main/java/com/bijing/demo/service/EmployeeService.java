package com.bijing.demo.service;

import com.bijing.demo.bean.Employee;
import com.bijing.demo.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;


    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void save(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public Employee getById(Integer id) {
       return employeeMapper.selectByPrimaryKey(id);
    }

    public void deleteById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
}

package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Employee;
import com.football.crud.bean.EmployeeExample;
import com.football.crud.bean.EmployeeExample.Criteria;
import com.football.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll() {
		// TODO 自动生成的方法存根
		return employeeMapper.selectByExampleWithDept(null);
	}

	/**
	 * 员工保存
	 * @param employee
	 */
	public void saveEmp(Employee employee) {
		// TODO 自动生成的方法存根
		employeeMapper.insertSelective(employee);
	}

	/**
	   *   检验用户名是否可用
	 * @param empName
	 * @return true:代表当前姓名可用 false:不可用
	 */
	public boolean checkUser(String empName) {
		// TODO 自动生成的方法存根
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 按照id查询球员
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		// TODO 自动生成的方法存根
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	/**
	 * 球员更新
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		// TODO 自动生成的方法存根
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 球员解雇
	 * @param id
	 */
	public void deleteEmp(Integer id) {
		// TODO 自动生成的方法存根
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> ids) {
		// TODO 自动生成的方法存根
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3,4)
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}

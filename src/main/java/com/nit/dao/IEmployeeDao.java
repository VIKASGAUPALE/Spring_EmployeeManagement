package com.nit.dao;

import java.util.List;

import com.nit.model.Employee;

public interface IEmployeeDao {

	public List<Employee> getAllEmployees();
	public Employee getEmployee(Integer id);
	public void addEmployee(Employee e);
	public void deleteEmpoyee(Integer id);
	public void updateEmpoyee(Employee emp);
	
}

package com.nit.dao;

import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.nit.model.Employee;

public class EmployeeDaoImpl extends JdbcDaoSupport implements IEmployeeDao{
	
	private String GET_ALL="select * from employee";
	private String INSERT="insert into employee values(?,?,?,?)";
	private String DELETE="delete from employee where id=?";
	private String UPDATE="update employee set name=?,address=?,salary=? where id=?";
	private String GET_ONE="select * from employee where id=?";
	
	private RowMapper<Employee> rowMapper;
	public void setRowMapper(RowMapper<Employee> rowMapper) {
		this.rowMapper=rowMapper;
	}
	
	
	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> employees = getJdbcTemplate().query(GET_ALL, rowMapper);
		return employees;
	}


	@Override 
	public void addEmployee(Employee e) {
		getJdbcTemplate().update(INSERT, e.getId(),e.getName(),e.getAddress(),e.getSalary());
	}


	@Override
	public Employee getEmployee(Integer id) {
		return getJdbcTemplate().query(GET_ONE,rowMapper,id).get(0);
		
	}


	@Override
	public void deleteEmpoyee(Integer id) {
		getJdbcTemplate().update(DELETE,id);
		
	}


	@Override
	public void updateEmpoyee(Employee emp) {
		getJdbcTemplate().update(UPDATE, emp.getName(),emp.getAddress(),emp.getSalary(),emp.getId());
		
	}
	
	
}

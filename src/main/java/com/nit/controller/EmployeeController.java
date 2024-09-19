package com.nit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nit.dao.EmployeeDaoImpl;
import com.nit.model.Employee;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {
 
	@Autowired
	private EmployeeDaoImpl empDao;
	
	@RequestMapping("/getAllEmployee")
	public String getAllEmployee(Model model) {
		
		List<Employee> allEmployees = empDao.getAllEmployees();
		model.addAttribute("employees", allEmployees);
		
		return "show_allEmployees";
	}
	
	@RequestMapping("/addEmployee")
	public String addEmployee()
	{
		return "add_employee";
	}
	
	@RequestMapping("/saveEmployee")
	public String saveEmployee(HttpServletRequest req)
	{
		Integer id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String address=req.getParameter("address");
		Double salary=Double.parseDouble(req.getParameter("salary"));
		
		Employee e=new Employee(id, name, address, salary);
		empDao.addEmployee(e);
		
		return "redirect:getAllEmployee";
			
		
	}
	
	@RequestMapping("/deleteEmp")
	public String deleteEmployee(HttpServletRequest req)
	{
		
		Integer id=Integer.parseInt(req.getParameter("id"));
		
		empDao.deleteEmpoyee(id);
		
		return "redirect:getAllEmployee";
	}
	
	@RequestMapping("/updatePage")
	public String updatePage(HttpServletRequest req, Model model)
	{
		Integer id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		Employee employee = empDao.getEmployee(id);
		System.out.println(employee);
		model.addAttribute("employee", employee);
		
		return "update_employee";
		
	}
	@RequestMapping("/updateEmployee")
	public String updateEmployee(HttpServletRequest req)
	{
		Integer id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String address=req.getParameter("address");
		Double salary=Double.parseDouble(req.getParameter("salary"));
		
		Employee e=new Employee(id, name, address, salary);
		empDao.updateEmpoyee(e);
		
		return "redirect:getAllEmployee";
	}
}

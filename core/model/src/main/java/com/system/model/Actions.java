package com.system.model;

/**
 * Hello world!
 *
 */

import javax.persistence.*;
import java.util.*;
@Entity
@Table(name="actions")
public class Actions extends BaseEntity
{
	@Column(name = "viewpoints")
	private String viewPoints;
	@Column(name = "type")
	private String type;
	
	@ManyToOne(cascade = {CascadeType.PERSIST})
    @org.hibernate.annotations.Cascade(value = org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
    @JoinColumn(name="employeeid")
	private Employee employee;
	
	
    public Actions(){}
	
	public Actions(String viewPoints, String type, Employee employee){
		this.viewPoints=viewPoints;
		this.type=type;
		this.employee=employee;
	}
	public String getViewPoints(){
		return viewPoints;
	}
	public void setViewPoints(String viewPoints){
		this.viewPoints = viewPoints;
	}
	
	public String getType(){
		return type;
	}
	public void setType(String type){
		this.type=type;
	}
	public Employee getEmployee(){
		return employee;
	}
	public void setEmployee(Employee employee){
		this.employee=employee;
	}
}

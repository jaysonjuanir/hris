package com.system.model;

/**
 * Hello world!
 *
 */

import javax.persistence.*;
import java.util.*;
@Entity
@Table(name="employee")
public class Employee extends BaseEntity
{
	@Embedded
	private Name name;
	@Embedded
	private Address address;
	@Column(name = "contact")
	private String contact;
	@Column(name = "accountid")
	private int accountId;
	@Column(name = "position")
	private String position;
	@OneToMany(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true, fetch=FetchType.LAZY)
	private Set<Actions> actions;
	
    public Employee(){}
	
	public Employee(Name name, Address address, String contact, int accountId, String position, Set<Messages> messages, Set<Actions> actions){
		this.name=name;
		this.address=address;
		this.contact=contact;
		this.accountId=accountId;
		this.position=position;
		this.actions=actions;
	}
	public Name getName(){
		return name;
	}
	public void setName(Name name){
		this.name = name;
	}
	
	public Address getAddress(){
		return address;
	}
	public void setAddress(Address address){
		this.address=address;
	}
	public String getContact(){
		return contact;
	}
	public void setContact(String contact){
		this.contact=contact;
	}
	public String getPosition(){
		return position;
	}
	public void setPosition(String position){
		this.position=position;
	}
	public int getAccountId(){
		return accountId;
	}
	public void setAccountId(int accountId){
		this.accountId=accountId;
	}
	public Set<Actions> getActions(){
		return actions;
	}
	public void setActions(Set<Actions> actions){
		this.actions=actions;
	}
	
	@Override
	public String toString(){
		return "Name: " + name
			+ "\nAddress:" + address
			+ "\nContact Number:" + contact
			+ "\nPosition:" + position;
	}
	
}

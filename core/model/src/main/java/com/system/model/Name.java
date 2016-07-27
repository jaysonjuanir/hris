package com.system.model;

/**
 * Hello world!
 *
 */

import javax.persistence.*;

@Embeddable
public class Name
{
	@Column(name = "firstname")
	private String firstName;
	@Column(name = "middlename")
	private String middleName;
	@Column(name = "lastname")
	private String lastName;
	
    public Name(){}
	
	public Name(String firstName, String middleName, String lastName){
		this.firstName=firstName;
		this.middleName=middleName;
		this.lastName=lastName;
	}
	public String getFirstName(){
		return firstName;
	}
	public void setFirstName(String firstName){
		this.firstName=firstName;
	}
	public String getLastName(){
		return lastName;
	}
	public void setLastName(String lastName){
		this.lastName=lastName;
	}
	public String getMiddleName(){
		return middleName;
	}
	public void setMiddleName(String middleName){
		this.middleName=middleName;
	}
	
	@Override
	public String toString(){
		return firstName + " " + middleName.charAt(0) + ". " + lastName;
	}
}

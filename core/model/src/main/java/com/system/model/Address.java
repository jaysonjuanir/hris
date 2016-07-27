package com.system.model;

/**
 * Hello world!
 *
 */

import javax.persistence.*;

@Embeddable
public class Address
{
	@Column(name = "streetnumber")
	private String streetName;
	@Column(name = "barangay")
	private String barangay;
	@Column(name = "city")
	private String city;
	
    public Address(){}
	
	public Address(String streetName, String barangay, String city){
		this.streetName=streetName;
		this.barangay=barangay;
		this.city=city;
	}
	public String getStreetName(){
		return streetName;
	}
	public void setStreetName(String streetName){
		this.streetName=streetName;
	}
	public String getBarangay(){
		return barangay;
	}
	public void setBarangay(String barangay){
		this.barangay=barangay;
	}
	public String getCity(){
		return city;
	}
	public void setCity(String city){
		this.city=city;
	}
	
	@Override
	public String toString(){
		return streetName + " " + barangay + " " + city;
	}
}

package com.system.model;

/**
 * Hello world!
 *
 */

import javax.persistence.*;
import java.util.*;
@Entity
@Table(name="messages")
public class Messages extends BaseEntity
{
	
	@Column(name = "sender")
	private int sender;
	
	@ManyToOne(cascade = {CascadeType.PERSIST})
    @org.hibernate.annotations.Cascade(value = org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
    @JoinColumn(name="receiver")
	private Employee receiver;
	
	@Column(name = "message")
	private String message;
	
	@Column(name = "seen")
	private boolean seen;
	
    public Messages(){}
	
	public Messages(int sender, Employee receiver, String message, boolean seen){
		this.sender=sender;
		this.receiver=receiver;
		this.message=message;
		this.seen=seen;
	}
	public int getSender(){
		return sender;
	}
	public void setName(int sender){
		this.sender = sender;
	}
	
	public Employee getReceiver(){
		return receiver;
	}
	public void setReceiver(Employee receiver){
		this.receiver=receiver;
	}
	public boolean getSeen(){
		return seen;
	}
	public void setSeen(boolean seen){
		this.seen=seen;
	}
	
}

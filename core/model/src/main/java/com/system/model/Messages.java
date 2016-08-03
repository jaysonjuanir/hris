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
	private String sender;
	
	@Column(name="receiver")
	private int receiver;
	
	@Column(name = "message")
	private String message;

    
	
	
    public Messages(){}
	
	public Messages(String sender, int receiver, String message){
		this.sender=sender;
		this.receiver=receiver;
		this.message=message;
		
	}
	public String getSender(){
		return sender;
	}
	public void setSender(String sender){
		this.sender = sender;
	}
	public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
	public int getReceiver(){
		return receiver;
	}
	public void setReceiver(int receiver){
		this.receiver=receiver;
	}
	
}

package com.objectif.onu.insarag_webapp.bean;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * Ce Bean s'occupe de stocker la liste des utilisateurs connectés.
 * @author dimartinot
 *
 */
public class ActiveUserStore {
	 
    public List<String> users;
 
    public ActiveUserStore() {
        users = new ArrayList<String>();
    }

	public List<String> getUsers() {
		return users;
	}

	public void setUsers(List<String> users) {
		this.users = users;
	}
    
}
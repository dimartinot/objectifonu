package com.objectif.onu.insarag_webapp.component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.stereotype.Component;

import com.objectif.onu.insarag_webapp.bean.ActiveUserStore;

/**
 * Cette classe agit comme wrapper de la classe ActiveUserStore et implement le HTTPSessionBindingListener.
 * De ce fait, cette classe va "écouter" les événements du type HttpSessionBindingEvent qui arrive dès lors que l'on manipule (ajout, suppression) une session HTTP.
 * Elle sera à mettre à jour avec les champs de la classe Users.java du package Model.
 * @author dimartinot
 *
 */
@Component
public class LoggedUser implements HttpSessionBindingListener {
 
	private int idusers;
	private String userName;
	private String password;
	private Set roleses = new HashSet(0);    
	
	private ActiveUserStore activeUserStore;
     
    
     
    public LoggedUser(int idusers, String userName, String password, Set roleses, ActiveUserStore activeUserStore) {
		super();
		this.idusers = idusers;
		this.userName = userName;
		this.password = password;
		this.roleses = roleses;
		this.activeUserStore = activeUserStore;
	}

    public LoggedUser(String userName, ActiveUserStore activeUserStore) {
		this.userName = userName;
		this.activeUserStore = activeUserStore;
	}    
    
	public LoggedUser() {}
 
    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        List<String> users = activeUserStore.getUsers();
        LoggedUser user = (LoggedUser) event.getValue();
        if (!users.contains(user.getUserName())) {
            users.add(user.getUserName());
        }
    }
 
    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        List<String> users = activeUserStore.getUsers();
        LoggedUser user = (LoggedUser) event.getValue();
        if (users.contains(user.getUserName())) {
            users.remove(user.getUserName());
        }
    }

	public String getUserName() {
		return userName;
	}

	public void setUserName(String username) {
		this.userName = username;
	}

	public int getIdusers() {
		return idusers;
	}

	public void setIdusers(int idusers) {
		this.idusers = idusers;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set getRoleses() {
		return roleses;
	}

	public void setRoleses(Set roleses) {
		this.roleses = roleses;
	}

	public ActiveUserStore getActiveUserStore() {
		return activeUserStore;
	}

	public void setActiveUserStore(ActiveUserStore activeUserStore) {
		this.activeUserStore = activeUserStore;
	}
 
    
    
}

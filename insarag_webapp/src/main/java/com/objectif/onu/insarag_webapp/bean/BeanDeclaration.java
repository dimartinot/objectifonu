package com.objectif.onu.insarag_webapp.bean;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * Cette classe va lister tous les Beans à déclarer
 * @author dimartinot
 *
 */
@Component
public class BeanDeclaration {
	@Bean
	public ActiveUserStore activeUserStore(){
	    return new ActiveUserStore();
	}
}

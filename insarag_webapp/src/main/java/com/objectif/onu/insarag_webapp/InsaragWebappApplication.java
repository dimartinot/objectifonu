package com.objectif.onu.insarag_webapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class InsaragWebappApplication extends SpringBootServletInitializer {
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(InsaragWebappApplication.class);
    }

	public static void main(String[] args) {
//		ApplicationContext ac = new AnnotationConfigApplicationContext(InsaragWebappApplication.class);
//		ac.("com.objectif.onu.insarag_webapp.bean.ActiveUserStore");
		SpringApplication.run(InsaragWebappApplication.class, args);
	}
}

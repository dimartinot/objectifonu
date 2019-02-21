package com.objectif.onu.insarag_webapp.configuration;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.RolesHome;
import com.objectif.onu.insarag_webapp.dao.UsersHome;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	private static final Log log = LogFactory.getLog(WebSecurityConfig.class);

	
	/**
	 * Permet l'ouverture d'une connexion physique avec la table des roles
	 */
	private final RolesHome rh = new RolesHome();
	
	
	/**
	 * Permet l'ouverture d'une connexion physique avec la table des users
	 */
	private final UsersHome uh = new UsersHome();

	
	/**
	 * Configure l'ensemble des utilisateurs pouvant se connecter
	 */
	@Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
		for (Users u : uh.selectAll()) {
//			Users u = (Users) o;
			Roles r = rh.findByUserId(u.getIdusers());
			auth.inMemoryAuthentication()
	          .withUser(u.getEmail()).password(passwordEncoder().encode(u.getPassword())).roles(r.getTitre());
			log.info(u.getEmail()+"-"+u.getPassword()+"-"+r.getTitre());
		}
//		
//         auth.inMemoryAuthentication()
//          .withUser("user2").password(passwordEncoder().encode("user2Pass")).roles("USER")
//          .and()
//          .withUser("admin").password(passwordEncoder().encode("adminPass")).roles("ADMIN");
    }
 
	/**
	 * Configure les droits d'accès aux différentes pages en fonction des rôles d'utilisateurs
	 */
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http
          .csrf().disable()
          .authorizeRequests()
          .antMatchers("/admin/**").hasRole("ADMIN")
          .antMatchers("/alert/alert_editor").hasRole("ADMIN")
          .antMatchers("/anonymous*").anonymous()
          .antMatchers("/login*").permitAll()
          .anyRequest().authenticated()
          .and()
          .formLogin()
          .loginPage("/login")
//          .successHandler(activeUserBean())
          .defaultSuccessUrl("/", true)
          .failureUrl("/login?error=true")
          .and()
          .logout()
          .deleteCookies("user")
          .and()
          .sessionManagement()
          .sessionCreationPolicy(SessionCreationPolicy.ALWAYS);
        http.headers().frameOptions().disable();	
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    public ActiveUserBean activeUserBean() {
    	return new ActiveUserBean();
    }
}
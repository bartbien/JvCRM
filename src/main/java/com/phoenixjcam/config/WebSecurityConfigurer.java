package com.phoenixjcam.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.phoenixjcam.config.core.AuthenticationSuccessHandlerImpl;


/**
 *  Customize security <br>
 *  <a href="http://docs.spring.io/spring-security/site/docs/3.2.4.RELEASE/reference/htmlsingle/">http://docs.spring.io/spring-security/site/docs/3.2.4.RELEASE/reference/htmlsingle/</a>
 * @author Bart88
 *
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter 
{
	@Autowired
	@Qualifier("userDetailsService")
	UserDetailsService userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception 
	{
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	// http://docs.spring.io/spring-security/site/docs/3.2.3.RELEASE/reference/htmlsingle/#nsa-password-encoder
	@Bean
	public PasswordEncoder passwordEncoder()
	{
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		
		return encoder;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
		http
		.authorizeRequests()
			.antMatchers("/admin/**").hasRole("ADMIN")  // || -> .access("hasRole('ROLE_ADMIN')")
			.antMatchers("/dashboard/**").hasRole("USER")
		.and()
			.formLogin()
			.loginPage("/login")
			.failureUrl("/login?error")
			.usernameParameter("username")
			.passwordParameter("password")
			//.defaultSuccessUrl("/dashboard")
			.successHandler(new AuthenticationSuccessHandlerImpl())
		.and()
			.logout()
			.logoutSuccessUrl("/login?logout")
		.and()
			.exceptionHandling()
			.accessDeniedPage("/403")
			//.and()
			//.csrf() // Cross-site request forgery (a one-click attack or session riding )
			//.accessDeniedPage("/403")
		.and()
			.csrf()
			.disable();
			//.disable(); // Cross-site request forgery (a one-click attack or session riding )
	}
}
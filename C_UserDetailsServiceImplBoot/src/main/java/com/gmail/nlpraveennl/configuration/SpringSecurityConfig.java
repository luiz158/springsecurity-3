package com.gmail.nlpraveennl.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.gmail.nlpraveennl.dao.impl.UserDaoImpl;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = "com.gmail.nlpraveennl")
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter 
{
	@Autowired
	UserDaoImpl userDaoImpl;

	
	@Autowired
	public void configureInMemoryAuthentication(AuthenticationManagerBuilder auth) throws Exception
	{
		auth.inMemoryAuthentication()
		.withUser("restapiuser")
		.password("$2a$10$GRoNCbeVoBYMcZH7QLX2O.wWxkMtB4qiBY8y.XzvRN/mvktS9GWc6")
		.roles("APIUSER");
	}

	@Autowired
	public void configureUserDetailsService(AuthenticationManagerBuilder auth) throws Exception
	{
		auth.userDetailsService(userDaoImpl);
	}
 
	@Override
	protected void configure(final HttpSecurity http) throws Exception
	{
        http
        .authorizeRequests()
	        .antMatchers("/resources/**", "/", "/login")
	        	.permitAll()
	        .antMatchers("/config/*", "/app/admin/*")
	        	.hasRole("ADMIN")
	        .antMatchers("/app/user/*")
	        	.hasAnyRole("ADMIN", "USER")
	        .antMatchers("/api/sessionValid").permitAll()
	        .antMatchers("/api/**")
	        	.hasRole("APIUSER")
        .and().exceptionHandling()
        	.accessDeniedPage("/403")
        .and().formLogin()
            .loginPage("/login")
            .usernameParameter("userName").passwordParameter("password")
            .defaultSuccessUrl("/app/user/dashboard")
            .failureUrl("/login?error=true")
        .and().logout()
            .logoutSuccessHandler(new CustomLogoutSuccessHandler())
            .invalidateHttpSession(true)
        .and().httpBasic()
        .and().csrf()
            	.disable();
        
        http.sessionManagement().maximumSessions(1).expiredUrl("/login?expired=true");
    }
     
    @Bean
    public PasswordEncoder passwordEncoder() 
    {
        return new BCryptPasswordEncoder();
    }
}

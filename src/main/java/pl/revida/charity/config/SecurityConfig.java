package pl.revida.charity.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public InMemoryUserDetailsManager users() {
        String encodedPassword = new BCryptPasswordEncoder().encode("password");
        UserDetails user = User.builder()
                .username("user")
                .password(encodedPassword)
                .roles("USER")
                .build();
        UserDetails admin = User.builder()
                .username("admin")
                .password(encodedPassword)
                .roles("USER", "ADMIN")
                .build();
        return new InMemoryUserDetailsManager(user, admin);
    }
    @Bean
    protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/form").authenticated()
                .and().formLogin()
                .loginPage("/login")
                .and().logout().logoutSuccessUrl("/")
                .permitAll()
                .and().exceptionHandling().accessDeniedPage("/403");
        return http.build();
    }
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
package pl.revida.charity.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()

                .antMatchers("/").permitAll()
                .antMatchers("/form").authenticated()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .and().formLogin()
                .loginPage("/login")
//                .failureUrl("/login?error=true")
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
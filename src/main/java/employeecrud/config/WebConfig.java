package employeecrud.config;

import employeecrud.exception.GlobalExceptionHandler;
import employeecrud.interceptor.LoginInterceptor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan({
        "employeecrud.controller",
        "employeecrud.exception"
})
public class WebConfig implements WebMvcConfigurer {

    // =========================================================
    // VIEW RESOLVER
    // =========================================================

    @Override
    public void configureViewResolvers(
            org.springframework.web.servlet.config.annotation.ViewResolverRegistry registry) {

        InternalResourceViewResolver resolver =
                new InternalResourceViewResolver();

        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");

        registry.viewResolver(resolver);
    }


    // =========================================================
    // LOGIN INTERCEPTOR
    // =========================================================

    @Override
    public void addInterceptors(
            InterceptorRegistry registry) {

        registry
                .addInterceptor(new LoginInterceptor())
                .addPathPatterns("/employees/**");
    }
}
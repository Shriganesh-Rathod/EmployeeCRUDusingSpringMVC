package employeecrud.config;

import employeecrud.filter.LoginFilter;
import jakarta.servlet.Filter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer
        extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {

        return new Class<?>[]{
                RootConfig.class
        };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {

        return new Class<?>[]{
                WebConfig.class
        };
    }

    @Override
    protected String[] getServletMappings() {

        return new String[]{
                "/"
        };
    }

    // =========================================================
    // REGISTER SERVLET FILTERS
    // =========================================================

    @Override
    protected Filter[] getServletFilters() {

        return new Filter[]{
                new LoginFilter()
        };
    }
}
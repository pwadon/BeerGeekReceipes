package packages.app;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import packages.converter.RecipeConverter;
import packages.converter.StyleConverter;
import packages.converter.UserConverter;


@Configuration
@ComponentScan("packages")
@EnableWebMvc
@EnableTransactionManagement
public class FormatterConfig implements WebMvcConfigurer {

    @Override
    public void addFormatters(FormatterRegistry registry) {

        registry.addConverter(getUserConverter());
        registry.addConverter(getRecipeConverter());
        registry.addConverter(getStyleConverter());
    }

    @Bean
    public UserConverter getUserConverter(){
        return new UserConverter();
    }

    @Bean
    public RecipeConverter getRecipeConverter(){
        return new RecipeConverter();
    }

    @Bean
    public StyleConverter getStyleConverter(){
        return new StyleConverter();
    }



}
package packages.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import packages.entity.Style;
import packages.repository.StyleRepository;

public class StyleConverter implements Converter<String, Style> {

    @Autowired
    private StyleRepository styleRepository;

    @Override
    public Style convert(String s){
        return styleRepository.findOne(Long.parseLong(s));
    }
}

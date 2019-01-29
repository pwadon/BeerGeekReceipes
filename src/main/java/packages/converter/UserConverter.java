package packages.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import packages.entity.User;
import packages.repository.UserRepository;

public class UserConverter implements Converter<String, User> {


    @Autowired
    private UserRepository userRepository;

    @Override
    public User convert(String s) {
        return userRepository.findOne(Long.parseLong(s));
    }
}

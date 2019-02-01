package packages.controller.rest;

import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.Hibernate;
import org.hibernate.annotations.Fetch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.web.bind.annotation.*;
import packages.entity.User;
import packages.repository.UserRepository;
import packages.service.UserService;

import javax.persistence.FetchType;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("api/user")
public class UserRestController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;


    @GetMapping("/list")
    @ResponseBody
    public String list() {

        List<User> userList = userRepository.findAll();

        ObjectMapper mapper = new ObjectMapper();
        try {
            String json = mapper.writeValueAsString(userList);
            return json;
        }catch (Exception e){
            return "{'error': 'Parse problem'}" + e;
        }
    }

    @PostMapping("/add")
    @ResponseBody
    public String add(@RequestBody String requestBody, String repeatedPassword) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            User user =  mapper.readValue(requestBody, User.class);
            List<String> errors = userService.registerUser(user, repeatedPassword);
            if(errors.size() > 0){
                return mapper.writeValueAsString(errors);
            }else{
                return mapper.writeValueAsString(user);
            }
        } catch (IOException e) {
            return "{'error':'Parse error'}";
        }
    }
}

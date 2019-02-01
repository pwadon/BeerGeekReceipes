package packages.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.repository.UserRepository;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RecipeRepository recipeRepository;

    public List<String> registerUser(User user, String repeatedPassword) {

        List<String> errors = new ArrayList<>();

        if (userRepository.findByLogin(user.getLogin()) != null) {
            errors.add("userError");
        }

        if (userRepository.findByEmail(user.getEmail()) != null) {
            errors.add("emailError");
        }

        if (!user.getPassword().equals(repeatedPassword)) {
            errors.add("pwdError");
        }

        if (errors.size() == 0) {

            //create admin if this is first user
            if (userRepository.findAll().isEmpty()) {
                user.setAdmin(true);
            }

            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            userRepository.save(user);
        }

        return errors;
    }

    public List<String> loginUser(String login, String password, HttpSession sess) {
//nie dziala sprawdzanie loginu/ tylko haslo dziala
        List<String> errors = new ArrayList<>();
        User user = userRepository.findByLogin(login);
        if (user == null) {
            errors.add("e");
            return errors;
        }
        if (!BCrypt.checkpw(password, user.getPassword())) {
            errors.add("errorPassword");
            return errors;
        }
        if (user.isEnabled()) {
            sess.setAttribute("user", user);
        } else {
            sess.setAttribute("user", null);
        }
        return errors;
    }

    public List<String> editUser(User user, String login) {

        List<String> errors = new ArrayList<>();
        User userByLogin = userRepository.findByLogin(login);
        User userByEmail = userRepository.findByEmail(user.getEmail());

        try {
            if (!userByLogin.getId().equals(user.getId())) {
                errors.add("userError");
            }
        } catch (NullPointerException n) {
        }
        try {
            if (!userByEmail.getId().equals(user.getId())) {
                errors.add("emailError");
            }
        } catch (NullPointerException n) {
        }

//        if (!user.getPassword().equals(password)) {
//            errors.add("pwdError");
//        }
        if (errors.size() == 0) {

            //create admin if this is first user
            if (user.isAdmin()) {
                user.setAdmin(true);
            }
//        if (user.getPassword().length() > 0)
//            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
//        }else {
//            user.setPassword(userByLogin.getPassword());
            userRepository.save(user);
        }


        return errors;
    }

    public boolean isLoggedIn(HttpSession sess) {
        return (sess.getAttribute("user") != null);
    }

    public void delUser(HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        userRepository.delete(user);
        session.removeAttribute("user");
    }

    public void userProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (recipeRepository.getAllByUser(user).isEmpty()) {
            model.addAttribute("noRecipes", true);

        } else {
            model.addAttribute("noRecipes", false);
            List<Recipe> recipes = recipeRepository.getAllByUser(user);
            model.addAttribute("recipes", recipes);
        }
    }
    public void checkErrors(List<String> violations, Model model){
        violations.forEach( err -> {
            switch(err){
                case "userError":
                    model.addAttribute("userError", true);
                    break;
                case "emailError":
                    model.addAttribute("emailError", true);
                    break;
                case "pwdError":
                    model.addAttribute("pwdError", true);
                    break;
            } });

    }
}

package com.casestudydraft.webcontroller;

import com.casestudydraft.model.Pantry;
import com.casestudydraft.model.User;
import com.casestudydraft.service.PantryService;
import com.casestudydraft.service.SecurityService;
import com.casestudydraft.service.UserService;
import com.casestudydraft.tools.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PantryService pantryService;

    @GetMapping("/accessDenied")
    public String accessDenied(){
        return "misc/accessDenied";
    }
    @GetMapping("/register")
    public String registration(@ModelAttribute("userForm") User user) {
        return "auth/register";
    }

    @PostMapping("/register")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "auth/register";
        }
        userForm.setPantry(new Pantry());
        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/dashboard";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout, @ModelAttribute("user") User user) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "auth/login";
    }


    @GetMapping("/")
    public String welcome() {
        return "redirect:home";
    }
    @GetMapping("/home")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("pages/landing");
        return mav;
    }


}
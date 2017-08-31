package us.duia.leejo0531.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import us.duia.leejo0531.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userSvc;
	
}

package top.jacktu.page.controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.jacktu.page.service.MainService;

@Controller
@RequestMapping({ "/main" })
public class MainController {
	@Resource
	private MainService mainservice;

	@RequestMapping(value = { "/java" }, produces = { "text/html;charset=UTF-8" })
	@ResponseBody
	public String java(HttpServletResponse response) {
		return 	  "<br/><br/>"
				+ "<h3 align=\"center\">不知道写点啥,就返回个Hello World 吧.<h3>"
				+ "<br/><br/><br/>"
				+ "<h1 style='color:red' align=\"center\">Hello World<h1>";
	}

	@RequestMapping(value = { "/send_msg" }, method = { RequestMethod.POST })
	@ResponseBody
	public String get_msg(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String leave_msg = request.getParameter("leave_msg");
		String user_name = request.getParameter("user_name");
		this.mainservice.saveMsg(user_name, leave_msg);
		return "successful";
	}

	@RequestMapping(value = { "/saveVisitor" }, method = { RequestMethod.GET })
	@ResponseBody
	public String saveVisitor(HttpServletResponse response, HttpServletRequest request) {
		return this.mainservice.saveVisitor(request);
	}
}
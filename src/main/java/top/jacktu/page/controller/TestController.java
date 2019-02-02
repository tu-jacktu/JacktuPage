package top.jacktu.page.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/test"})
@CrossOrigin(origins = {"http://localhost:9090"}, maxAge = 3600L)
public class TestController {
	@RequestMapping({"/test"})
	@ResponseBody
	public Map<String, Object> hello(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", "jakctu's personal page");
		map.put("msg", "跨域成功!");
		return map;
	}
}
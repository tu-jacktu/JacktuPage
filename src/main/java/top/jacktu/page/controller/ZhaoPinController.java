package top.jacktu.page.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.jacktu.page.bean.Job;
import top.jacktu.page.bean.SouJob;
import top.jacktu.page.service.ZhaoPinService;
/**
 * 返回招聘信息,为 智联招聘爬虫所做接口
 * 对本项目无作用,可以删除
 * @author jacktu
 */
@Controller
@RequestMapping({"/zhaopin"})
@CrossOrigin(origins = {"http://localhost:9090"}, maxAge = 3600L)
public class ZhaoPinController {
	@Autowired
	private ZhaoPinService service;

	@RequestMapping(value = {"/findJobs"}, method = {RequestMethod.GET})
	@ResponseBody
	public List<Job> findJobs(HttpServletResponse response, HttpServletRequest request, SouJob zhaopin) {
		System.out.println(zhaopin);
		return this.service.findJobs(zhaopin);
	}

	@RequestMapping(value = {"/findOne"}, method = {RequestMethod.GET})
	@ResponseBody
	public Job findOne(HttpServletResponse response, HttpServletRequest request, int jobCode) {
		return this.service.findOne(jobCode);
	}
}
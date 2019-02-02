package top.jacktu.page.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import top.jacktu.page.bean.Jfile;
import top.jacktu.page.bean.Result;
import top.jacktu.page.service.DownLoadService;

@Controller
@RequestMapping({ "/download" })
public class DownLoadController {
	@Autowired
	private DownLoadService service;

	@ResponseBody
	@RequestMapping({ "/getFileList" })
	public Result getFileList() {
		return this.service.getFileList();
	}

	@RequestMapping({ "/upload" })
	@ResponseBody
	public Result upload(Jfile jf, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
		Result r = new Result((Object) null, "", 0, true);
		service.upload(r, jf, file, request);
		return r;
	}

	@RequestMapping(value = { "/downfile/{localname}/j" })
	public void downfile(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("localname") String localname) throws IOException {
		service.downfile(request, response, localname);
	}

}
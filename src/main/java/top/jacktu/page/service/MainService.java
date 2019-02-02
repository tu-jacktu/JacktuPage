package top.jacktu.page.service;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import top.jacktu.page.bean.UserMsg;
import top.jacktu.page.bean.Visitor;
import top.jacktu.page.mapper.MainMapper;

@Service
public class MainService {
	@Resource
	private MainMapper mainMapper;

	public void saveMsg(String leave_name, String leave_msg) {
		UserMsg msg = new UserMsg();
		msg.setLeave_name(leave_name);
		msg.setLeave_msg(leave_msg);
		this.mainMapper.saveMsg(msg);
	}

	public String saveVisitor(HttpServletRequest request) {
		try {
			this.mainMapper.saveVisitor(new Visitor(request));
			return "successful";
		} catch (IOException var3) {
			return var3.getMessage();
		}
	}
}
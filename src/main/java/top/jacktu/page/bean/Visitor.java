package top.jacktu.page.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Serializable;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import top.jacktu.page.util.IpUtil;

public class Visitor implements Serializable {
	private static final long serialVersionUID = 1007400536948520097L;
	private String user_agent;
	private String os_name;
	private String os_version;
	private String os_arch;
	private String protocol;
	private String encode;
	private String remoteAddr;
	private String ip_location;
	private String visitTime;
	private String others;

	public Visitor() {
	}

	public String getIp_location() {
		return this.ip_location;
	}

	public void setIp_location(String ip_location) {
		this.ip_location = ip_location;
	}

	public String getUser_agent() {
		return this.user_agent;
	}

	public void setUser_agent(String user_agent) {
		this.user_agent = user_agent;
	}

	public String getOs_name() {
		return this.os_name;
	}

	public void setOs_name(String os_name) {
		this.os_name = os_name;
	}

	public String getOs_version() {
		return this.os_version;
	}

	public void setOs_version(String os_version) {
		this.os_version = os_version;
	}

	public String getOs_arch() {
		return this.os_arch;
	}

	public void setOs_arch(String os_arch) {
		this.os_arch = os_arch;
	}

	public String getProtocol() {
		return this.protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	public String getEncode() {
		return this.encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
	}

	public String getRemoteAddr() {
		return this.remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}

	public String getOthers() {
		return this.others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public String getVisitTime() {
		return this.visitTime;
	}

	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}

	public static long getSerialversionuid() {
		return 1007400536948520097L;
	}

	public Visitor(HttpServletRequest r) throws IOException {
		this.setUser_agent(r.getHeader("user-agent"));
		this.setOs_name(System.getProperty("os.name"));
		this.setOs_version(System.getProperty("os.version"));
		this.setOs_arch(System.getProperty("os.arch"));
		this.setProtocol(r.getProtocol());
		this.setEncode(r.getCharacterEncoding());
		this.setRemoteAddr(r.getRemoteAddr());

		try {
			this.setIp_location(IpUtil.getAddrOfIP(this.getRemoteAddr()));
		} catch (Exception var7) {
			this.setIp_location(var7.getMessage());
		}

		StringBuffer info = new StringBuffer();
		info.append("Accept：" + r.getHeader("Accept"));
		info.append("Accept-语言：" + r.getHeader("Accept-Language"));
		info.append("Accept-编码：" + r.getHeader("Accept-Encoding"));
		info.append("Connection：" + r.getHeader("Connection"));
		info.append("Cookie：" + r.getHeader("Cookie"));
		info.append("客户端发出请求时的完整URL" + r.getRequestURL());
		info.append("请求行中的资源名部分" + r.getRequestURI());
		info.append("请求行中的参数部分" + r.getRemoteAddr());
		info.append("WEB服务器的IP地址" + r.getLocalAddr());
		info.append("WEB服务器的主机名" + r.getLocalName());
		info.append("客户机请求方式" + r.getMethod());
		info.append("请求的文件的路径" + r.getServerName());
		info.append("请求体的数据流" + r.getReader());
		BufferedReader br = r.getReader();
		String res = "";

		while ((res = br.readLine()) != null) {
			info.append("request body:" + res);
		}

		info.append("请求所使用的协议名称" + r.getProtocol());
		info.append("请求中所有参数的名字" + r.getParameterNames());
		Enumeration<?> enumNames = r.getParameterNames();

		while (enumNames.hasMoreElements()) {
			String key = (String) enumNames.nextElement();
			info.append("参数名称：" + key);
		}

		this.others = info.toString();
	}
}
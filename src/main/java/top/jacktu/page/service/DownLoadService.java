package top.jacktu.page.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import top.jacktu.page.bean.Jfile;
import top.jacktu.page.bean.Result;
import top.jacktu.page.mapper.DownloadMapper;

@Service
public class DownLoadService {
	@Autowired
	DownloadMapper mapper;

	public Result getFileList() {
		Result r = new Result();

		try {
			List<Jfile> fs = this.mapper.findJfiles();
			r.setData(fs);
			r.setTotal(fs.size());
		} catch (Exception var3) {
			r.setSuccess(false);
			r.setMessage(var3.getMessage());
		}

		return r;
	}

	public void upload(Result r, Jfile jf, MultipartFile file, HttpServletRequest request) {
		try {
			String filename = file.getOriginalFilename();
			if (!filename.equals(".null")) {
				filename = System.currentTimeMillis() + "-" + filename;
				String realPath = request.getServletContext().getRealPath("./");
				String path = (new File(realPath)).getParent() + "/files";
				File dir = new File(path);
				if (!dir.exists()) {
					dir.mkdir();
				}

				File f = new File(dir, filename);
				file.transferTo(f);
				jf.setPath(f.getPath());
				jf.setLocalname(filename);
			} else {
				jf.setName("");
			}
			this.mapper.saveJfile(jf);
			r.setMessage("上传成功!");
		} catch (Exception var10) {
			r.setMessage(var10.getMessage());
			r.setSuccess(false);
		}
	}

	public void downfile(HttpServletRequest request, HttpServletResponse response, String localname)
			throws IOException {
		String realPath = request.getServletContext().getRealPath("./");
		String path = (new File(realPath)).getParent() + "/files";
		path = path + "/" + localname;
		try {
			byte[] bytes = this.readFile(path);
			String fileName = path.substring(path.lastIndexOf("/"), path.length());
			response.setContentLength(bytes.length);
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
			OutputStream out = response.getOutputStream();
			out.write(bytes);
			out.close();
		} catch (FileNotFoundException e) {
			response.setContentType("text/html;charset=UTF-8");
			String content = "<br/><br/>" + "<h1 style='color:red' align=\"center\">找不到该文件!<h1>";
			PrintWriter pw = response.getWriter();
			pw.println(content);
			pw.close();
		}
	}

	private byte[] readFile(String path) throws FileNotFoundException, IOException {
		File file = new File(path);
		byte[] bytes = new byte[(int) file.length()];
		FileInputStream in = new FileInputStream(file);
		in.read(bytes);
		in.close();
		return bytes;
	}
}
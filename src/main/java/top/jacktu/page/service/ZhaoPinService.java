package top.jacktu.page.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.jacktu.page.bean.Job;
import top.jacktu.page.bean.SouJob;
import top.jacktu.page.mapper.ZhaoPinMapper;

@Service
public class ZhaoPinService {
	@Autowired
	private ZhaoPinMapper mapper;

	public List<Job> findJobs(SouJob zhaopin) {
		return this.mapper.findJobs(zhaopin);
	}

	public Job findOne(int jobCode) {
		return this.mapper.findOne(jobCode);
	}
}
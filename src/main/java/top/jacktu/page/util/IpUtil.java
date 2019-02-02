package top.jacktu.page.util;

import java.io.IOException;
import org.lionsoul.ip2region.DataBlock;
import org.lionsoul.ip2region.DbConfig;
import org.lionsoul.ip2region.DbMakerConfigException;
import org.lionsoul.ip2region.DbSearcher;
import org.lionsoul.ip2region.Util;

public class IpUtil {
	public static String getAddrOfIP(String ip) throws IOException, DbMakerConfigException {
		boolean isIpAddress = Util.isIpAddress(ip);
		if (isIpAddress) {
			DbConfig config = new DbConfig();
			String dbfile = IpUtil.class.getResource("/ipconf/ip2region.db").getPath();
			DbSearcher searcher = new DbSearcher(config, dbfile);
			DataBlock block = searcher.btreeSearch(ip);
			return block.getRegion();
		} else {
			return "不是合法IP地址:" + ip;
		}
	}
}
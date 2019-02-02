package top.jacktu.page.mapper;

import top.jacktu.page.bean.UserMsg;
import top.jacktu.page.bean.Visitor;

public interface MainMapper {
	void saveMsg(UserMsg var1);

	void saveVisitor(Visitor var1);
}
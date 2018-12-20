package spring.service.admin;

import java.util.Map;

public interface VisitCountDAO {
	void insertVisitor(Map<String, Object> map);
	int countSession(String VISIT_SESSION);
	int countIP(String VISIT_IP);
	int countAll_today();
	int countAll_all();
}

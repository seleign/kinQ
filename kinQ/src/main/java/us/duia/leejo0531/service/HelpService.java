package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.HelpDao;

@Service
@Repository
public class HelpService {
	
	@Autowired
	private HelpDao helpDao;
}

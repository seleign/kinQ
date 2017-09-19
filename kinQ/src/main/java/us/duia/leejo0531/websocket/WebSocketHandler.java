package us.duia.leejo0531.websocket;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.AlarmVO;

public class WebSocketHandler extends TextWebSocketHandler{
	@Autowired
	UserDAO userdao;
	
	private final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
//	List<WebSocketSession> sessions = new ArrayList<>();
	
//	List<Member> members = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("*******웹소켓 메시지 :"+message.getPayload());
		int userNum = Integer.parseInt(message.getPayload());
		ArrayList<AlarmVO> alarmlist = userdao.getUserAlarm(userNum);
		int listsize = alarmlist.size();
		String listnum = Integer.toString(listsize);
		session.sendMessage(new TextMessage(listnum));
		
	}
}

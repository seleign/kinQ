package us.duia.leejo0531.websocket;

import java.io.IOException;
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
		//logger.info("웹소켓 연결됨: " + session.getAttributes());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//logger.info("웹소켓 연결 끊김: " + session.getAttributes());
		// session.close();
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		if(session == null) { // 세션이 유효하지 않을 경우
			return;
		} else if(!session.isOpen()) { // 소켓이 열리지 않았을 경우
			return;
		}
		
		// 메시지 내용이 없을 경우
		if(message.getPayloadLength() == 0) {
			return;
		} 
		
		// header.jsp로부터 유저 num을 받고 있으므로...
		int userNum = Integer.parseInt(message.getPayload());
	
		ArrayList<AlarmVO> alarmlist = userdao.getUserAlarm(userNum);
		int listsize = alarmlist.size();
		String listnum = Integer.toString(listsize);
		session.sendMessage(new TextMessage(listnum));
	}
}

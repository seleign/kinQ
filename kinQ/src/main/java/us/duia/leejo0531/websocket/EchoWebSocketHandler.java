package us.duia.leejo0531.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.context.support.ContextExposingHttpServletRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoWebSocketHandler extends TextWebSocketHandler{
	
//	List<WebSocketSession> sessions = new ArrayList<>();
	
//	List<Member> members = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("접속! : " + session.getLocalAddress());
//		String temp = "접속 완료 되었습니다.";
//		session.sendMessage(new TextMessage(temp));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
//		String temp = message.getPayload();
//		System.out.println("client에게 받은 메세지 : " + temp);
//		ContextExposingHttpServletRequest();
		
		
	}
}

package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session); // 세션추가
		System.out.println(session.getId() + "님이 서버에 접속하셨습니다.");
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		System.out.println("메세지 전송 : " + session.getId() + ":" + message);
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println( session.getId() + "님이 서버에서 나가셨습니다.");
	}
	
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
	
	// ws://호스트:포트번호/컨텍스트루트/ChatingServer
	
	
}

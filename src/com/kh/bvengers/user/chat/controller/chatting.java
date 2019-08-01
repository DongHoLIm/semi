package com.kh.bvengers.user.chat.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatting")
public class chatting {
	
	private static Map<String, Session> client = Collections.synchronizedMap(new HashMap<String, Session>());
	private static Map<String, Session> admin = Collections.synchronizedMap(new HashMap<String, Session>());

	public chatting() {
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		String hapche = session.getQueryString();
		System.out.println(hapche);
		int idx = hapche.indexOf("$");
		String jd = hapche.substring(0, idx);
		String no = hapche.substring(idx+1);
		
		System.out.println(jd);
		System.out.println(no);
		
		
		
		String[] cId = message.split(":");
		String id = cId[0];
		synchronized (admin) {
			try {
				Iterator<String> keySetIterator = admin.keySet().iterator();
				while (keySetIterator.hasNext()) {
					String key = keySetIterator.next();
					client.get(key).getBasicRemote().sendText(message);
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		synchronized (client) {
			try {
				Iterator<String> keySetIterator = client.keySet().iterator();
				while (keySetIterator.hasNext()) {
					String key = keySetIterator.next();
					admin.get(key).getBasicRemote().sendText(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@OnOpen
	public void onOpen(Session session) {
		String id = session.getQueryString();
		String[] cId = id.split("=");
		id = cId[1];
		if (id.equals("admin")) {
			admin.put(id, session);
		} else {
			client.put(id, session);
		}
	}

	@OnClose
	public void onClose(Session session) {
		String id = session.getQueryString();
		String[] cId = id.split("=");
		id = cId[1];
		client.remove(id, session);
	}
}

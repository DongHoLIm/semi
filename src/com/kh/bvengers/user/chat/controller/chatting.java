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

import com.kh.bvengers.user.chat.model.service.TargetService;

@ServerEndpoint("/chatting")
public class chatting {
	private static Map<String, Session> client = Collections.synchronizedMap(new HashMap<String, Session>());

	public chatting() {
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		synchronized (client) {
			String id = session.getQueryString();
			String[] cId = id.split("=");
			id = cId[1];
			int idx = id.indexOf("&");
			id = id.substring(0, idx);

			String no = session.getQueryString();
			String[] cNo = no.split("&");
			int idx2 = no.indexOf("=");
			no = cNo[1].substring(idx2 + 1, cNo[1].length());

			String target = new TargetService().selectTarget(no);
			try {
				Iterator<String> keySetIterator = client.keySet().iterator();
				while (keySetIterator.hasNext()) {
					String key = keySetIterator.next();
					if(id.equals("admin") || target.equals(id))
					client.get(key).getBasicRemote().sendText(message);
					System.out.println("key: " + key + " value: " + client.get(key) + " target: " + target + " no:" + no);
					/*if (key.equals(target)) {
					} else if(key.equals("admin")) {
						client.get(key).getBasicRemote().sendText(message);
					}*/
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
		int idx = id.indexOf("&");
		id = id.substring(0, idx);
		client.put(id, session);
	}

	@OnClose
	public void onClose(Session session) {
		String id = session.getQueryString();
		String[] cId = id.split("=");
		id = cId[1];
		int idx = id.indexOf("&");
		id = id.substring(0, idx);
		client.remove(id, session);
	}

}

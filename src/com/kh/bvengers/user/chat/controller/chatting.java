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
			String no = session.getQueryString();
			String[] cNo = no.split("&");
			no = cNo[1];
			System.out.println("no ::: " + no);
			int target = new TargetService().selectTarget(id);
			try {
				Iterator<String> keySetIterator = client.keySet().iterator();
				while (keySetIterator.hasNext()) {
					String key = keySetIterator.next();
					System.out.println("key: " + key + " value: " + client.get(key) + " target: " + target);
					/*
					 * if(!client.get(key).equals("admin")) { }
					 */
					if (target == 1 || target == 2301) {
						client.get(key).getBasicRemote().sendText(message);
					}
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
		client.put(id, session);
	}

	@OnClose
	public void onClose(Session session) {
		String id = session.getQueryString();
		String[] cId = id.split("=");
		id = cId[1];
		client.remove(id, session);
	}

}

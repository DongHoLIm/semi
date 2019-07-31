package com.kh.bvengers.user.chat.model.vo;

import java.util.Date;

public class Chat {
	private String memberNo;
	private String chat;
	private Date chatDate;
	private String memberId;
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Chat(String memberNo, String chat, Date chatDate, String memberId) {
		this.memberNo = memberNo;
		this.chat = chat;
		this.chatDate = chatDate;
		this.memberId = memberId;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	public Date getChatDate() {
		return chatDate;
	}
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "Chat [memberNo=" + memberNo + ", chat=" + chat + ", chatDate=" + chatDate + ", memberId=" + memberId
				+ "]";
	}

}

package com.kh.bvengers.board.model.vo;

import java.io.Serializable;

public class Board  implements Serializable{
	private int postsId;
	private String postsTitle;
	private int memberNo;
	private int postsViews;
	private int recommendCount;
	private String open;
	private String notice;
	private String postsDelete;
	private String boardCode;
	private String contents;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int postsId, String postsTitle, int memberNo, int postsViews, int recommendCount, String open,
			String notice, String postsDelete, String boardCode, String contents) {
		super();
		this.postsId = postsId;
		this.postsTitle = postsTitle;
		this.memberNo = memberNo;
		this.postsViews = postsViews;
		this.recommendCount = recommendCount;
		this.open = open;
		this.notice = notice;
		this.postsDelete = postsDelete;
		this.boardCode = boardCode;
		this.contents = contents;
	}

	public int getPostsId() {
		return postsId;
	}

	public void setPostsId(int postsId) {
		this.postsId = postsId;
	}

	public String getPostsTitle() {
		return postsTitle;
	}

	public void setPostsTitle(String postsTitle) {
		this.postsTitle = postsTitle;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPostsViews() {
		return postsViews;
	}

	public void setPostsViews(int postsViews) {
		this.postsViews = postsViews;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getPostsDelete() {
		return postsDelete;
	}

	public void setPostsDelete(String postsDelete) {
		this.postsDelete = postsDelete;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}

package web.chatting.com.VO;

public class Chat {
	private String chatname;
	private String chatcontent;
	private String chattime;
	
	
	public Chat() {

	}


	public String getChatname() {
		return chatname;
	}


	public void setChatname(String chatname) {
		this.chatname = chatname;
	}


	public String getChatcontent() {
		return chatcontent;
	}


	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}


	public String getChattime() {
		return chattime;
	}


	public void setChattime(String chattime) {
		this.chattime = chattime;
	}


	@Override
	public String toString() {
		return "Chat [chatname=" + chatname + ", chatcontent=" + chatcontent + ", chattime=" + chattime + "]";
	}
	
	
	
	
	
}

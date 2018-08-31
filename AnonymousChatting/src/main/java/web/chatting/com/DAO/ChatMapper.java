package web.chatting.com.DAO;

import java.util.ArrayList;

import web.chatting.com.VO.Chat;

public interface ChatMapper {

	int submitChat(Chat chat);

	Chat selectChat();

	ArrayList<Chat> getChatList(String nowTime);

}

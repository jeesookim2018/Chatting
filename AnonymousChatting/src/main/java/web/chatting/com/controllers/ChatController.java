package web.chatting.com.controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.chatting.com.DAO.ChatMapper;
import web.chatting.com.VO.Chat;




@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping(value = "/submitChat", method = RequestMethod.POST)
	public  @ResponseBody Chat submitChat(Chat chat, Model model) {
			System.out.println("Chat객체:::" + chat);
		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
		int result = chatMapper.submitChat(chat);
			System.out.println("submitChat:::" + result);
		Chat chatDB = new Chat();
		chatDB = chatMapper.selectChat();
			System.out.println("chatDB:::" + chatDB);
		
		return chatDB;
	}
	
	
	
	//특정한 시간대의 채팅 내용 가져오기 
	public ArrayList<Chat> getChatList(String nowTime){
		
		ArrayList<Chat> chatList = new ArrayList<Chat>();
		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
		
		chatList = chatMapper.getChatList(nowTime);
		
		return chatList;
	}
	
	//전송 
	public int submitChat(Chat chat) {
		
		int result = 0;
		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
		
		result = chatMapper.submitChat(chat);
		
		return result;
	}
}

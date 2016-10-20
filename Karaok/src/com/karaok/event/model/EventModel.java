package com.karaok.event.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EventModel {

	
	public EventModel() {
	
	}
	
	public String dateConfirm(String d){
		
		String month = d.substring(0,2);
		String day = d.substring(3,5);
		String year = d.substring(6,10);
		
		String startDate= year+"/"+month+"/"+day;
		
		return startDate;
	}
	
	public String dateCompare(String endDate) {
		SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd");
		Date today=new Date();
		String msg="";
		Date endD = null;
		
		try {
			endD = format.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int compare = endD.compareTo(today);
		
		if(compare>0){
			msg="진행중";
		}else if(compare<0){
			msg="종료";
		}

			return msg;
	}
	
}

package com.uni.member.model.dto;

import java.util.Comparator;

public class MemberListComparator implements Comparator<Member> {

	@Override
	public int compare(Member o1, Member o2) {
		int memNo1 = Integer.parseInt(o1.getUserNo());
		int memNo2 = Integer.parseInt(o2.getUserNo());
		
		if(memNo1 > memNo2) {
			return 1;
		} else if(memNo1 < memNo2) {
			return -1;
		} else {
			return 0;
		}

	}



}

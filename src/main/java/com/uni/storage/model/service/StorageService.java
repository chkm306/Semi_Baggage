package com.uni.storage.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.storage.model.dto.Storage;
import com.uni.storage.model.dao.StorageDao;

public class StorageService {

	public ArrayList<Storage> searchStorage(String address) {
		System.out.println("searchStorage service 실행됨 ");
		Connection conn = getConnection();
		ArrayList<Storage> sList = new StorageDao().searchStorage(conn, address);
		close(conn);
		return sList;
	}

}

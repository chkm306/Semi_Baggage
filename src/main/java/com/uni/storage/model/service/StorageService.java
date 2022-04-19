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

	public Storage selectStorage(int sr_sno) {
		Connection conn = getConnection();
		
		Storage storage = new StorageDao().selectStorage(conn, sr_sno);
		
		close(conn);
		return storage;
	}

	public int insertStorageReserve(Storage sr) {
		Connection conn = getConnection();
		
		int result = new StorageDao().insertStorageReserve(conn, sr);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public Storage selectStoRes(int sr_sno, String userNo) {
		Connection conn = getConnection();
		
		Storage storage = new StorageDao().selectStoRes(conn, sr_sno, userNo);
		
		close(conn);
		return storage;
	}

	public int insertStorage(String userNo, String storageAddress, String storageName) {
		Connection conn = getConnection();
		
		int result = new StorageDao().insertStorage(conn, userNo, storageAddress, storageName);
		
		if(result > 0) {
			commit(conn);
		} else {
			 rollback(conn);
		}
		return result;
	}

	public ArrayList<Storage> reservationList() {
		Connection conn = getConnection();
		
		ArrayList<Storage> list = new StorageDao().reservationList(conn);
		
		close(conn);
		
		return list;
	}

	public int deleteManageStoReserve(int sr_no) {
		Connection conn = getConnection();
		int result = new StorageDao().deleteManageStoReserve(conn, sr_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Storage> StorageList() {
		Connection conn = getConnection();
		ArrayList<Storage> list = new StorageDao().StorageList(conn);
		
		close(conn);
		
		return list;
	}

	public int updateStorage(int storageNo, String storageName, String storageAddress) {
		Connection conn = getConnection();
		
		int result = new StorageDao().updateStorage(conn, storageNo, storageName, storageAddress);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int deleteStorage(int sto_no) {
		Connection conn = getConnection();
		int result = new StorageDao().deleteStorage(conn, sto_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}

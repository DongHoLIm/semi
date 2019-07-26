package com.kh.bvengers.manager.depot.model.servies;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.manager.depot.model.dao.DepotDao;
import com.kh.bvengers.manager.depot.model.vo.Depot;
import static com.kh.bvengers.common.JDBCTemplate.*;

public class DepotService {

	public ArrayList<Depot> selectCheckAll(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Depot>list = new DepotDao().selectCheckAll(con,currentPage,limit);
		
		close(con);
		return list;
	}

	public int requsetCheck(Depot d) {
		Connection con =getConnection();
		
		int result = new DepotDao().insertLocation(con,d);
		int result1= new DepotDao().updateStatus(con,d);
		int lastNum =0;
		if(result>0&&result1>0) {
			commit(con);
			lastNum=1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return lastNum;
	}

	public ArrayList<Depot> selectAllList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Depot> list = new DepotDao().selectAllList(con,currentPage,limit);
		close(con);
		return list;
	}

	public ArrayList<Depot> selectBarcodeAllList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Depot> list = new DepotDao().selectBarcodeAllList(con,currentPage,limit);
		close(con);
		return list;
	}

	public ArrayList<Depot> selectInList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Depot> list =new DepotDao().selectInList(con,currentPage,limit);
		close(con);		
		return list;
	}

	public int updateRelesDate(String productCode) {
		Connection con = getConnection();
		int result = new DepotDao().updateRelesDate(con,productCode);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Depot> outProductList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Depot> list = new DepotDao().outProductList(con,currentPage,limit);		
		close(con);
		return list;
	}

	public int getAllListCount() {
		Connection con = getConnection();
		int listCount = new DepotDao().getAllListCount(con);
		
		close(con);
		return listCount;
	}

	public int getOutProductListCount() {
		Connection con = getConnection();
		int listCount = new DepotDao().getOutProductListCount(con);
		
		close(con);
		return listCount;
	}

	public int getBarcodeCreateListCount() {
		Connection con = getConnection();
		int listCount = new DepotDao().getBarcodeCreateListCount(con);
		
		close(con);
		return listCount;
	}

	public int getInDepotCount() {
		Connection con = getConnection();
		int listCount = new DepotDao().getInDepotCount(con);
		
		close(con);
		return listCount;
	}

	public int getCheckListCount() {
		Connection con = getConnection();
		int listCount = new DepotDao().getCheckListCount(con);
		
		close(con);
		return listCount;
	}

}

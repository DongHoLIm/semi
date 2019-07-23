package com.kh.bvengers.manager.depot.model.servies;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.manager.depot.model.dao.DepotDao;
import com.kh.bvengers.manager.depot.model.vo.Depot;
import static com.kh.bvengers.common.JDBCTemplate.*;

public class DepotService {

	public ArrayList<Depot> selectCheckAll() {
		Connection con = getConnection();
		
		ArrayList<Depot>list = new DepotDao().selectCheckAll(con);
		
		close(con);
		return list;
	}

	public int requsetCheck(Depot d) {
		Connection con =getConnection();
		
		int result = new DepotDao().insertLocation(con,d);
		int result1=0;
		if(result>0) {
			result = new DepotDao().updateStatus(con,d);
			if(result>0) {
				result1=1;
			}
			commit(con);
		}else {
			result = new DepotDao().updateStatus(con,d);
			if(result>0) {
				result1=1;
				commit(con);
			}
			rollback(con);
		}
		
		close(con);
		
		return result1;
	}

	public ArrayList<Depot> selectAllList() {
		Connection con = getConnection();
		ArrayList<Depot> list = new DepotDao().selectAllList(con);
		close(con);
		return list;
	}

	public ArrayList<Depot> selectBarcodeAllList() {
		Connection con = getConnection();
		ArrayList<Depot> list = new DepotDao().selectBarcodeAllList(con);
		close(con);
		return list;
	}

	public ArrayList<Depot> selectInList() {
		Connection con = getConnection();
		ArrayList<Depot> list =new DepotDao().selectInList(con);
		close(con);		
		return list;
	}

}

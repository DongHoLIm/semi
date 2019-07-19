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

}

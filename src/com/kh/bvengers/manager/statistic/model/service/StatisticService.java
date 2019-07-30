package com.kh.bvengers.manager.statistic.model.service;

import static com.kh.bvengers.common.JDBCTemplate.close;
import static com.kh.bvengers.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.bvengers.manager.statistic.model.dao.StatisticDao;

public class StatisticService {

	public ArrayList<HashMap<String, Object>> memberStatistic(String time) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>>  datalist = null;

		ArrayList<String> dateList = new StatisticDao().countDate(con);

		datalist = new StatisticDao().memberStatistic(con, dateList, time);

		close(con);
		return datalist;
	}

}

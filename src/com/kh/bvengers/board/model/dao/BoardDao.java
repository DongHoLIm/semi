package com.kh.bvengers.board.model.dao;

import static com.kh.bvengers.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.board.model.vo.PowerLink;
import com.kh.bvengers.product.model.vo.Product;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/user/product/product-board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> selectProductList(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap< String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectThumbnail");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("fileNo", rset.getString("FILE_NO"));
				hmap.put("originFileName", rset.getString("ORIGIN_FILE_NAME"));
				hmap.put("newFileName", rset.getString("NEW_FILE_NAME"));
				hmap.put("fileSrc", rset.getString("FILE_SRC"));
				hmap.put("saveDate", rset.getDate("SAVE_DATE"));
				hmap.put("fileDiv", rset.getString("FILE_DIV"));
				hmap.put("postsId", rset.getString("POSTS_ID"));
				hmap.put("productCode", rset.getString("PRODUCT_CODE"));
				hmap.put("title", rset.getString("PRODUCT_NAME"));
				hmap.put("price", rset.getInt("PRODUCT_MONEY"));
				hmap.put("writer", rset.getString("MEMBER_NAME"));
				hmap.put("contents", rset.getString("CONTENTS"));
				hmap.put("category", rset.getString("CATEGORY_DIV"));
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}


		return list;
	}


	public ArrayList<HashMap<String, Object>> searchProductByTitle(Connection con, String value) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap< String, Object> hmap = null;
		ResultSet rset = null;
		String find = '%' + value + '%';

		String query = prop.getProperty("searchByTitle");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, find);
			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("fileNo", rset.getString("FILE_NO"));
				hmap.put("originFileName", rset.getString("ORIGIN_FILE_NAME"));
				hmap.put("newFileName", rset.getString("NEW_FILE_NAME"));
				hmap.put("fileSrc", rset.getString("FILE_SRC"));
				hmap.put("saveDate", rset.getDate("SAVE_DATE"));
				hmap.put("fileDiv", rset.getString("FILE_DIV"));
				hmap.put("postsId", rset.getString("POSTS_ID"));
				hmap.put("productCode", rset.getString("PRODUCT_CODE"));
				hmap.put("title", rset.getString("PRODUCT_NAME"));
				hmap.put("price", rset.getInt("PRODUCT_MONEY"));
				hmap.put("writer", rset.getString("MEMBER_NO"));
				hmap.put("contents", rset.getString("CONTENTS"));
				hmap.put("category", rset.getString("CATEGORY_DIV"));

				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public HashMap<String, Object> selectOneProduct(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Board b = null;
		Product p = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;

		String query = prop.getProperty("selectOneProduct");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();
			list = new ArrayList<Attachment>();

			while(rset.next()) {
				b = new Board();
				b.setWriter(rset.getString("MEMBER_ID"));
				b.setPostsId(rset.getInt("POSTS_ID"));
				b.setPostsTitle(rset.getString("PRODUCT_NAME"));
				b.setContents(rset.getString("CONTENTS"));
				b.setMemberNo(rset.getInt("MEMBER_NO"));
				b.setPostsViews(rset.getInt("POSTS_VIEWS"));
				b.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));

				at = new Attachment();
				at.setFileNo(rset.getString("FILE_NO"));
				at.setOrginFileName(rset.getString("ORIGIN_FILE_NAME"));
				at.setNewFileName(rset.getString("NEW_FILE_NAME"));
				at.setFileSrc(rset.getString("FILE_SRC"));

				p = new Product();
				p.setProductMoney(rset.getInt("PRODUCT_MONEY"));
				list.add(at);
			}
			hmap = new HashMap<String, Object>();
			hmap.put("product", p);
			hmap.put("board", b);
			hmap.put("attachment", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	//공지사항 작성 삽입
		public int insertNoticeContent(Connection con, Board b) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("insertNoticeContent");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, b.getPostsTitle());
				pstmt.setInt(2, b.getMemberNo());
				pstmt.setString(3, b.getPostsCode());
				pstmt.setString(4, b.getContents());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}

		public int selectCurrval(Connection con) {
			Statement stmt = null;
			ResultSet rset = null;

			int postId = 0;

			String query = prop.getProperty("selectCurrval");

			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);

				if(rset.next()) {
					postId = rset.getInt("currval");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(stmt);
				close(rset);
			}
			return postId;
		}

		public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("insertAttachment");

			try {
				for(int i = 0; i < fileList.size(); i++) {
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, fileList.get(i).getOrginFileName());
					pstmt.setString(2, fileList.get(i).getNewFileName());
					pstmt.setString(3, fileList.get(i).getFileSrc());
					pstmt.setString(4, fileList.get(i).getPostsId());


					int level = 0;

					if(i==0) {
						level=0;
					}else {
						level=1;
					}

					String level1 = level + "";

					pstmt.setString(5, level1);

					//pstmt.setInt(5, level);

					System.out.println(level1);
					
					result += pstmt.executeUpdate();
				}


			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
      return result;
		}



	public ArrayList<HashMap<String, Object>> searchProductByCategory(Connection con, String value) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap< String, Object> hmap = null;
		ResultSet rset = null;
		String find = '%' + value + '%';

		String query = prop.getProperty("searchByCategory");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, find);
			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("fileNo", rset.getString("FILE_NO"));
				hmap.put("originFileName", rset.getString("ORIGIN_FILE_NAME"));
				hmap.put("newFileName", rset.getString("NEW_FILE_NAME"));
				hmap.put("fileSrc", rset.getString("FILE_SRC"));
				hmap.put("saveDate", rset.getDate("SAVE_DATE"));
				hmap.put("fileDiv", rset.getString("FILE_DIV"));
				hmap.put("postsId", rset.getString("POSTS_ID"));
				hmap.put("productCode", rset.getString("PRODUCT_CODE"));
				hmap.put("title", rset.getString("PRODUCT_NAME"));
				hmap.put("price", rset.getInt("PRODUCT_MONEY"));
				hmap.put("writer", rset.getString("MEMBER_NO"));
				hmap.put("contents", rset.getString("CONTENTS"));
				hmap.put("category", rset.getString("CATEGORY_DIV"));

				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<HashMap<String, Object>> searchProductByContents(Connection con, String value) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap< String, Object> hmap = null;
		ResultSet rset = null;
		String find = '%' + value + '%';

		String query = prop.getProperty("searchByContents");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, find);
			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("fileNo", rset.getString("FILE_NO"));
				hmap.put("originFileName", rset.getString("ORIGIN_FILE_NAME"));
				hmap.put("newFileName", rset.getString("NEW_FILE_NAME"));
				hmap.put("fileSrc", rset.getString("FILE_SRC"));
				hmap.put("saveDate", rset.getDate("SAVE_DATE"));
				hmap.put("fileDiv", rset.getString("FILE_DIV"));
				hmap.put("postsId", rset.getString("POSTS_ID"));
				hmap.put("productCode", rset.getString("PRODUCT_CODE"));
				hmap.put("title", rset.getString("PRODUCT_NAME"));
				hmap.put("price", rset.getInt("PRODUCT_MONEY"));
				hmap.put("writer", rset.getString("MEMBER_NO"));
				hmap.put("contents", rset.getString("CONTENTS"));
				hmap.put("category", rset.getString("CATEGORY_DIV"));
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<PowerLink> powerLink(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		ArrayList<PowerLink> list = null;
		String query = prop.getProperty("powerLink");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<PowerLink>();

			while(rset.next()) {
				PowerLink p = new PowerLink();
				p.setFileName(rset.getString("NEW_FILE_NAME"));
				p.setFileSrc(rset.getString("FILE_SRC"));
				p.setContents(rset.getString("CONTENTS"));
				p.setPrice(rset.getInt("PRODUCT_MONEY"));
				p.setTitle(rset.getString("POSTS_TITLE"));
				p.setPostsId(rset.getString("POSTS_ID"));

				list.add(p);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
  }

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}		
		return listCount;
	}

	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setPostsId(rset.getInt("POSTS_ID"));
				b.setMemberName(rset.getString("MEMBER_NAME"));
				b.setPostsTitle(rset.getString("POSTS_TITLE"));
				b.setPostsViews(rset.getInt("POSTS_VIEWS"));
				b.setCreateDate(rset.getDate("CREATEDATE"));
				
				list.add(b);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public HashMap<String, Object> selectOneNotice(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String,Object> hmap = null;
		Board b = null;
		Attachment at = null;
		ArrayList<Attachment>list = null;
		
		String query = prop.getProperty("selectOneNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				b = new Board();
				b.setPostsId(rset.getInt("POSTS_ID"));
				b.setPostsTitle(rset.getString("POST_TITLE"));
				b.setMemberId(rset.getString("Member_ID"));
				b.setPostsViews(rset.getInt("POSTS_VIEWS"));
				b.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));
				
				at = new Attachment();
				at.setFileNo(rset.getString("FILE_NO"));
				at.setOrginFileName(rset.getString("ORIGIN_FILE_NAME"));
				at.setFileSrc("FILE_SRC");
				at.setSaveDate("SAVE_DATE");
				
				list.add(at);
			}
			
			hmap = new HashMap<String, Object>();
			hmap.put("board", b);
			hmap.put("attachment", list);
			
			System.out.println("hmap " + hmap);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return hmap;
	}

}





































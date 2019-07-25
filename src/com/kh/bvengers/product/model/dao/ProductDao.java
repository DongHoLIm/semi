package com.kh.bvengers.product.model.dao;

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
import com.kh.bvengers.board.model.vo.Posts;
import com.kh.bvengers.board.model.vo.PostsContents;
import com.kh.bvengers.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/user/product/product-board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int insertProductPost(Connection con, Posts posts) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProductPost");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, posts.getPostsTitle());
			pstmt.setString(2, posts.getMemberNo()+"");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPostContents(Connection con, PostsContents postsContents) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPostContents");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postsContents.getPostsId());
			pstmt.setString(2, postsContents.getContents());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertProduct(Connection con, Product product) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product.getProductCode());
			pstmt.setString(2, product.getProductName());
			pstmt.setInt(3, product.getProductMoney());
			pstmt.setString(4, product.getProductCate());
			pstmt.setString(5, product.getMemberNo());
			pstmt.setString(6, product.getKeepDate());
			pstmt.setString(7, product.getPostId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertProductCheck(Connection con, Product product) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProductCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product.getProductCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	

	public int insertAttachments(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachments");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOrginFileName());
				pstmt.setString(2, fileList.get(i).getNewFileName());
				pstmt.setString(3, fileList.get(i).getFileSrc());
				pstmt.setString(4, fileList.get(i).getPostsId());
				pstmt.setString(5, fileList.get(i).getProductCode());
				int level = 0;
				if(i == 0) {
					level = 0;
				}else {
					level = 1;
				}
				pstmt.setInt(6, level);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	public int selectPostsCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int postsId = 0;
		
		String query = prop.getProperty("selectPostsCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				postsId = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return postsId;
	}

	public HashMap<String, Object> productPay(Connection con, String postsId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("productPay");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, postsId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			while(rset.next()) {
				hmap.put("postsId", postsId);
				hmap.put("productName", rset.getString("PRODUCT_NAME"));
				hmap.put("productMoney", rset.getInt("PRODUCT_MONEY"));
				hmap.put("productCate", rset.getString("PRODUCT_CATE"));
				hmap.put("memberId", rset.getString("MEMBER_ID"));
				hmap.put("postsTitle", rset.getString("POSTS_TITLE"));
				hmap.put("newFileName", rset.getString("NEW_FILE_NAME"));
				hmap.put("categoryCode", rset.getString("CATEGORY_CODE"));
				hmap.put("categoryDiv", rset.getString("SUBCATE"));
				hmap.put("mainCateDiv", rset.getString("MAINCATE"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return hmap;
	}
	
	
}














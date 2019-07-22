package com.kh.bvengers.product.model.service;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Posts;
import com.kh.bvengers.board.model.vo.PostsContents;
import com.kh.bvengers.product.model.dao.ProductDao;
import com.kh.bvengers.product.model.vo.Product;

public class ProductService {
	
	//상품등록
		public int insertProductPost(Posts posts, PostsContents postsContents, Product product,
				ArrayList<Attachment> fileList) {
			Connection con = getConnection();
			int result = 0;
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			int result4 = 0;
			int result5 = 0;
			result1 = new ProductDao().insertProductPost(con, posts);
			
			if(result1 > 0) {
				int postsId = new ProductDao().selectPostsCurrval(con);
				
				postsContents.setPostsId(postsId);
			}
			result2 = new ProductDao().insertPostContents(con, postsContents);
			result3 = new ProductDao().insertProduct(con, product);
			
			if(result3 > 0) {
				int pid = new ProductDao().selectProductCurrval(con);
				String productCode = product.getProductCode() + pid;
				//기존의 카테고리 구분을 위한 문자만 들어있는 product.productCode의 값에 시퀀스값을 붙여서 set 시킴
				product.setProductCode(productCode);
			}
			
			result4 = new ProductDao().insertProductCheck(con);
			result5 = new ProductDao().insertAttachments(con, fileList);
			
			
			if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
			
			close(con);
			
			
			return result;
		}
		
		
}

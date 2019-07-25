package com.kh.bvengers.product.model.service;

import static com.kh.bvengers.common.JDBCTemplate.close;
import static com.kh.bvengers.common.JDBCTemplate.commit;
import static com.kh.bvengers.common.JDBCTemplate.getConnection;
import static com.kh.bvengers.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Posts;
import com.kh.bvengers.board.model.vo.PostsContents;
import com.kh.bvengers.product.model.dao.ProductDao;
import com.kh.bvengers.product.model.vo.Product;
import com.kh.bvengers.user.member.model.vo.Member;

public class ProductService {
	
	//상품등록
		public int insertProductPost(Member member, Posts posts, PostsContents postsContents, Product product,
				ArrayList<Attachment> fileList) {
			Connection con = getConnection();
			int result = 0;
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			int result4 = 0;
			int result5 = 0;
			int result6 = 0;
			result1 = new ProductDao().insertProductPost(con, posts);
			
			if(result1 > 0) {
				int postsId = new ProductDao().selectPostsCurrval(con);
				postsContents.setPostsId(postsId);
				product.setPostId(postsId+"");
				for(int i = fileList.size()-1; i >= 0; i--) {
				fileList.get(i).setPostsId(postsId+"");
				}
			}else {
				return result;
			}
			
			result2 = new ProductDao().insertPostContents(con, postsContents);
			result3 = new ProductDao().insertProduct(con, product);
			result4 = new ProductDao().insertProductCheck(con, product);

			result5 = new ProductDao().insertAttachments(con, fileList);
			result6 = new ProductDao().updateMemberEtc(con, member);
			
			if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 && result6 > 0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
			
			close(con);
			
			
			return result;
		}

		public HashMap<String, Object> productPay(String postsId) {
			Connection con = getConnection();
			
			HashMap<String, Object> productPay = new ProductDao().productPay(con, postsId);
			
			close(con);
			
			return productPay;
		}
		
		
}

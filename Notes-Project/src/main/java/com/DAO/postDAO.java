package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class postDAO {

    private Connection conn;

    public postDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean AddNotes(String title, String content, int uid) {
        boolean f = true;

        try {
            String query = " insert into post(title, content, uid) VALUES (?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, uid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
    public List<Post> getData(int id) {
    	
    	List<Post> list=new ArrayList<Post>();
    	Post po=null;
    	try {
			
    		String qu="select * from post where uid=? order by id DESC";
    		PreparedStatement ps=conn.prepareStatement(qu);
    		ps.setInt(1, id);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			po=new Post();
    			po.setId(rs.getInt(1));
    			po.setTitle(rs.getString(2));
    			po.setContent(rs.getString(3));
    			list.add(po);
    			
    		}
    		
		} catch (Exception e) {
			
		}
    	
    	
		return list;
    }
    
    
//    public Post getDataById(int noteId)
//    {
//    	
//    	Post p=null;
//    	
//    	
//    	try {
//    		
//    		String qu="select * from post where id=?";
//    		PreparedStatement ps=conn.prepareStatement(qu);
//    		ps.setInt(1, noteId);
//    		
//    		ResultSet rs=ps.executeQuery();
//    		if(rs.next())
//    		{
//    			p=new Post();
//    			p.setId(rs.getInt(1));
//    			p.setTitle(rs.getString(2));
//    			p.setContent(rs.getString(3));
//    		}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//    	
//    	
//		return p;
//    	
//    }

    public Post getPostById(int id) {
        Post p = null;
        try {
            String sql = "SELECT * FROM post WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Post();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                // other fields if any
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }


    public boolean updatePost(Post post) {
        boolean isUpdated = false;

        try {
            String sql = "UPDATE post SET title = ?, content = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getContent());
            ps.setInt(3, post.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (Exception e) {
            System.out.println("Error updating post with ID " + post.getId());
            e.printStackTrace();
        }

        return isUpdated;
    }

    
    public boolean deletePostById(int id) {
        boolean deleted = false;
        String sql = "DELETE FROM post WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            deleted = result > 0;

            if (deleted) {
                System.out.println("✅ Post deleted successfully (ID: " + id + ")");
            } else {
                System.out.println("⚠️ No post found to delete (ID: " + id + ")");
            }

        } catch (Exception e) {
            System.out.println("❌ Error deleting post (ID: " + id + ")");
            e.printStackTrace();
        }

        return deleted;
    }


    
    
    
}

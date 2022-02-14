package myService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import myModel.MyMember;
import myUtil.MyJdbcConnection;

public class MyMemberDao {
	public int insertmyMember1(HttpServletRequest request) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		
		String mysql = "insert into mymember " + " values(?,?,?,?,?,?,?)";
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1, request.getParameter("myid"));
			pstmt1.setString(2, request.getParameter("mypasswd"));
			pstmt1.setString(3, request.getParameter("myname"));
			pstmt1.setString(4, request.getParameter("mygender"));
			pstmt1.setString(5, request.getParameter("mytel"));
			pstmt1.setString(6, request.getParameter("myemail"));
			pstmt1.setString(7, request.getParameter("mypicture"));
			
			return pstmt1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1, pstmt1, null);
		}
		
		return 0;
	}//end insertMymember1
	
	
	
	public MyMember selectMyOne(String myid) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		String mysql = "select * from mymember " + " where myid = ?";
		ResultSet rs1 = null;
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1,myid);
			rs1 = pstmt1.executeQuery();
			
			if(rs1.next()) {
				MyMember mm = new MyMember(
						rs1.getString("myid"),
						rs1.getString("mypasswd"),
						rs1.getString("myname"),
						rs1.getInt("mygender"),
						rs1.getString("mytel"),
						rs1.getString("myemail"),
						rs1.getString("mypicture")
						);
				return mm;
						
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1,pstmt1,rs1);
		}
		
		return null;
		
	}//end selectMyOne
	
	
	
	public int updateInfo(MyMember mm) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		String mysql = "update mymember set mytel =? , myemail=? where myid =?";
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1, mm.getMytel());
			pstmt1.setString(2, mm.getMyemail());
			pstmt1.setString(3, mm.getMyid());
			return pstmt1.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1, pstmt1, null);
		}
		
		
		
		return 0;
		
	} //end updateInfo

}//end class

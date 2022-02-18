package myService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import myModel.MyBoard;
import myUtil.MyJdbcConnection;

public class MyBoardDao {
	public int insertMyBoard(MyBoard mb) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		
		String mysql = "insert into myboard " + " values(boardseq.nextval,?,?,?,?,?,?,sysdate,?,0,?,?,?)";
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1, mb.getMywriter());
			pstmt1.setString(2, mb.getMypass());
			pstmt1.setString(3, mb.getMysubject());
			pstmt1.setString(4, mb.getMycontent());
			pstmt1.setString(5, mb.getMyfile1());
			pstmt1.setString(6, mb.getMyboardid());
			pstmt1.setString(7, mb.getMyip());
			pstmt1.setInt(8, mb.getMyref());
			pstmt1.setInt(9, mb.getMynum());
			pstmt1.setInt(10, mb.getMyrefstep());
			
			
			return pstmt1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1, pstmt1, null);
		}
		
		return 0;
	}//end insertMymember1
	
	
	
	
	
}//end class

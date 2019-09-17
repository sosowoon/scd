package bci;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DBConnectionMgr;

public class BciDAO {
	public ArrayList<BciDTO> selectYQ(int year, int quarter) throws Exception {
		DBConnectionMgr mrg = DBConnectionMgr.getInstance();
		Connection con =  mrg.getConnection();
		String sql = "select * from Business_change_indicators where year=? and quater=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(year, 1);
		ps.setInt(quarter, 2);
		ResultSet rs = ps.executeQuery();
		ArrayList<BciDTO> list = new ArrayList<BciDTO>();
		while(rs.next()) {
			BciDTO dto = new BciDTO();
			dto.setBciid(rs.getInt(1));
			dto.setYear(rs.getInt(2));
			dto.setQuarter(rs.getInt(3));
			dto.setSigungucode(rs.getInt(4));
			dto.setSigungucodename(rs.getString(5));
			dto.setCi(rs.getString(6));
			dto.setCiname(rs.getString(7));
			list.add(dto);
		}
		return list;
	}
}

package bl;
import java.sql.*;
import java.util.Vector;
public class Jdbc {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public Jdbc(){
		try{ //connection
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn=DriverManager.getConnection("jdbc:odbc:blog");
			System.out.println("connect");
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	public boolean reg(String un,String pw,String nm,String em,String ph,String ab){
		try {
			ps=conn.prepareStatement("insert into user values (?,?,?,?,?,?)");
			ps.setString(1,un);
			ps.setString(2,pw);
			ps.setString(3,nm);
			ps.setString(4,em);
			ps.setString(5,ph);
			ps.setString(6,ab);
			ps.executeUpdate();
			ps.close();
			conn.commit();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}
	public boolean update(String un,String n,String em,String ph,String ab){
		try {
			ps=conn.prepareStatement("update user set email=?,ph=?,abt=?,name=? where un=?");
			ps.setString(1,em);
			ps.setString(2,ph);
			ps.setString(3,ab);			
			ps.setString(4,n);
			ps.setString(5,un);
			ps.executeUpdate();
			ps.close();
			conn.commit();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}
	public boolean pass(String un,String pw){
		try {
			ps=conn.prepareStatement("update user set pw=? where un=?");
			ps.setString(1,pw);
			ps.setString(2,un);
			ps.executeUpdate();
			ps.close();
			conn.commit();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}
	public boolean login(String un,String pw){
		try {
			ps=conn.prepareStatement("select * from  user where un=? and pw=?");
			ps.setString(2,pw);
			ps.setString(1,un);
			boolean b=false;
			rs=ps.executeQuery();
			while(rs.next()){
				if(rs.getString(1).equals(un) && rs.getString(2).equals(pw))
					b=true;
			}
			return b;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}
	public boolean blog(String un,String top,String msg){
		try {
			ps=conn.prepareStatement("insert into blog(un,topic,msg,dt) values (?,?,?,?)");
			ps.setString(1,un);
			ps.setString(2,top);
			ps.setString(3,msg);
			java.sql.Date d=
			new java.sql.Date
			 (System.currentTimeMillis());
			ps.setDate(4,d);
			ps.executeUpdate();
			ps.close();
			conn.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}		
	}
	public Vector getTopic(){
		try{
			ps=conn.prepareStatement("select distinct topic from blog order by topic");
			rs=ps.executeQuery();
			Vector v=new Vector();
			while(rs.next()){
				v.add(rs.getString(1));
			}
			return v;
			
		} catch (SQLException e) {
			return null;
		}		
	}
	public Vector getTopicSearch(String s){
		try{
			ps=conn.prepareStatement("select distinct topic from blog where topic like '"+s+"%' order by topic");
			rs=ps.executeQuery();
			Vector v=new Vector();
			while(rs.next()){
				v.add(rs.getString(1));
			}
			return v;
			
		} catch (SQLException e) {
			return null;
		}		
	}
	public ResultSet getBlogs(String t){
		try{
			ps=conn.prepareStatement("select * from blog where topic=? order by dt desc");
			ps.setString(1,t);
			rs=ps.executeQuery();			
			return rs;
			
		} catch (SQLException e) {
			return null;
		}		
	}
	public ResultSet getUser(String u){
		try{
			ps=conn.prepareStatement("select * from user where un=?");
			ps.setString(1,u);
			rs=ps.executeQuery();			
			return rs;
			
		} catch (SQLException e) {
			return null;
		}		
	}
}





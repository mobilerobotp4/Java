/*Creating connection between MS Access Database and JDBC. Here I am using Ucanaccess.jar. UCanAccess is a pure Java JDBC Driver 
implementation which allows Java developers and JDBC client programs to read/write Microsoft Access database (.mdb and .accdb) files.
It is a Java driver for MS Access that can be used to access a MS Access DB without using ODBC. JDBC ODBC driver become obsolate from JDK 8*/

import java.sql.*;

public class Connection_sample {
    public static void main(String[] args) {
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn= DriverManager.getConnection("jdbc:ucanaccess://D://test/src/Database2.accdb");
            Statement s = conn.createStatement();
             ResultSet rset= s.executeQuery("select * from Student");//Student is a table within Database Database2
             while (rset.next()) {
                System.out.println(rset.getString(2)+" "+rset.getString(3));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

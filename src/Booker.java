package src;
import java.util.*;
import java.sql.*;
import src.Ticket;
import src.Passenger;
public class Booker {
	static Connection conn;	
	public static void getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/irctc","root","root");
		}catch(Exception e){
			System.out.println("init: "+e);
		}
	}
	synchronized public static boolean book(String mobile,int trainNo,int day,String category,ArrayList<String> names,ArrayList<Integer> ages,ArrayList<Integer> gens) {
		getConn();
		boolean flag=true;
		ResultSet rs;
		Statement stmt;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from train where no='"+trainNo+"' and day="+day+";");
			rs.first();
			int no=names.size();
			String trainName = rs.getString("name");
			String from = rs.getString("f");
			String to = rs.getString("t");
			double fare = rs.getDouble("cost");
			ArrayList<Integer> avl = new ArrayList<Integer>();
			for(int i=1;i<=5;i++){
                if(rs.getString(category+i).equals("0")){
                    avl.add(i);
                }
            }
			double total_fare = no*fare;
			stmt.execute("insert into ticket (category,total_fare,f,t,mobile,train_no,wl,cancelled,day,train_name) "
                    + "values('"+category+"',"+total_fare+",'"+from+
                    "','"+to+"','"+mobile+"',"+trainNo+",0,0,"+day+",'"+trainName+"');");
            System.out.println("TICKET INSERTED");
            rs = stmt.executeQuery("select * from ticket");
            rs.last();
            int ticket_id = rs.getInt("id");
            System.out.println("ticke id is:"+ticket_id);
            int wl=0;
            int bNo;
            System.out.println("avl is:"+avl);
            for(int i=0;i<no;i++){
                if(avl.isEmpty()){
                    wl++;
                    bNo=wl;
                }
                else{
                    
                    bNo = avl.remove(0);
                    System.out.println("assigned-bNo="+bNo+"i="+i);
                    rs = stmt.executeQuery("select avl"+category+" from train where no="+trainNo+" and day="+day+";");
                    rs.first();
                    
                    stmt.execute("update train set "+category+bNo+"=1,avl"+category+"="+(rs.getInt("avl"+category)-1)+" where no="+trainNo+" and day="+day+";");
                }
                stmt.execute("insert into passenger (name,age,bearth_no,ticket_id,gender,category,wl) values('"+names.get(i)+"',"+ages.get(i)+","+bNo+","+ticket_id+","+gens.get(i)+",'"+category+"',"+wl+");");
                
            }
		}catch(Exception e) {
			flag=false;
			e.printStackTrace();
		}
		return flag;
	}
	public static void getHistory() {
		
	}
	public static int getAvl(Connection conn,String category,int trainNo,int day) {
		int no=0;
		ResultSet rs;
		Statement stmt;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from train where no='"+trainNo+"' and day="+day+";");
			for(int i=1;i<=5;i++){
                if(rs.getString(category+i).equals("0")){
                    no++;
                }
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return no;
	}
	public static boolean login(String formMobile,String formPassword) {
		getConn();
		ResultSet rs;
		Statement stmt;
		boolean flag=false;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user where mobile='"+formMobile+"';");
            if(rs.next()){
                if(rs.getString("password").equals(formPassword)){
                    flag=true;
                }
            }
		}catch(Exception e){
			System.out.println("login: "+e);
		}
		return flag;
	}
	synchronized public static boolean register(String name, String mobile, String password, int age) {
		getConn();
		Statement stmt;
		boolean flag=true;;
		try{
            if(name==null||mobile==null||password==null||new Integer(age)==null){
                throw new Exception("null values");
            }
            stmt = conn.createStatement();
            stmt.execute("insert into user " + "values('"+name+"','"+mobile+"',"+age+",'"+password+"');");
        }
        catch(Exception e){
        	flag = false;
            System.out.println("Registration error.......");
        }
		return flag;
	}
	synchronized public static HashMap<Integer,String> getTrains(String from,String to,int day){
		getConn();
		Statement stmt;
		ResultSet rs;
		HashMap<Integer,String> trains = new HashMap<Integer,String>();
		try {
			if(from==null||to==null||new Integer(day)==null){
                throw new Exception("null values");
            }
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from train where f='"+from+"' and t='"+to+"' and day="+day+";");
            while(rs.next()){
                trains.put(rs.getInt("no"), rs.getString("name"));
            }
		}catch(Exception e){
			System.out.println("trains: "+e);
		}
		return trains;
	}
	public static ArrayList<String> getFrom() {
		ArrayList<String> fromal=new ArrayList<String>();
		getConn();
		Statement stmt;
		ResultSet rs;
		try{
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery("select f,t from train");
	        while(rs.next()){
	            if(!fromal.contains(rs.getString("f")))
	                fromal.add(rs.getString("f"));
	        }
	    }
	    catch(Exception e){
	        System.out.println("stmt error");
	    }
		
		return fromal;
	}
	
	public static ArrayList<String> getTo() {
		ArrayList<String> toal=new ArrayList<String>();
		getConn();
		Statement stmt;
		ResultSet rs;
		try{
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery("select f,t from train");
	        while(rs.next()){
	            if(!toal.contains(rs.getString("t")))
	                toal.add(rs.getString("t"));
	        }
	    }
	    catch(Exception e){
	        System.out.println("stmt error");
	    }
		
		return toal;
	}
	public static ArrayList<Ticket> getTickets(String mobile){
		getConn();
		Statement stmt;
		ResultSet rs;
		ArrayList<Ticket> tickets = new ArrayList<>();
		Ticket t;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from ticket where mobile='"+mobile+"';");
			while(rs.next()){
				t = new Ticket(rs.getInt("id"),
				rs.getInt("train_no"),
				rs.getInt("day"),
				rs.getString("f"),
				rs.getString("t"),
				rs.getString("train_name"),
				rs.getDouble("total_fare"));
				tickets.add(t);
			}
		}catch(Exception e){
	        System.out.println("getTickets error: "+e);
	    }

		return tickets;
	}
	public static ArrayList<Passenger>  getPass(int ticketId){
		getConn();
		Passenger p;
		ArrayList<Passenger> ps = new ArrayList<Passenger>();
		ResultSet rs;
		Statement stmt;
		try{
			stmt= conn.createStatement();
			rs = stmt.executeQuery("select * from passenger where ticket_id="+ticketId+";");
			rs.beforeFirst();
			while(!rs.isLast()){
				rs.next();
				p = new Passenger(rs.getInt("id"),rs.getInt("age"),rs.getInt("gender"),
				rs.getInt("bearth_no"),rs.getInt("ticket_id"),rs.getInt("wl"),
				rs.getString("name"),rs.getString("category"));
				ps.add(p);
			}
		}
		catch(Exception e){
			System.out.println("pass error");
		}
		return ps;
	}
	synchronized public static boolean cancel(int pid,int tickid){
		boolean flag1=true;
		getConn();
		Statement stmt;
		int train_no,day,bNo,wlNo;
		String category;
		ResultSet rs;
		try{
			stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from ticket where id="+tickid+";");
            rs.first();
            train_no = rs.getInt("train_no");
            category = rs.getString("category").trim();
            day = rs.getInt("day");
            rs = stmt.executeQuery("select bearth_no,wl from passenger where id="+pid+";");
            
            rs.first();
            bNo  = rs.getInt("bearth_no");
            wlNo = rs.getInt("wl");
            int a=-1;
            System.out.println("before deleting record");
            if(wlNo==0){
                rs = stmt.executeQuery("select * from train where no="+train_no+" and day="+day+";");
                rs.first();
                a = rs.getInt("avl"+category); 
                a++;
                stmt.execute("update train set "+category+bNo+" = 0,avl"+category+"="+a+" where no="+train_no+" and day="+day+";");
                System.out.println("changing the status of:"+category+bNo);
            }
            System.out.println("train_no is:"+train_no);
            Statement stmt3 = conn.createStatement();
            rs = stmt3.executeQuery("select id from ticket where train_no="+train_no+";");
            rs.beforeFirst();
            ResultSet rs2;
            boolean flag=true;
            Statement stmt2 = conn.createStatement();
            while(rs.next()){
                System.out.println("entered1");
                int id= rs.getInt("id");
                System.out.println("got id"+id);
                rs2 = stmt2.executeQuery("select id,wl from passenger where ticket_id="+id+";");
                rs2.beforeFirst();
                while(rs2.next()){
                    int wl = rs2.getInt("wl");
                    System.out.println("wl"+wl);
                    int id2=rs2.getInt("id");
                    if(wl!=0){
                        System.out.println("wl"+wl+" is updated");
                        if(wl==1&&flag&&wlNo!=0){
                            flag=false;
                            System.out.println("entered2");
                            stmt.execute("update train set avl"+category+"="+(a-1)+","+category+bNo+"=1 where no="+train_no+" and day="+day+";");
                            System.out.println("entered3 FOR "+bNo);
                            stmt.execute("update passenger set wl=0,bearth_no="+bNo+" where id="+id2+";");
                        }
                        else{
                            stmt.execute("update passenger set wl="+(wl-1)+" where id="+id2+";");
                        }
                    }
                }
            }
            System.out.println("going to delete passenger"+pid);
            stmt.execute("delete from passenger where id="+pid+";");           
            
        }catch(Exception e){
			flag1=false;
			System.out.println("cancel error:"+e);
			e.printStackTrace();
		}
		return flag1;
	}
}

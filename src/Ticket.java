package src;
public class Ticket {
	int id,trainNo,day;
	String from,to,trainName;
	double totalFare;
	public Ticket(int id,int trainNo,int day,String from,String to,String trainName,double totalFare){
		this.id=id;
		this.trainNo = trainNo;
		this.day = day;
		this.from = from;
		this.to = to;
		this.trainName = trainName;
		this.totalFare = totalFare;
	}
	public int getId(){
		return id;
	}
	public int getTrainNo(){
		return trainNo;
	}
	public String getDay(){
		String res="";
		switch(day){
			case 1:
			res="Monday";
			break;
			case 2:
			res="Tuesday";
				break;
			case 3:
			res="Wednesday";
				break;
			case 4:
			res="Thursday";
				break;
			case 5:
			res="Friday";
				break;
			case 6:
				res="Saturday";
				break;
			case 7:
			res="Sunday";	
				break;
		}
		return res;
	}
	public String getFrom(){
		return from;
	}
	public String getTo(){
		return to;
	}
	public String getTrainName(){
		return trainName;
	}
	public double getTotalFare(){
		return totalFare;
	}
}

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class People implements Serializable {
	 String name;
	Integer lableNumber;
	List<Email> emailMataName=new ArrayList<Email>();
	Integer numberOfEmail=0;

	public People(String name){
		this.name=name;
	}

	/**
	 * 填加邮件
	 *
	 * @param email 邮件名称
	 */
	public void addEmail ( String email,String path)throws IOException {
		Email peopleEmail;
		peopleEmail=new Email(email,name,lableNumber);
		peopleEmail.createMata(path);
		//peopleEmail.showEmailValue();
		emailMataName.add(peopleEmail);
	}

	public void setLableNumber(int lable){
		this.lableNumber=lable;
	}
}

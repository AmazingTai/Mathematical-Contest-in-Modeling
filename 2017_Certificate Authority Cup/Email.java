import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Email implements Serializable {
	private final int FIRST = 7;
	private final int SECOND = 20;
	private final int THIRD = 33;
	//private final int FOUTH = 10;

	String emailName =null;
	List mata=new ArrayList();
	String fileName;//txt文件的名字
	String peopleName;
	Integer peopleLable;
	Integer[] emailValue=new Integer[53];

	public Email(String email,String name,Integer lable){
		for(int i=0;i<53;i++){
			emailValue[i]=0;
		}
		peopleName=name;
		peopleLable=lable;
		fileName=email;
		this.emailName =email.substring(0,email.length()-4);
	}

	/**
	 * 生成文件矩阵
	 *
	 * @param path 文件路径
	 */
	public void createMata(String path)throws IOException{
		File f=new File(path+ emailName +".cats");
		BufferedReader br=new BufferedReader(new FileReader(f));
		String[] stringLine=new String[3];

		String line=br.readLine();
		while (line!=null){
			mata.add(line);
			stringLine=line.split(",");
			//System.out.println(stringLine[0]+"  "+stringLine[1]+"  "+stringLine[2]);
			setEmailValue(stringLine);
			line=br.readLine();
		}

		br.close();
	}

	/**
	 * 设置邮件特征值生成稀疏矩阵
	 *
	 * @param line
	 */
	public void setEmailValue(String[] line){
		Integer[] integerLine=new Integer[3];
		integerLine[0]=Integer.valueOf(line[0]).intValue();
		integerLine[1]=Integer.valueOf(line[1]).intValue();
		integerLine[2]=Integer.valueOf(line[2]).intValue();
		switch (integerLine[0]){
			case 1: emailValue[integerLine[1]]=integerLine[2];
				break;
			case 2: emailValue[integerLine[1]+7]=integerLine[2];
				break;
			case 3:emailValue[integerLine[1]+20]=integerLine[2];
				break;
			case 4:emailValue[integerLine[1]+33]=integerLine[2];
				break;
		}
	}

	/**
	 * 展示稀释矩阵
	 *
	 */
	public void showEmailValue(){
		for(int i=0;i<53;i++){
			//if(i==27)
			//	System.out.println();
			System.out.print(i+":"+emailValue[i]+" ");
		}
		System.out.println();
	}


}

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Analyze {
	public static void main(String[] args)throws FileNotFoundException, IOException {
		List<People> listOfPeople=new ArrayList<People>();
		String[][] textsLists=new String[8][];
		String[] textList;
		Integer[] numberOfPeople=new Integer[8];

		for(int i=0;i<8;i++){
			//把8个文件中邮箱地址导入
			int k=i+1;
			textsLists[i]=fileList("data/"+k+"/txt");
		}

		for(int m=1;m<=8;m++){
			//向listOfPeople中添加不重复邮箱地址
			textList=textsLists[m-1];//从1到8 数组下标从0到7
			for (int i = 0; i < textList.length; i++) {
				Boolean ifAdd = true;//判断是否已经存在
				String peoplename = null;
				peoplename = openFile("data/"+m+"/txt/"+textList[i]);

				for (int j = 0; j < listOfPeople.size(); j++) {
					//判断是否重复
					People p = listOfPeople.get(j);

					if (peoplename.equals(p.name)) {
						//如果重复
						ifAdd = false;
						listOfPeople.get(j).numberOfEmail++;
						listOfPeople.get(j).addEmail(textList[i],"data/"+m+"/cats/");//把这封邮件添加到人

						break;
					}
				}

				if (ifAdd) {
					//如果不重复，加入列表
					People person = new People(peoplename);
					person.addEmail(textList[i],"data/"+m+"/cats/");
					person.setLableNumber(listOfPeople.size());
					person.numberOfEmail++;
					listOfPeople.add(person);

				}
			}

			if(m==1)
				numberOfPeople[m-1]=listOfPeople.size();
			else {
				numberOfPeople[m-1]=listOfPeople.size()-numberOfPeople[m-2];
			}
		}

		showEmailMata(listOfPeople);
		showList(listOfPeople);
		showData(listOfPeople);
		savePeopleList(listOfPeople);

	}

	/**
	 * 展示每份邮件特征矩阵
	 *
	 * @param peopleList 邮件发送人列表
	 */
	public static void showEmailMata(List<People> peopleList){
		for(int i=0;i<peopleList.size();i++){
			System.out.println(peopleList.get(i).name);
			for(int j=0;j<peopleList.get(i).emailMataName.size();j++){
				System.out.println(peopleList.get(i).emailMataName.get(j).fileName);
				Email e = peopleList.get(i).emailMataName.get(j);

				List mata=null;
				mata=e.mata;

				for(int k=0;k<mata.size();k++){
					System.out.println(mata.get(k));
				}

			}
		}
		System.out.println("--------------------------------------------------------------------------------------------------------------");
		System.out.println("--------------------------------------------------------------------------------------------------------------");
	}

	/**
	 * 展示所有发件人属性
	 *
	 * @param peopleList 邮件发送人列表
	 */
	public static void showList(List<People> peopleList){
		int number=0;
		System.out.println("编号  "+"邮件数    "+"邮箱");
		for(int n=0;n<peopleList.size();n++){
			number=peopleList.get(n).numberOfEmail+number;
			System.out.println(peopleList.get(n).lableNumber+"     "+peopleList.get(n).numberOfEmail+"     "+peopleList.get(n).name);
		}
		System.out.println(number);
		System.out.println("--------------------------------------------------------------------------------------------------------------");
		System.out.println("--------------------------------------------------------------------------------------------------------------");
	}

	/**
	 * 展示所有发件人稀疏矩阵
	 *
	 * @param peopleList 邮件发送人列表
	 */
	public static void showData (List<People> peopleList){
		System.out.println("总邮箱地址数："+peopleList.size());
		for(int i=0;i<peopleList.size();i++){
			People person=peopleList.get(i);
			System.out.println("邮箱:"+person.name+"\n编号:"+person.lableNumber+"\n共发送邮件数："+person.numberOfEmail);
			List<Email> personEmail=person.emailMataName;
			for(int j=0;j<personEmail.size();j++){
				Email email= personEmail.get(j);
				System.out.print(person.lableNumber+" ");
				email.showEmailValue();
			}
			System.out.println();
			System.out.println("----------------------------------------------------------------------------------------------------------------------");
		}
	}

	/**
	 * 序列化保存邮件发送人列表
	 *
	 * @param peopleList 邮件发送人列表
	 */
	public static  void savePeopleList(List<People> peopleList){
		try {
			File f=new File("发件人序列化列表.dat");
			if(f.exists()){
				f.delete();
			}
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("发件人序列化列表.dat", true));
			oos.writeObject( peopleList);
			oos.flush();
			oos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 生成当前目录文件列表
	 *
	 * @param p 文件路径
	 */
	public static String[] fileList (String p)throws FileNotFoundException, IOException {
		String [] filelist=null;
		File allfile;

		allfile=new File(p);
		if(allfile.exists())
			filelist=allfile.list();

		return filelist;
	}

	/**
	 * 打开文件
	 *
	 * @param filename 打开文件名称
	 */
	public static String openFile(String filename)throws IOException{
		String name;

		File file =new File(filename);
		BufferedReader br=new BufferedReader(new FileReader(file));
		br.readLine();
		br.readLine();
		name=br.readLine();
		name=name.substring(6);

		br.close();

		return name;
	}

}

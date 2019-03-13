import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class Show {
	public static void main(String[] args) {
		List<People> listOfPeople=new ArrayList<People>();

		listOfPeople=getList();
		//可以进行其他数据展示
	}

	public static <T> List<T> getList() {
		File file = new File("发件人序列化列表.dat");
		FileInputStream in;
		List<T> object = null;
		try {
			in = new FileInputStream(file);
			ObjectInputStream objIn = new ObjectInputStream(in);
			object = (List<T>) objIn.readObject();

			objIn.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return object;
	}

}

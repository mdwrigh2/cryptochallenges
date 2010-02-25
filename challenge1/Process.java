import java.util.*;
import java.io.*;

public class Process{
	public boolean encrypt(String file) throws IOException{
		File f = new File(file);
		if( f.canRead() ){
			int shift = (int)(Math.random()*127);
			
			FileReader reader = new FileReader(file);
			FileWriter writer = new FileWriter("../Encrypted/FirstEncrypted.txt");
			
			try{				
				int temp;
				
				while(( temp = reader.read()) != -1){
					int temp2 = (temp + shift)%127;
					writer.write(Integer.toHexString(temp2)+" ");
				}
			}
			finally{
				if (reader != null){
					reader.close();
				}
				if (writer != null){
					writer.close();
				}
			}
			return true;
		}else{
			return false;
		}
	}
	
	public boolean decrypt(String file) throws IOException{
		File f = new File(file);
		if( f.canRead()){
			int shift = 0;
			
			Scanner reader = new Scanner(f);
			FileWriter writer = new FileWriter("../Decrypted/FirstDecrypted.txt");
			
			try{
				int temp = Integer.parseInt(reader.next(), 16);
				
				shift = (temp - ((int)'i'))%127;
				writer.write('i');
				
				while(reader.hasNext()){
					int temp3 = Integer.parseInt(reader.next(), 16);
					char temp2 = (char)((temp3-shift)%127);
					writer.write(temp2);
				}
			}
			finally{
				if( writer != null ){
					writer.close();
				}
			}
			return true;
		}
		else{
			return false;
		}
	}
	public void win(){
		String text = "53 6f 20 79 6f 75 27 76 65 20 66 69 67 75 72 65 64 20 69 74 20 6f 75 74 2e 20 59 61 79 21 20 54 68 65 72 65 20 77 69 6c 6c 20 62 65 20 6d 6f 72 65 20 6f 66 20 74 68 65 73 65 2c 20 74 6f 20 67 65 74 20 74 6f 20 74 68 65 20 6e 65 78 74 20 6f 6e 65 20 66 61 63 65 62 6f 6f 6b 20 6d 65 20 77 69 74 68 20 61 6e 20 65 6e 74 65 72 74 61 69 6e 69 6e 67 20 6c 6f 6c 64 6f 67 73 20 28 79 65 73 20 6c 6f 6c 64 6f 67 73 20 6e 6f 74 20 6c 6f 6c 20 63 61 74 73 2c 20 49 20 68 61 76 65 20 61 20 70 72 6f 62 6c 65 6d 20 77 69 74 68 20 63 61 74 20 70 65 6f 70 6c 65 29 20 61 6e 64 20 6d 65 73 73 61 67 65 20 6d 65 20 79 6f 75 72 20 65 6d 61 69 6c 20 61 64 64 72 65 73 73 20 61 6e 64 20 49 27 6c 6c 20 67 65 74 20 79 6f 75 20 74 68 65 20 6e 65 78 74 20 6f 6e 65 20 77 68 65 6e 20 49 20 66 69 6e 69 73 68 20 69 74 2e 20 20 47 6f 6f 64 20 4c 75 63 6b 2c 20 74 68 65 72 65 20 61 72 65 20 62 72 6f 77 6e 69 65 73 20 61 74 20 74 68 65 20 65 6e 64 20 66 6f 72 20 74 68 65 20 77 69 6e 6e 65 72 2e a ";
		System.out.println(text);
	}	
}
				
			

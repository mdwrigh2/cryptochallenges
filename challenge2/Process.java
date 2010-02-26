import java.io.*;
import java.util.*;

public class Process{
	public boolean encrypt(String file, String  codeWord) throws IOException{
		File f = new File(file);
		if( f.canRead() ){
			char[] shift = codeWord.toCharArray();
			int size = codeWord.length();
			
			FileReader reader = new FileReader(file);
			FileWriter writer = new FileWriter("Encrypted"+file);
			
			try{				
				int temp;
				int count = 0;
				
				while(( temp = reader.read()) != -1){
					int temp2 = (temp + (int)shift[count%size])%127;
					writer.write(Integer.toHexString(temp2)+" ");
					count++;
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
			int[] shift = new int[1];
			char[] codeWord = new char[1];
			shift[0] = 0;
			
			int[] compare = {(int)'i', 
			(int)'m',
			(int)'p',
			(int)'o',
			(int)'r',
			(int)'t',
			(int)' ',
			(int)'j',
			(int)'a',
			(int)'v',
			(int)'a',
			(int)'.'};
			
			Scanner reader = new Scanner(f);
			FileWriter writer = new FileWriter("Decrypted"+file);
			
			try{	int count = 0;
						
				while(reader.hasNext()){
					int temp = Integer.parseInt(reader.next(), 16);
					int temp1 = (temp-compare[count]+127)%127;
					if(temp1 != shift[0]){
						shift = Arrays.copyOf(shift, count+1);
						codeWord = Arrays.copyOf(codeWord, count + 1);
						shift[count] = temp1;
						codeWord[count] = (char)temp1;
					}
					else{
						break;
					}
					count++;
				}
				reader = new Scanner(f);
				count = 0;
				
				String word = new String(codeWord);
				
				while(reader.hasNext()){
					String temp4 = reader.next();
					int temp3 = Integer.parseInt(temp4, 16);
					char temp2 = (char)((temp3-shift[count%shift.length]+127)%127);
					writer.write(temp2);
					count++;
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
		String text = "40 5f 17 5f 5c 65 1e 5c 52 10 5d 4f 54 65 69 4b 51 10 60 5a d 5f 6c 5a 1b 10 50 47 66 11 17 3a 55 55 17 54 52 68 6b 6 5c 5e 5c 6 50 51 65 6 4f 55 17 4c 5c 65 65 4a d 51 6b 6 64 67 6e 14 50 51 69 59 5c 5e 5f 55 59 57 58 5a 52 1e 5a 55 5a 1f 58 4c 56 5e 5c 14 d 10 1 3f 5c 65 69 6 55 59 65 5a 60 10 5d 55 5f 10 6b 4e 52 10 65 4b 65 64 17 58 5c 65 65 4a 27 10 6b 4e 56 63 17 55 5b 55 17 4f 60 10 58 54 d 51 5d 4f 5b 55 17 49 56 60 5f 4b 5f 10 58 54 51 10 60 5a d 67 60 52 59 10 59 4b d 55 65 49 5c 54 5c 4a d 31 4a 29 36 39 25 6 38 55 5c 56 d 53 5f 4b 50 5b 60 54 54 10 59 47 50 5b 17 47 61 10 6b 4e 52 10 67 47 54 55 17 4c 5c 62 17 5a 55 55 17 59 52 53 66 54 51 10 5a 4e 4e 5c 63 4b 5b 57 5c 12 d 59 5d 6 36 10 5b 4b 50 59 5b 4b d 64 5f 47 61 10 60 5a 14 63 17 5a 5c 5f 17 4b 63 59 63 6 36 10 6e 4f 59 5c 17 58 52 5c 5c 47 60 55 17 53 5c 62 5c 6 56 5e 5d 55 5f 5d 58 5a 56 5f 65 14 76 39 5d 6 66 5f 6c 6 64 51 65 5a d 64 66 6 4f 55 17 47 51 54 5c 4a d 64 66 6 61 58 5c 6 59 55 58 4a 52 62 17 48 5c 51 69 4a d 55 64 47 56 5c 17 53 52 10 58 5a 27 10 3d 58 52 55 4b 4e 56 5e 62 4b 5f 63 47 5b 59 60 60 5a 2d 57 64 47 56 5c 25 49 5c 5d 17 5d 56 64 5f 6 61 58 5c 6 50 5f 5b 4b d 67 66 58 51 10 40 6 62 63 5c 4a d 56 66 58 d 55 65 49 5c 54 60 54 54 10 5a 4e 4e 5c 63 4b 5b 57 5c 6 61 67 66 6 15 55 58 59 66 10 66 58 d 58 58 58 51 19 17 47 60 10 6b 4e 52 10 6a 5b 4f 5a 5c 49 61 10 63 4f 5b 55 17 47 5b 54 17 5a 52 5c 63 6 5a 55 17 59 5c 5d 5c 5d 55 55 69 4b d 59 65 6 61 58 5c 6 4f 5f 5b 5f d 67 5f 47 61 10 70 55 62 10 6e 47 5b 64 17 5a 5c 10 59 4b d 53 58 52 59 55 5b 14 76 ";
		System.out.println(text);
	}	
}
				
			

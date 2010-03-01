public class Decrypted {
  public static void main (String [] args)
  {
    Process proc = new Process();
    try{
      int i = (int)'i';
      System.out.println(i);
      proc.decrypt("win.txt");
    }
    catch(Exception e) {
      System.out.println(e);
    }
  }
}

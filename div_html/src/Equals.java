
public class Equals {

	public static void main(String[] args) {
		String s = "안녕";
		String s1 = new String("안녕");
		
		//s == s1 같니?  주소번지가 같니?
		//s.equals(s1) s의주소번지의 값과 s1의 값이 같니?
		if(s == s1) {
			System.out.println("같다.");
		}else {
			System.out.println("다르다.");
		}
		if(s.equals(s1)) {
			System.out.println("같다.");
		}else {
			System.out.println("다르다.");
		}
	}

}

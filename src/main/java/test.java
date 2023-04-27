
public class test {
	public static void main(String[] args) {

		int a = 14;
		int count = 0 ;
		if(a%3 == 0) {
			count = a/3;
		}else {
			count = (a/3)+1;
		}

		for(int i = 0 ; i < count ; i++) {
			if(i!=count-1) {
				for ( int j = 0 ; j < 3 ; j++) {
					System.out.print("* ");
				}
			}else {
				for(int j = 0 ; j < a%3 ; j++) {
					System.out.print("* ");
				}
			}
			System.out.println("");
		}
	}
}

package test;

import java.util.Random;

public class test {
	public static void main(String[] args) {
		int[][] array =new int[3][4];
		Random rand = new Random();
		int sum = 0;
		
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 4;  j++) {
				array[i][j]= rand.nextInt(10);
				sum += array[i][j];
			}
		}
		
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j <4; j++) {
				System.out.printf("%2d",array[i][j]);
				
			}
			System.out.println();
		}
		System.out.println("합은 " + sum);
	}
}

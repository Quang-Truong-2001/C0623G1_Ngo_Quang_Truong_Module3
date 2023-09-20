package demo;

import java.util.*;

public class giaithuat {
    public static void main(String[] args) {
        int[][] arr = {
                {2, 3, 9, 8},
                {7, 33, 2, 2},
                {1, 2, 6, 51}
        };
        int count;
        Set<Integer> set = new LinkedHashSet<>();
        Queue<Integer> integers=new LinkedList<>();
        List<Integer> list=new ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
//                System.out.println(arr[i][j]);
                count = 0;
                for (int k = 2; k < arr[i][j]; k++) {
                    if (arr[i][j] % k == 0) {
                        count++;
                    }
                }
                if (count == 0) {
                    list.add(arr[i][j]);
                }
            }
        }
        int[] a = new int[list.size()];

        for(int i=0;i< list.size();i++){
            integers.add(list.get(i));
        }
        for()

    }
}

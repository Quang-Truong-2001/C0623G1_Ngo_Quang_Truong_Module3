package demo;

import java.util.*;

public class giaithuat {
    public static void main(String[] args) {
        int[][] arr = {
                {1,2,8,43},
                {9,4,53,7},
                {11,6,4,0},
                {1,2,6,51}
        };
        int[] a=test(arr);
        for(int i=0;i< a.length;i++){
            System.out.println(a[i]);
        }

    }
    public static int[] test(int[][] arr){
        int c;
        Set<Integer> s=new LinkedHashSet<>();
        Queue<Integer> q=new PriorityQueue<>();
        for (int i=0;i< arr.length;i++){
            for(int j=0;j<arr[i].length;j++){
                c=0;
                for(int k=2;k<arr[i][j];k++){

                    if(arr[i][j]%k==0){
                        c++;
                    }
                }
                if(c==0 && arr[i][j]>1){
                    s.add(arr[i][j]);
                }
            }
        }
        for(Integer b:s){
            q.add(b);
        }
        int[] a=new int[s.size()];
        for(int i=0;i<a.length;i++){
            a[i]=q.poll();
        }
        return a;
    }
}

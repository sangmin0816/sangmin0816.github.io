package example;
import java.util.Arrays;
import java.util.Set;
import java.util.HashSet;
public class Ex20_Lotto {
    public static void main(String[] args) {
        Integer[] lotto = new Integer[6];
        for(int i=0;i<6;i++){
            lotto[i] = (int) (Math.random()*44+1);
        }
        Set<Integer> gen = new HashSet<>(Arrays.asList(lotto));
        while(gen.size()<6){
            gen.add((int) (Math.random()*44+1));
        }
        lotto = gen.toArray(new Integer[6]);
        Arrays.sort(lotto);
        System.out.println(Arrays.toString(lotto));
    }
}

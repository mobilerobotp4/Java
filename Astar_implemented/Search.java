package Astar_implemented;

import java.util.*;

import static java.lang.Math.abs;

public class Search {
    public static int[] search1(int[]init, int [] goal, int[][] grid, int[][] delta, int cost, List<Integer> PathX1, List<Integer> PathY1, List<Integer>path){

        int[][] closed = new int[grid.length][grid[0].length];
        int x2,y2;
        closed[init[0]] [init[1]]=1;
        //Expand is a table, the same size as the maze, that maintains information about at which step the
        //node was expanded.
        int[][] Expand= new int[grid.length][grid[0].length];
        for(int g1=0;g1<Expand.length;g1++){
            for(int g2=0;g2<Expand[0].length;g2++){
                Expand[g1][g2]=-1;
            }
        }
        int h[][]=new int[grid.length][grid[0].length];
        for(int i=0;i<grid.length;i++){
            for (int j=0;j<grid[0].length;j++){
                h[i][j]=(abs(i-goal[0]))+(abs(j-goal[1]));
            }
        }
        int[][] action= new int[grid.length][grid[0].length];
        for(int a1=0;a1<action.length;a1++){
            for(int a2=0;a2<action[0].length;a2++){
                Expand[a1][a2]=-1;
            }
        }
        int x=init[0];
        int  y = init[1];
        int g=0;
        int h1=h[x][y];
        int f=g+h1;
        ArrayList<ArrayList<Integer>> list1 = new ArrayList<>();
        ArrayList<Integer> open=new ArrayList<>();
        open.add(f);
        open.add(g);
        open.add(h1);
        open.add(x);
        open.add(y);
        ArrayList<Integer> open1=(ArrayList<Integer>) open.clone();
        open.clear();
        list1.add(open1);
        boolean found=false;
        boolean resign=false;
        int count=0;
        while (!found && !resign) {
            if (list1.size() == 0) {
                resign = true;
                System.out.println("Fail");
            } else {
                Collections.sort(list1, new Astar_implemented.MyComparator2());
                ArrayList<Integer>removed= list1.remove(list1.size() - 1);
                Integer[] integers = removed.toArray(new Integer[removed.size()]);
                f=integers[0];
                g=integers[1];
                h1=integers[2];
                x=integers[3];
                y=integers[4];
                Expand[x][y]=count;
                count+=1;
            }
            if (x == goal[0] && y == goal[1]) {
                found = true;
                System.out.println(x);
                System.out.println(y);
                System.out.println(g);
                System.out.println("Search Successful");
            } else {
                for (int i = 0; i < delta.length; i++) {
                    x2 = x + delta[i][0];
                    y2 = y + delta[i][1];
                    if (x2 >= 0 && x2 < grid.length && y2 >= 0 && y2 < grid[0].length) {
                        if (closed[x2][y2] == 0 && grid[x2][y2] == 0) {
                            int g2 = g + cost;
                            int h2=h[x2][y2];
                            int f2=g2+h2;
                            open.add(f2);
                            open.add(g2);
                            open.add(h2);
                            open.add(x2);
                            open.add(y2);
                            open1 = (ArrayList<Integer>)open.clone();
                            open.clear();
                            list1.add(open1);
                            closed[x2][y2] = 1;
                            action[x2][y2]=i;
                        }
                    }

                }
            }


        }
        char[][] policy= new char[grid.length][grid[0].length];
        for(int p1=0;p1<policy.length;p1++){
            for(int p2=0;p2<policy[0].length;p2++){
                policy[p1][p2]=' ';
            }
        }
        x=goal[0];
        y=goal[1];
        while(x!=init[0] && y!=init[1]){
            x2 = x - delta[action[x][y]][0];
            y2 = y - delta[action[x][y]][1];
            x = x2;
            PathX1.add(x);
            path.add(x);
            y = y2;
            PathY1.add(y);
            path.add(y);
            for(int p=0;p<policy.length;p++){

            }
        }
        PathX1.add(init[0]);
        path.add(init[0]);
        path.add(init[1]);
        Collections.reverse(PathX1);
        Collections.reverse(path);
        path.add(goal[0]);
        path.add(goal[1]);
        PathX1.add(goal[0]);
        PathY1.add(init[1]);
        Collections.reverse(PathY1);
        PathY1.add(goal[1]);
        for(int k=0;k<Expand.length;k++){
            //System.out.println(Arrays.toString(Expand[k]));
        }

        return goal;
    }
}
class MyComparator2 implements Comparator<List<Integer>>
{
    public int compare(List<Integer> list2, List<Integer> list1) {
        return list1.get(0).compareTo( list2.get(0));
    }
}

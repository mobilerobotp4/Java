package Astar_implemented;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

public class Visualization_of_Astar extends JFrame {
    private int maze[][] = { {0,0,1,0,0,1,1,0,1,1,1,1,1},
            {1,0,1,0,1,0,1,0,0,0,0,0,1},
            {1,0,1,0,0,0,1,0,1,1,1,0,1},
            {1,0,0,0,1,1,1,0,0,0,0,0,1},
            {1,0,1,0,0,0,0,0,1,1,1,0,1},//define start position at(0,0)
            {1,0,1,0,1,1,1,0,1,0,0,0,1},//Target node define by 9 at(10,12)
            {1,0,1,0,1,0,0,0,1,1,1,0,1},
            {1,0,1,0,1,1,1,0,1,0,0,0,1},
            {1,0,0,0,0,0,0,0,0,0,1,0,0},
            {1,1,1,1,1,1,1,1,1,1,1,1,0}};
    ArrayList<Integer> PathX1 = new ArrayList<>();

    ArrayList<Integer> PathY1 = new ArrayList<>();
    ArrayList<Integer> path = new ArrayList<>();

    int[] init = new int[]{0, 0};
    //Goal position of the Robot
    int[] goal = new int[]{maze.length - 1, maze[0].length - 1};
    //The cost function which is initially defined as 1
    int cost = 1;
    //Movement of a robot(-1,0)->up,(0,-1)->left,(1,0)->down,(0,1)->right
    int[][] delta = new int[][]{{-1, 0}, {0, -1}, {1, 0}, {0, 1}};
    int pathX, pathY, pathIndex;
    public Visualization_of_Astar() {
        setTitle("Maze Creation");
        setSize(500, 400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        Search.search1(init, goal, maze, delta, cost, PathX1, PathY1, path);
        pathIndex = path.size() - 2;
        //System.out.println(path);

    }
    public void paint(Graphics g) {
        super.paint(g);
        g.translate(50, 50);
        for (int row = 0; row < maze.length; row++) {
            for (int col = 0; col < maze[0].length; col++) {
                Color color;
                switch (maze[row][col]) {
                    case 1:
                        color = Color.BLACK;
                        break;
                    default:
                        color = Color.white;
                }
                g.setColor(color);
                g.fillRect(30 * col, 30 * row, 30, 30);
                g.setColor(color);
                g.drawRect(30 * col, 30 * row, 30, 30);
            }
        }
        //Let's draw a path
        for (int p = 0; p < PathX1.size(); p++) {

            pathX = PathX1.get(p);
            pathY = PathY1.get(p);
            g.setColor(Color.green);
            g.fillRect(pathY * 30, pathX * 30, 30, 30);
        }

    }
    public static void main(String [] args){
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                Visualization_of_Astar view=new Visualization_of_Astar();
                view.setVisible(true);
            }
        });

    }
}

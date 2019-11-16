/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Hoc vien
 */
public class JavaApplication1 {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        Scanner input = new Scanner(System.in);

        int soDong=0, soCot=0;
        String table = "";
        System.out.print("Nhập tên bảng: ");
        table = input.nextLine();
        System.out.print("Nhập số dòng, số cột: ");
        soDong = input.nextInt();
        soCot = input.nextInt();
        input.nextLine();
        String truong[] = new String[soCot];
        String giaTri[] = new String[soCot];
        String str[] = new String[soDong];
        for(int i=0; i<soDong; i++)
        {
            str[i] = "INSERT INTO " + table + " VALUES(";
        }
        
        for(int i=0; i<soCot; i++)
        {
            System.out.print("Nhap tên trường "+ (i+1) + ": ");
            truong[i] = input.nextLine();
        }
        for(int i=0; i<soDong; i++)
        {
            for(int j=0; j<soCot; j++)
            {
                System.out.print("Nhap "+ truong[j] + ": ");
                giaTri[j] = input.nextLine();
            }
            for(int j=0; j<soCot; j++)
            {
                if(j==soCot -1 )
                    str[i] += "'" + giaTri[j] + "'";
                else
                    str[i] += "'" + giaTri[j] + "',";
            }
            str[i]+=")";
        }
        for(int i=0; i<soDong; i++)
        {
            System.out.println(str[i]);
        }

  }
    
}

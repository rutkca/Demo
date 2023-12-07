package com.bijing.demo;
import org.springframework.core.SpringVersion;
public class test {
    public static void main(String[] args){
        String version = SpringVersion.getVersion();
        System.out.println(version);
    }
}

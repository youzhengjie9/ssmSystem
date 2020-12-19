package com.jedis;

import org.junit.Test;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
@Component
public class myJedis {
    private static Jedis jedis;

    static {
        jedis=new Jedis("127.0.0.1",6379);
    }

    public  Jedis getJedis(){
        return jedis;
    }

}

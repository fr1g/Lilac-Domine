package com.lilac.util;

import org.apache.commons.codec.digest.DigestUtils;

public class Md5Util {
    private static final String SALT = "#ZgW5gC6$^r#Q%L7%y";

    public static String encrypt(String content) {
        return DigestUtils.md2Hex(SALT + content);
    }

    public static boolean verify(String content, String md5) {
        return md5.equalsIgnoreCase(encrypt(content));
    }
}

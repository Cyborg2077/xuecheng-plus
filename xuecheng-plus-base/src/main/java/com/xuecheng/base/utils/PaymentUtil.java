package com.xuecheng.base.utils;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

public class PaymentUtil {
    private static final Pattern pattern = Pattern.compile("SJPAY(,\\S+){4}");
    public static final String SHANJUPAY_PREFIX = "XC";

    public static boolean checkPayOrderAttach (String attach) {
        if (StringUtils.isBlank(attach)) {
            return false;
        }
        return pattern.matcher(attach).matches();
    }

    public static String genUniquePayOrderNo() {
        String dateTime = DateTimeFormatter.ofPattern("yyMMddHHmmssSSS").format(LocalDateTime.now());
        return SHANJUPAY_PREFIX + dateTime + RandomStringUtils.randomAlphanumeric(15);
    }

    public static void main(String[] args) {
        System.out.println(genUniquePayOrderNo());
        System.out.println(genUniquePayOrderNo().length());
    }
}


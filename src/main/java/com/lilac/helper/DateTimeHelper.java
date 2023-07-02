package com.lilac.helper;

import java.text.SimpleDateFormat;
import java.util.Date;

import static java.lang.Math.abs;

public class DateTimeHelper {
    private static final long MONTH = 2592000 * 1000L;
    private static final long DAY = 86400 * 1000L;

    public static long DateToStamp(Date date){
        return date.getTime();
    }

    public static String StampToSqlDate(long mil){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(StampToDate(mil));
    }

    public static Date StampToDate(long mil){
        return new Date(mil);
    }

    public static Date AddMonthsResult(Date date, int months){ // 30days for a month.
        return new Date(date.getTime() + (MONTH * months));
    }

    public static String DaySpan(Date start, Date end){ // 30days for a month
        // if expire, now is bigger than before, should be positive
        long span = end.getTime() - start.getTime();
        if(span % DAY != 0) return String.valueOf(span / DAY) + " nf"; // those days, but not finished
        else return String.valueOf(span / DAY); // those days that just finished
    }

    public static String NowDaySpan(Date end){
        // if expire, now is bigger than before, should be positive
        return DaySpan(new Date(), end);
    }

}

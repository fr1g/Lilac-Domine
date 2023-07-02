package com.lilac.helper;

import java.math.BigDecimal;

public class PriceCalculateHelper {
    public static double CalcCostByMonth(int months, double price){
        // price: price per month
        return (new BigDecimal((months * price)).setScale(2, BigDecimal.ROUND_HALF_UP)).doubleValue();
    }

    public static double CalcCostByMonth(int months, String domain){
        return CalcCostByMonth(months, PresetDomainPerMonthPriceHelper.GetPrePrice(domain));
    }


}

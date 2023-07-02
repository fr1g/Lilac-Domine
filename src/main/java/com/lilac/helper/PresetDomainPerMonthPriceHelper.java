package com.lilac.helper;

public class PresetDomainPerMonthPriceHelper {
    static final double dotCOM = 20.77 ;
    static final double dotCN = 19.49 ;
    static final double dotUS = 17.64 ;
    static final double dotSU = 5.9 ;
    static final double dotICU = 22.7 ;
    static final double dotRU = 19.91 ;
    static final double dotNET = 32.64 ;
    static final double dotJAVA = 114.514 ;
    static final double dotDAD = 6.28 ;
    static final double dotMOM = 5.16 ;

    public static double GetPrePrice(String domain){
        String tail = domain.split("\\.")[1];
        switch (tail){
            case "cn":
                return dotCN;
            case "su":
                return dotSU;
            case "us":
                return dotUS;
            case "com":
                return dotCOM;
            case "ru":
                return dotRU;
            case "mom":
                return dotMOM;
            case "dad":
                return dotDAD;
            case "net":
                return dotNET;
            case "java":
                return dotJAVA;
            case "icu":
                return dotICU;
            default:
                return 12.34;
        }
    }
}

package com.nexwave.nsidita;

//import java.util.regex.;

public class BlankRemover
{

    /* remove leading whitespace */
    public static String ltrim(String source) {
        return (source==null)? null : source.replaceAll("^\\s+", "");
    }

    /* remove trailing whitespace */
    public static String rtrim(String source) {
    	
        return (source==null)? null : source.replaceAll("\\s+$", "");
    }

    /* replace multiple whitespaces between words with single blank */
    public static String itrim(String source) {
        return (source==null)? null : source.replaceAll("\\b\\s{2,}\\b", " ");
    }

    /* remove all superfluous whitespaces in source string */
    public static String rmWhiteSpace(String source) {
        return (source==null)? null : itrim(ltrim(rtrim(source)));
    }

    public static String lrtrim(String source){
        return (source==null)? null : ltrim(rtrim(source));
    }
}

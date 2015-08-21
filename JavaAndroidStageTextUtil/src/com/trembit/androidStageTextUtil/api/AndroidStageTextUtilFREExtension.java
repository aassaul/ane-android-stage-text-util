package com.trembit.androidStageTextUtil.api;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 16:00
 */
public class AndroidStageTextUtilFREExtension implements FREExtension {

    private static AndroidStageTextUtilFREContext context;

    @Override
    public FREContext createContext(String s) {
        if(context == null){
            context = new AndroidStageTextUtilFREContext();
        }
        return context;
    }

    @Override
    public void dispose() {}

    @Override
    public void initialize() {}
}

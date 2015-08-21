package com.trembit.androidStageTextUtil.api;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 15:51
 */
public class AndroidStageTextUtilFREContext extends FREContext {

    private static Map<String, FREFunction> functionMap;

    @Override
    public Map<String, FREFunction> getFunctions() {
        if(functionMap == null){
            functionMap = new HashMap<String, FREFunction>();
        }
        return functionMap;
    }

    @Override
    public void dispose() {

    }
}

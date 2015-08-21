package com.trembit.androidStageTextUtil.api.functions;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.adobe.fre.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 21.08.2015
 * Time: 11:14
 */
public class SetTextToFocusedInputFREFunction implements FREFunction {

    @Override
    public FREObject call(final FREContext freContext, FREObject[] freObjects) {
        try {
            final FREArray freArray = (FREArray) freObjects[0];
            final int[] codePoints = new int[(int) freArray.getLength()];
            for (int i = 0; i < codePoints.length; i++) {
                codePoints[i] = freArray.getObjectAt(i).getAsInt();
            }
            final String value = new String(codePoints, 0, codePoints.length);
            final Activity context = freContext.getActivity();
            final View focusedView = context.getCurrentFocus();
            if (focusedView != null && focusedView instanceof TextView){
                ((TextView)focusedView).setText(value);
                freContext.dispatchStatusEventAsync("TextComponentReady", null);
            } else {
                final List<TextView> textViews = getAllInputs(context);
                View.OnFocusChangeListener onFocusChangeListener = new View.OnFocusChangeListener() {
                    @Override
                    public void onFocusChange(View v, boolean hasFocus) {
                        for (TextView textView : textViews){
                            textView.setOnFocusChangeListener(null);
                        }
                        ((TextView) v).setText(value);
                        freContext.dispatchStatusEventAsync("TextComponentReady", null);
                    }
                };
                for (TextView textView : textViews){
                    textView.setOnFocusChangeListener(onFocusChangeListener);
                }
            }
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<TextView> getAllInputs(Activity context){
        final ViewGroup rootView = (ViewGroup)((ViewGroup)context.getWindow().getDecorView().findViewById(android.R.id.content)).getChildAt(0);
        final ViewGroup topLayout = (ViewGroup)rootView.getChildAt(1);
        final List<TextView> result = new LinkedList<TextView>();
        for (int i = 0; i < topLayout.getChildCount(); i++) {
            View view = topLayout.getChildAt(i);
            if(view instanceof ViewGroup){
                ViewGroup viewGroup = (ViewGroup) view;
                if(viewGroup.getChildCount() > 0){
                    view = viewGroup.getChildAt(0);
                    if (view instanceof TextView){
                        result.add((TextView) view);
                    }
                }
            }
        }
        return result;
    }
}

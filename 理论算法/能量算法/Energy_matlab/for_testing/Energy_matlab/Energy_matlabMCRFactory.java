/*
 * MATLAB Compiler: 6.6 (R2018a)
 * Date: Fri Jun  5 20:34:39 2020
 * Arguments: 
 * "-B""macro_default""-W""java:Energy_matlab,Energy_""-T""link:lib""-d""I:\\�о����׶�\\��ɽ\\�����㷨\\�����㷨\\Energy_matlab\\for_testing""class{Energy_:I:\\��ʿ�׶�\\��һ\\paper1�����쳣��֪������ѹ��+��ֹ����ʶ��\\integrade\\emd.m,I:\\��ʿ�׶�\\��һ\\paper1�����쳣��֪������ѹ��+��ֹ����ʶ��\\integrade\\Energy.m}"
 */

package Energy_matlab;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class Energy_matlabMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "Energy_matla_1ACCB374FE6C2072E4635EE9642556E5";
    
    /** Component name */
    private static final String sComponentName = "Energy_matlab";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(Energy_matlabMCRFactory.class)
        );
    
    
    private Energy_matlabMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            Energy_matlabMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{9,4,0}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}

/*
 * MATLAB Compiler: 6.6 (R2018a)
 * Date: Fri Jun  5 20:34:39 2020
 * Arguments: 
 * "-B""macro_default""-W""java:Energy_matlab,Energy_""-T""link:lib""-d""I:\\研究生阶段\\矿山\\理论算法\\能量算法\\Energy_matlab\\for_testing""class{Energy_:I:\\博士阶段\\博一\\paper1快速异常感知（波形压缩+起止点判识）\\integrade\\emd.m,I:\\博士阶段\\博一\\paper1快速异常感知（波形压缩+起止点判识）\\integrade\\Energy.m}"
 */

package Energy_matlab;

import com.mathworks.toolbox.javabuilder.pooling.Poolable;
import java.util.List;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * The <code>Energy_Remote</code> class provides a Java RMI-compliant interface to MATLAB 
 * functions. The interface is compiled from the following files:
 * <pre>
 *  I:\\博士阶段\\博一\\paper1快速异常感知（波形压缩+起止点判识）\\integrade\\emd.m
 *  I:\\博士阶段\\博一\\paper1快速异常感知（波形压缩+起止点判识）\\integrade\\Energy.m
 * </pre>
 * The {@link #dispose} method <b>must</b> be called on a <code>Energy_Remote</code> 
 * instance when it is no longer needed to ensure that native resources allocated by this 
 * class are properly freed, and the server-side proxy is unexported.  (Failure to call 
 * dispose may result in server-side threads not being properly shut down, which often 
 * appears as a hang.)  
 *
 * This interface is designed to be used together with 
 * <code>com.mathworks.toolbox.javabuilder.remoting.RemoteProxy</code> to automatically 
 * generate RMI server proxy objects for instances of Energy_matlab.Energy_.
 */
public interface Energy_Remote extends Poolable
{
    /**
     * Provides the standard interface for calling the <code>emd</code> MATLAB function 
     * with 1 input argument.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * Documentation as provided by the author of the MATLAB function:
     * <pre>
     * %main loop : requires at least 3 extrema to proceed
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the MATLAB function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.rmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] emd(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>Energy</code> MATLAB 
     * function with 1 input argument.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * No usage documentation is available for this function.  (To fix this, the function 
     * author should insert a help comment at the beginning of their MATLAB code.  See 
     * the MATLAB documentation for more details.)
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the MATLAB function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.rmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] Energy(int nargout, Object... rhs) throws RemoteException;
  
    /** 
     * Frees native resources associated with the remote server object 
     * @throws java.rmi.RemoteException An error has occurred during the function call or in communication with the server.
     */
    void dispose() throws RemoteException;
}

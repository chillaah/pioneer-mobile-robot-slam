#if !defined(S_FUNCTION_NAME)
#define S_FUNCTION_NAME bh_DDR_component_model_msf
#endif
#define S_FUNCTION_LEVEL 2
#if !defined(RTW_GENERATED_S_FUNCTION)
#define RTW_GENERATED_S_FUNCTION
#endif
#include <stdio.h>
#include <math.h>
#include "simstruc.h"
#include "fixedpoint.h"
#define rt_logging_h
#include "bh_DDR_component_model_types.h"
#include "bh_DDR_component_model.h"
#include "bh_DDR_component_model_private.h"
struct_KgyuWirBFPgZYO8JXc0O3B rtP_veh ; const char *
rt_GetMatSignalLoggingFileName ( void ) { return NULL ; } const char *
rt_GetMatSigLogSelectorFileName ( void ) { return NULL ; } void *
rt_GetOSigstreamManager ( void ) { return NULL ; } void * rt_slioCatalogue (
void ) { return NULL ; } void * rtwGetPointerFromUniquePtr ( void * uniquePtr
) { return NULL ; } void * CreateDiagnosticAsVoidPtr ( const char * id , int
nargs , ... ) { void * voidPtrDiagnostic = NULL ; va_list args ; va_start (
args , nargs ) ; slmrCreateDiagnostic ( id , nargs , args , &
voidPtrDiagnostic ) ; va_end ( args ) ; return voidPtrDiagnostic ; } void
rt_ssSet_slErrMsg ( void * S , void * diag ) { SimStruct * simStrcut = (
SimStruct * ) S ; if ( ! _ssIsErrorStatusAslErrMsg ( simStrcut ) ) {
_ssSet_slLocalErrMsg ( simStrcut , diag ) ; } else { _ssDiscardDiagnostic (
simStrcut , diag ) ; } } void rt_ssReportDiagnosticAsWarning ( void * S ,
void * diag ) { _ssReportDiagnosticAsWarning ( ( SimStruct * ) S , diag ) ; }
void rt_ssReportDiagnosticAsInfo ( void * S , void * diag ) {
_ssReportDiagnosticAsInfo ( ( SimStruct * ) S , diag ) ; } const char *
rt_CreateFullPathToTop ( const char * toppath , const char * subpath ) { char
* fullpath = NULL ; slmrCreateFullPathToTop ( toppath , subpath , & fullpath
) ; return fullpath ; } boolean_T slIsRapidAcceleratorSimulating ( void ) {
return false ; } void rt_RAccelReplaceFromFilename ( const char * blockpath ,
char * fileName ) { ( void ) blockpath ; ( void ) fileName ; } void
rt_RAccelReplaceToFilename ( const char * blockpath , char * fileName ) { (
void ) blockpath ; ( void ) fileName ; } void
slsaCacheDWorkPointerForSimTargetOP ( void * ss , void * * ptr ) { ( void )
ss ; ( void ) ptr ; } void slsaCacheDWorkDataForSimTargetOP ( void * ss ,
void * ptr , unsigned int sizeInBytes ) { ( void ) ss ; ( void ) ptr ; ( void
) sizeInBytes ; } void slsaSaveRawMemoryForSimTargetOP ( void * ss , const
char * key , void * ptr , unsigned int sizeInBytes , void * ( *
customOPSaveFcn ) ( void * dworkPtr , unsigned int * sizeInBytes ) , void ( *
customOPRestoreFcn ) ( void * dworkPtr , const void * data , unsigned int
sizeInBytes ) ) { ( void ) ss ; ( void ) key ; ( void ) ptr ; ( void )
sizeInBytes ; ( void ) customOPSaveFcn ; ( void ) customOPRestoreFcn ; }
#define MDL_PROCESS_PARAMETERS
#if defined(MATLAB_MEX_FILE)
static void mdlProcessParameters ( SimStruct * S ) {
struct_KgyuWirBFPgZYO8JXc0O3B * GlobalPrm_0 = ( struct_KgyuWirBFPgZYO8JXc0O3B
* ) NULL ; if ( ! ssGetModelRefGlobalParamData ( S , 0 , ( void * * ) ( &
GlobalPrm_0 ) ) ) return ; if ( GlobalPrm_0 != NULL ) { ( void ) memcpy ( & (
rtP_veh ) , GlobalPrm_0 , sizeof ( struct_KgyuWirBFPgZYO8JXc0O3B ) ) ; } }
#endif
static void mdlInitializeConditions ( SimStruct * S ) { ekeuq13di1j * dw = (
ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; gactmdiaa1 * localX = ( gactmdiaa1 * )
ssGetContStates ( S ) ; ivevcnx1h3 ( & ( dw -> rtm ) , & ( dw -> rtdw ) ,
localX ) ; } static void mdlReset ( SimStruct * S ) { ekeuq13di1j * dw = (
ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; gactmdiaa1 * localX = ( gactmdiaa1 * )
ssGetContStates ( S ) ; lllyhlm0sr ( & ( dw -> rtm ) , & ( dw -> rtdw ) ,
localX ) ; } static void mdlPeriodicOutputUpdate ( SimStruct * S , int_T tid
) { ekeuq13di1j * dw = ( ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; real_T const
* i_a3yphosxjf = ( real_T * ) ssGetInputPortSignal ( S , 0 ) ; real_T const *
i_eocpp0sblx = ( real_T * ) ssGetInputPortSignal ( S , 1 ) ; real_T * o_B_3_1
= ( real_T * ) ssGetOutputPortSignal ( S , 0 ) ; real_T * o_B_3_2 = ( real_T
* ) ssGetOutputPortSignal ( S , 1 ) ; real_T * o_B_3_3 = ( real_T * )
ssGetOutputPortSignal ( S , 2 ) ; real_T * o_B_3_4 = ( real_T * )
ssGetOutputPortSignal ( S , 3 ) ; real_T * o_B_3_5 = ( real_T * )
ssGetOutputPortSignal ( S , 4 ) ; real_T * o_B_3_6 = ( real_T * )
ssGetOutputPortSignal ( S , 5 ) ; real_T * o_o_B_3_7 = ( real_T * )
ssGetOutputPortSignal ( S , 6 ) ; real_T * o_B_3_8 = ( real_T * )
ssGetOutputPortSignal ( S , 7 ) ; real_T * o_B_3_9 = ( real_T * )
ssGetOutputPortSignal ( S , 8 ) ; real_T * o_B_3_10 = ( real_T * )
ssGetOutputPortSignal ( S , 9 ) ; real_T * o_B_3_11 = ( real_T * )
ssGetOutputPortSignal ( S , 10 ) ; real_T * o_B_3_12 = ( real_T * )
ssGetOutputPortSignal ( S , 11 ) ; real_T * o_B_3_13 = ( real_T * )
ssGetOutputPortSignal ( S , 12 ) ; real_T * o_B_3_14 = ( real_T * )
ssGetOutputPortSignal ( S , 13 ) ; real_T * o_B_3_15 = ( real_T * )
ssGetOutputPortSignal ( S , 14 ) ; real_T * o_B_3_16 = ( real_T * )
ssGetOutputPortSignal ( S , 15 ) ; real_T * o_B_3_17 = ( real_T * )
ssGetOutputPortSignal ( S , 16 ) ; real_T * o_B_3_18 = ( real_T * )
ssGetOutputPortSignal ( S , 17 ) ; real_T * o_B_3_19 = ( real_T * )
ssGetOutputPortSignal ( S , 18 ) ; real_T * o_B_3_20 = ( real_T * )
ssGetOutputPortSignal ( S , 19 ) ; real_T * o_B_3_21 = ( real_T * )
ssGetOutputPortSignal ( S , 20 ) ; real_T * o_B_3_22 = ( real_T * )
ssGetOutputPortSignal ( S , 21 ) ; real_T * o_B_3_23 = ( real_T * )
ssGetOutputPortSignal ( S , 22 ) ; real_T * o_B_3_24 = ( real_T * )
ssGetOutputPortSignal ( S , 23 ) ; real_T * o_B_3_25 = ( real_T * )
ssGetOutputPortSignal ( S , 24 ) ; real_T * o_B_3_26 = ( real_T * )
ssGetOutputPortSignal ( S , 25 ) ; real_T * o_B_3_27 = ( real_T * )
ssGetOutputPortSignal ( S , 26 ) ; real_T * o_B_3_28 = ( real_T * )
ssGetOutputPortSignal ( S , 27 ) ; real_T * o_B_3_29 = ( real_T * )
ssGetOutputPortSignal ( S , 28 ) ; real_T * o_B_3_30 = ( real_T * )
ssGetOutputPortSignal ( S , 29 ) ; gactmdiaa1 * localX = ( gactmdiaa1 * )
ssGetContStates ( S ) ; if ( tid == 0 ) { bh_DDR_component_model ( & ( dw ->
rtm ) , i_a3yphosxjf , i_eocpp0sblx , o_B_3_1 , o_B_3_2 , o_B_3_3 , o_B_3_4 ,
o_B_3_5 , o_B_3_6 , o_o_B_3_7 , o_B_3_8 , o_B_3_9 , o_B_3_10 , o_B_3_11 ,
o_B_3_12 , o_B_3_13 , o_B_3_14 , o_B_3_15 , o_B_3_16 , o_B_3_17 , o_B_3_18 ,
o_B_3_19 , o_B_3_20 , o_B_3_21 , o_B_3_22 , o_B_3_23 , o_B_3_24 , o_B_3_25 ,
o_B_3_26 , o_B_3_27 , o_B_3_28 , o_B_3_29 , o_B_3_30 , & ( dw -> rtb ) , & (
dw -> rtdw ) , localX ) ; dljfqprwl0 ( & ( dw -> rtdw ) ) ; } } static void
mdlInitializeSizes ( SimStruct * S ) { if ( ( S -> mdlInfo -> genericFcn != (
NULL ) ) && ( ! ( S -> mdlInfo -> genericFcn ) ( S ,
GEN_FCN_CHK_MODELREF_SFUN_HAS_MODEL_BLOCK , - 1 , ( NULL ) ) ) ) { return ; }
ssSetNumSFcnParams ( S , 0 ) ; ssFxpSetU32BitRegionCompliant ( S , 1 ) ;
rt_InitInfAndNaN ( sizeof ( real_T ) ) ; if ( S -> mdlInfo -> genericFcn != (
NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ; }
ssSetRTWGeneratedSFcn ( S , 2 ) ; ssSetNumContStates ( S , 5 ) ;
ssSetNumDiscStates ( S , 0 ) ; ssSetNumPeriodicContStates ( S , 0 ) ;
slmrInitializeIOPortDataVectors ( S , 2 , 30 ) ; if ( ! ssSetNumInputPorts (
S , 2 ) ) return ; if ( ! ssSetInputPortVectorDimension ( S , 0 , 1 ) )
return ; ssSetInputPortDimensionsMode ( S , 0 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 0 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 0 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 0 ,
unitIdReg ) ;
#endif
} ssSetInputPortDirectFeedThrough ( S , 0 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 0 , 1 ) ; ssSetInputPortOptimOpts ( S
, 0 , SS_NOT_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 0 ,
false ) ; ssSetInputPortSampleTime ( S , 0 , 0.0 ) ; ssSetInputPortOffsetTime
( S , 0 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 1 , 1 ) ) return
; ssSetInputPortDimensionsMode ( S , 1 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 1 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 1 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 1 ,
unitIdReg ) ;
#endif
} ssSetInputPortDirectFeedThrough ( S , 1 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 1 , 1 ) ; ssSetInputPortOptimOpts ( S
, 1 , SS_NOT_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 1 ,
false ) ; ssSetInputPortSampleTime ( S , 1 , 0.0 ) ; ssSetInputPortOffsetTime
( S , 1 , 0.0 ) ; if ( ! ssSetNumOutputPorts ( S , 30 ) ) return ; if ( !
ssSetOutputPortVectorDimension ( S , 0 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 0 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 0 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 0 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 0 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 0 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
0 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 0 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 0 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 0 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 0 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 1 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 1 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 1 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 1 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 1 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 1 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
1 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 1 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 1 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 1 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 1 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 2 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 2 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 2 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 2 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 2 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 2 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
2 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 2 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 2 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 2 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 2 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 3 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 3 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 3 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 3 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 3 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 3 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
3 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 3 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 3 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 3 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 3 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 4 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 4 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 4 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 4 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 4 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 4 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
4 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 4 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 4 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 4 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 4 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 5 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 5 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 5 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 5 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 5 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 5 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
5 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 5 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 5 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 5 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 5 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 6 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 6 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 6 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 6 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 6 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 6 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
6 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 6 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 6 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 6 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 6 , SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 7 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 7 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 7 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 7 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 7 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 7 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
7 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 7 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 7 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 7 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 7 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 8 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 8 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 8 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 8 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 8 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 8 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
8 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 8 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 8 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 8 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 8 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 9 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 9 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 9 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 9 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 9 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 9 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
9 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 9 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 9 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 9 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 9 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 10 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 10 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 10 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 10 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 10 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 10 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 10 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 10 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 10 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 10 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 10 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 11 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 11 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 11 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 11 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 11 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 11 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 11 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 11 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 11 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 11 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 11 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 12 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 12 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 12 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 12 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 12 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 12 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 12 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 12 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 12 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 12 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 12 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 13 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 13 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 13 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 13 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 13 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 13 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 13 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 13 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 13 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 13 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 13 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 14 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 14 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 14 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 14 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 14 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 14 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 14 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 14 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 14 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 14 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 14 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 15 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 15 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 15 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 15 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 15 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 15 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 15 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 15 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 15 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 15 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 15 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 16 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 16 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 16 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 16 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 16 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 16 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 16 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 16 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 16 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 16 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 16 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 17 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 17 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 17 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 17 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 17 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 17 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 17 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 17 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 17 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 17 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 17 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 18 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 18 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 18 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 18 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 18 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 18 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 18 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 18 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 18 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 18 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 18 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 19 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 19 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 19 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 19 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 19 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 19 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 19 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 19 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 19 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 19 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 19 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 20 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 20 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 20 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 20 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 20 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 20 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 20 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 20 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 20 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 20 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 20 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 21 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 21 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 21 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 21 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 21 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 21 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 21 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 21 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 21 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 21 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 21 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 22 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 22 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 22 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 22 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 22 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 22 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 22 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 22 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 22 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 22 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 22 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 23 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 23 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 23 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 23 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 23 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 23 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 23 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 23 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 23 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 23 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 23 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 24 , 3 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 24 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 24 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 24 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 24 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 24 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 24 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 24 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 24 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 24 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 24 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 25 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 25 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 25 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 25 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 25 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 25 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 25 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 25 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 25 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 25 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 25 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 26 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 26 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 26 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 26 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 26 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 26 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 26 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 26 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 26 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 26 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 26 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 27 , 3 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 27 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 27 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 27 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 27 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 27 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 27 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 27 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 27 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 27 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 27 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 28 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 28 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 28 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 28 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 28 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 28 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 28 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 28 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 28 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 28 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 28 , SS_NOT_REUSABLE_AND_LOCAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 29 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 29 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 29 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 29 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if (
unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 29 ,
unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 29 , 0.0 ) ; ssSetOutputPortOffsetTime ( S
, 29 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 29 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 29 , SS_NOT_OK_TO_MERGE ) ;
ssSetOutputPortICAttributes ( S , 29 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 29 , SS_NOT_REUSABLE_AND_LOCAL ) ;
ssSetSimStateCompliance ( S , USE_CUSTOM_SIM_STATE ) ;
mr_bh_DDR_component_model_RegisterSimStateChecksum ( S ) ;
ssSetNumSampleTimes ( S , 2 ) ; ssSetParameterTuningCompliance ( S , true ) ;
ssSetNumRWork ( S , 0 ) ; ssSetNumIWork ( S , 0 ) ; ssSetNumPWork ( S , 0 ) ;
ssSetNumModes ( S , 0 ) ; { int_T zcsIdx = 0 ; }
ssSetOutputPortIsNonContinuous ( S , 0 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 0 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 1 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 1 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 2 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 2 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 3 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 3 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 4 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 4 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 5 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 5 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 6 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 6 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 7 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 7 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 8 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 8 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 9 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 9 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 10 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 10 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 11 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 11 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 12 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 12 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 13 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 13 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 14 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 14 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 15 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 15 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 16 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 16 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 17 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 17 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 18 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 18 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 19 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 19 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 20 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 20 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 21 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 21 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 22 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 22 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 23 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 23 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 24 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 24 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 25 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 25 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 26 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 26 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 27 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 27 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 28 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 28 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 29 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 29 , 0 ) ;
ssSetInputPortIsNotDerivPort ( S , 0 , 0 ) ; ssSetInputPortIsNotDerivPort ( S
, 1 , 0 ) ; ssSetModelReferenceSampleTimeInheritanceRule ( S ,
DISALLOW_SAMPLE_TIME_INHERITANCE ) ; ssSetRuntimeThreadSafetyCompliance ( S ,
RUNTIME_THREAD_SAFETY_COMPLIANCE_TRUE ) ; ssSetAcceptsFcnCallInputs ( S ) ;
ssSetModelReferenceNormalModeSupport ( S ,
MDL_START_AND_MDL_PROCESS_PARAMS_OK ) ; ssSupportsMultipleExecInstances ( S ,
true ) ; ssHasStateInsideForEachSS ( S , false ) ; ssSetOptions ( S ,
SS_OPTION_ALLOW_CONSTANT_PORT_SAMPLE_TIME |
SS_OPTION_PORT_SAMPLE_TIMES_ASSIGNED | SS_OPTION_SUPPORTS_ALIAS_DATA_TYPES |
SS_OPTION_DISALLOW_CONSTANT_SAMPLE_TIME | SS_OPTION_EXCEPTION_FREE_CODE |
SS_OPTION_WORKS_WITH_CODE_REUSE ) ;
#if SS_SFCN_FOR_SIM
if ( S -> mdlInfo -> genericFcn != ( NULL ) && ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { int_T retVal = 1 ;
mr_bh_DDR_component_model_MdlInfoRegFcn ( S , "bh_DDR_component_model" , &
retVal ) ; if ( ! retVal ) return ; }
#endif
#if SS_SFCN_FOR_SIM
if ( ssSetNumDWork ( S , 1 ) ) { int mdlrefDWTypeId ; ssRegMdlRefDWorkType (
S , & mdlrefDWTypeId ) ; if ( mdlrefDWTypeId == INVALID_DTYPE_ID ) return ;
if ( ! ssSetDataTypeSize ( S , mdlrefDWTypeId , sizeof ( ekeuq13di1j ) ) )
return ; ssSetDWorkDataType ( S , 0 , mdlrefDWTypeId ) ; ssSetDWorkWidth ( S
, 0 , 1 ) ; }
#else
if ( ! ssSetNumDWork ( S , 1 ) ) { return ; }
#endif
slmrRegisterSystemInitializeMethod ( S , mdlInitializeConditions ) ;
slmrRegisterSystemResetMethod ( S , mdlReset ) ;
slmrRegisterPeriodicOutputUpdateMethod ( S , mdlPeriodicOutputUpdate ) ;
ssSetSimulinkVersionGeneratedIn ( S , "10.3" ) ; ssSetNeedAbsoluteTime ( S ,
1 ) ; } static void mdlInitializeSampleTimes ( SimStruct * S ) {
ssSetSampleTime ( S , 0 , 0 ) ; ssSetOffsetTime ( S , 0 , 0 ) ;
ssSetSampleTime ( S , 1 , mxGetInf ( ) ) ; ssSetOffsetTime ( S , 1 , 0 ) ;
return ; }
#define MDL_SET_WORK_WIDTHS
static void mdlSetWorkWidths ( SimStruct * S ) { if ( S -> mdlInfo ->
genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ;
ssSetSignalSizesComputeType ( S , SS_VARIABLE_SIZE_FROM_INPUT_VALUE_AND_SIZE
) ; } { static const char * toFileNames [ ] = { "" } ; static const char *
fromFileNames [ ] = { "" } ; if ( ! ssSetModelRefFromFiles ( S , 0 ,
fromFileNames ) ) return ; if ( ! ssSetModelRefToFiles ( S , 0 , toFileNames
) ) return ; } }
#define MDL_SETUP_RUNTIME_RESOURCES
static void mdlSetupRuntimeResources ( SimStruct * S ) { ekeuq13di1j * dw = (
ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; gactmdiaa1 * localX = ( gactmdiaa1 * )
ssGetContStates ( S ) ; void * sysRanPtr = ( NULL ) ; int sysTid = 0 ;
ssGetContextSysRanBCPtr ( S , & sysRanPtr ) ; ssGetContextSysTid ( S , &
sysTid ) ; if ( sysTid == CONSTANT_TID ) { sysTid = 0 ; } erydabnrep ( S ,
slmrGetTopTidFromMdlRefChildTid ( S , 0 , false ) ,
slmrGetTopTidFromMdlRefChildTid ( S , 1 , true ) , & ( dw -> rtm ) , & ( dw
-> rtb ) , & ( dw -> rtdw ) , localX , sysRanPtr , sysTid , ( NULL ) , ( NULL
) , 0 , - 1 ) ; ssSetModelMappingInfoPtr ( S , & ( dw -> rtm . DataMapInfo .
mmi ) ) ; if ( S -> mdlInfo -> genericFcn != ( NULL ) ) { _GenericFcn fcn = S
-> mdlInfo -> genericFcn ; } }
#define MDL_START
static void mdlStart ( SimStruct * S ) { ekeuq13di1j * dw = ( ekeuq13di1j * )
ssGetDWork ( S , 0 ) ; mdlProcessParameters ( S ) ; inmi3y1gkk ( & ( dw ->
rtb ) ) ; } static void mdlOutputs ( SimStruct * S , int_T tid ) {
ekeuq13di1j * dw = ( ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; real_T const *
i_a3yphosxjf = ( real_T * ) ssGetInputPortSignal ( S , 0 ) ; real_T const *
i_eocpp0sblx = ( real_T * ) ssGetInputPortSignal ( S , 1 ) ; real_T * o_B_3_1
= ( real_T * ) ssGetOutputPortSignal ( S , 0 ) ; real_T * o_B_3_2 = ( real_T
* ) ssGetOutputPortSignal ( S , 1 ) ; real_T * o_B_3_3 = ( real_T * )
ssGetOutputPortSignal ( S , 2 ) ; real_T * o_B_3_4 = ( real_T * )
ssGetOutputPortSignal ( S , 3 ) ; real_T * o_B_3_5 = ( real_T * )
ssGetOutputPortSignal ( S , 4 ) ; real_T * o_B_3_6 = ( real_T * )
ssGetOutputPortSignal ( S , 5 ) ; real_T * o_o_B_3_7 = ( real_T * )
ssGetOutputPortSignal ( S , 6 ) ; real_T * o_B_3_8 = ( real_T * )
ssGetOutputPortSignal ( S , 7 ) ; real_T * o_B_3_9 = ( real_T * )
ssGetOutputPortSignal ( S , 8 ) ; real_T * o_B_3_10 = ( real_T * )
ssGetOutputPortSignal ( S , 9 ) ; real_T * o_B_3_11 = ( real_T * )
ssGetOutputPortSignal ( S , 10 ) ; real_T * o_B_3_12 = ( real_T * )
ssGetOutputPortSignal ( S , 11 ) ; real_T * o_B_3_13 = ( real_T * )
ssGetOutputPortSignal ( S , 12 ) ; real_T * o_B_3_14 = ( real_T * )
ssGetOutputPortSignal ( S , 13 ) ; real_T * o_B_3_15 = ( real_T * )
ssGetOutputPortSignal ( S , 14 ) ; real_T * o_B_3_16 = ( real_T * )
ssGetOutputPortSignal ( S , 15 ) ; real_T * o_B_3_17 = ( real_T * )
ssGetOutputPortSignal ( S , 16 ) ; real_T * o_B_3_18 = ( real_T * )
ssGetOutputPortSignal ( S , 17 ) ; real_T * o_B_3_19 = ( real_T * )
ssGetOutputPortSignal ( S , 18 ) ; real_T * o_B_3_20 = ( real_T * )
ssGetOutputPortSignal ( S , 19 ) ; real_T * o_B_3_21 = ( real_T * )
ssGetOutputPortSignal ( S , 20 ) ; real_T * o_B_3_22 = ( real_T * )
ssGetOutputPortSignal ( S , 21 ) ; real_T * o_B_3_23 = ( real_T * )
ssGetOutputPortSignal ( S , 22 ) ; real_T * o_B_3_24 = ( real_T * )
ssGetOutputPortSignal ( S , 23 ) ; real_T * o_B_3_25 = ( real_T * )
ssGetOutputPortSignal ( S , 24 ) ; real_T * o_B_3_26 = ( real_T * )
ssGetOutputPortSignal ( S , 25 ) ; real_T * o_B_3_27 = ( real_T * )
ssGetOutputPortSignal ( S , 26 ) ; real_T * o_B_3_28 = ( real_T * )
ssGetOutputPortSignal ( S , 27 ) ; real_T * o_B_3_29 = ( real_T * )
ssGetOutputPortSignal ( S , 28 ) ; real_T * o_B_3_30 = ( real_T * )
ssGetOutputPortSignal ( S , 29 ) ; gactmdiaa1 * localX = ( gactmdiaa1 * )
ssGetContStates ( S ) ; if ( tid == PARAMETER_TUNING_TID ) {
bh_DDR_component_modelTID1 ( & ( dw -> rtb ) ) ; } if ( tid != CONSTANT_TID
&& tid != PARAMETER_TUNING_TID ) { if ( ssIsSampleHit ( S , 0 , tid ) ||
ssIsMinorTimeStep ( S ) ) { bh_DDR_component_model ( & ( dw -> rtm ) ,
i_a3yphosxjf , i_eocpp0sblx , o_B_3_1 , o_B_3_2 , o_B_3_3 , o_B_3_4 , o_B_3_5
, o_B_3_6 , o_o_B_3_7 , o_B_3_8 , o_B_3_9 , o_B_3_10 , o_B_3_11 , o_B_3_12 ,
o_B_3_13 , o_B_3_14 , o_B_3_15 , o_B_3_16 , o_B_3_17 , o_B_3_18 , o_B_3_19 ,
o_B_3_20 , o_B_3_21 , o_B_3_22 , o_B_3_23 , o_B_3_24 , o_B_3_25 , o_B_3_26 ,
o_B_3_27 , o_B_3_28 , o_B_3_29 , o_B_3_30 , & ( dw -> rtb ) , & ( dw -> rtdw
) , localX ) ; } } }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { ekeuq13di1j * dw = (
ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; if ( ssIsSampleHit ( S , 0 , tid ) ) {
dljfqprwl0 ( & ( dw -> rtdw ) ) ; } return ; }
#define MDL_DERIVATIVES
static void mdlDerivatives ( SimStruct * S ) { ekeuq13di1j * dw = (
ekeuq13di1j * ) ssGetDWork ( S , 0 ) ; real_T * o_o_B_3_7 = ( real_T * )
ssGetOutputPortSignal ( S , 6 ) ; p2tzx000jt * localXdot = ( p2tzx000jt * )
ssGetdX ( S ) ; kviuoi4m5n ( o_o_B_3_7 , & ( dw -> rtb ) , localXdot ) ; }
static void mdlTerminate ( SimStruct * S ) { ekeuq13di1j * dw = ( ekeuq13di1j
* ) ssGetDWork ( S , 0 ) ; ojgv1fm03w ( & ( dw -> rtm ) ) ; return ; }
#define MDL_CLEANUP_RUNTIME_RESOURCES
static void mdlCleanupRuntimeResources ( SimStruct * S ) { }
#if !defined(MDL_SIM_STATE)
#define MDL_SIM_STATE
#endif
static mxArray * mdlGetSimState ( SimStruct * S ) { static const char *
simStateFieldNames [ 6 ] = { "localX" , "mdlrefDW" , "disallowedStateData" ,
"tNext" , "tNextTid" , "nonContDerivSigInfoPrevVal" , } ; mxArray * ss =
mxCreateStructMatrix ( 1 , 1 , 6 , simStateFieldNames ) ; { const gactmdiaa1
* localX = ( const gactmdiaa1 * ) ssGetContStates ( S ) ; const size_t
numBytes = sizeof ( gactmdiaa1 ) ; mxArray * storedX = mxCreateNumericMatrix
( 1 , numBytes , mxUINT8_CLASS , mxREAL ) ; UINT8_T * rawData = ( UINT8_T * )
mxGetData ( storedX ) ; memcpy ( & rawData [ 0 ] , localX , numBytes ) ;
mxSetFieldByNumber ( ss , 0 , 0 , storedX ) ; } { mxArray * mdlrefDW =
mr_bh_DDR_component_model_GetDWork ( ssGetDWork ( S , 0 ) ) ;
mxSetFieldByNumber ( ss , 0 , 1 , mdlrefDW ) ; } { mxArray * data =
mr_bh_DDR_component_model_GetSimStateDisallowedBlocks ( ) ;
mxSetFieldByNumber ( ss , 0 , 2 , data ) ; } ; mxSetFieldByNumber ( ss , 0 ,
3 , mxCreateDoubleScalar ( ( double ) ssGetTNext ( S ) ) ) ;
mxSetFieldByNumber ( ss , 0 , 4 , mxCreateDoubleScalar ( ( double )
ssGetTNextTid ( S ) ) ) ; return ss ; }
#if !defined(MDL_SIM_STATE)
#define MDL_SIM_STATE
#endif
static void mdlSetSimState ( SimStruct * S , const mxArray * ss ) { {
gactmdiaa1 * localX = ( gactmdiaa1 * ) ssGetContStates ( S ) ; const size_t
numBytes = sizeof ( gactmdiaa1 ) ; const mxArray * storedX =
mxGetFieldByNumber ( ss , 0 , 0 ) ; const UINT8_T * rawData = ( const UINT8_T
* ) mxGetData ( storedX ) ; memcpy ( localX , & rawData [ 0 ] , numBytes ) ;
} mr_bh_DDR_component_model_SetDWork ( ssGetDWork ( S , 0 ) ,
mxGetFieldByNumber ( ss , 0 , 1 ) ) ; ssSetTNext ( S , ( time_T ) mxGetScalar
( mxGetFieldByNumber ( ss , 0 , 3 ) ) ) ; ssSetTNextTid ( S , ( int_T )
mxGetScalar ( mxGetFieldByNumber ( ss , 0 , 4 ) ) ) ; }
#ifdef MATLAB_MEX_FILE 
#include "simulink.c"
#include "fixedpoint.c"
#else
#error Assertion failed: file must be compiled as a MEX-file
#endif

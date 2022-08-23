#include <stddef.h>
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "bh_DDR_component_model_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "bh_DDR_component_model.h"
#include "bh_DDR_component_model_capi.h"
#include "bh_DDR_component_model_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) ,
0 , 0 , 0 , 0 , 0 } } ; static rtwCAPI_States rtBlockStates [ ] = { { 0 , 0 ,
TARGET_STRING ( "bh_DDR_component_model/DDR_MODEL/B_to_G_frame/Integrator2" )
, TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 , 1 , - 1 ,
0 } , { 1 , 4 , TARGET_STRING (
"bh_DDR_component_model/DDR_MODEL/THETA_STATES/Integrator2" ) , TARGET_STRING
( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 , 1 , - 1 , 0 } , { 2 , 2 ,
TARGET_STRING ( "bh_DDR_component_model/DDR_MODEL/THETA_STATES/Integrator3" )
, TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 , 1 , - 1 ,
0 } , { 3 , 3 , TARGET_STRING (
"bh_DDR_component_model/DDR_MODEL/veh_C_STATES/Integrator2" ) , TARGET_STRING
( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 , 1 , - 1 , 0 } , { 0 , - 1
, ( NULL ) , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 , 0 , - 1 , 0 } } ;
static int_T rt_LoggedStateIdxList [ ] = { 0 , 3 , 1 , 2 } ;
#ifndef HOST_CAPI_BUILD
static void bh_DDR_component_model_InitializeDataAddr ( void * dataAddr [ ] ,
jhzhbof20x * localDW , gactmdiaa1 * localX ) { dataAddr [ 0 ] = ( void * ) (
& localX -> lbnyjhpnvx [ 0 ] ) ; dataAddr [ 1 ] = ( void * ) ( & localX ->
n0f5vnujvs ) ; dataAddr [ 2 ] = ( void * ) ( & localX -> amvvfqs5o4 ) ;
dataAddr [ 3 ] = ( void * ) ( & localX -> d5p4oduw10 ) ; }
#endif
#ifndef HOST_CAPI_BUILD
static void bh_DDR_component_model_InitializeVarDimsAddr ( int32_T *
vardimsAddr [ ] ) { vardimsAddr [ 0 ] = ( NULL ) ; }
#endif
#ifndef HOST_CAPI_BUILD
static void bh_DDR_component_model_InitializeLoggingFunctions (
RTWLoggingFcnPtr loggingPtrs [ ] ) { loggingPtrs [ 0 ] = ( NULL ) ;
loggingPtrs [ 1 ] = ( NULL ) ; loggingPtrs [ 2 ] = ( NULL ) ; loggingPtrs [ 3
] = ( NULL ) ; }
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_VECTOR , 0 , 2 , 0 } , { rtwCAPI_SCALAR , 2 , 2 , 0 } } ; static
uint_T rtDimensionArray [ ] = { 2 , 1 , 1 , 1 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.0 } ; static rtwCAPI_FixPtMap rtFixPtMap [ ] = {
{ ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , 0 ,
0 } } ; static int_T rtContextSystems [ 4 ] ; static rtwCAPI_LoggingMetaInfo
loggingMetaInfo [ ] = { { 0 , 0 , "" , 0 } } ; static
rtwCAPI_ModelMapLoggingStaticInfo mmiStaticInfoLogging = { 4 ,
rtContextSystems , loggingMetaInfo , 0 , NULL , { 0 , NULL , NULL } , 0 , (
NULL ) } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { {
rtBlockSignals , 0 , ( NULL ) , 0 , ( NULL ) , 0 } , { ( NULL ) , 0 , ( NULL
) , 0 } , { rtBlockStates , 4 } , { rtDataTypeMap , rtDimensionMap ,
rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float" ,
{ 3365792609U , 2521141528U , 3700279510U , 188928896U } , &
mmiStaticInfoLogging , 0 , 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * bh_DDR_component_model_GetCAPIStaticMap (
void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
static void bh_DDR_component_model_InitializeSystemRan ( j2huxwjt4d * const
hobuwbvixl , sysRanDType * systemRan [ ] , jhzhbof20x * localDW , int_T
systemTid [ ] , void * rootSysRanPtr , int rootTid ) { UNUSED_PARAMETER (
hobuwbvixl ) ; UNUSED_PARAMETER ( localDW ) ; systemRan [ 0 ] = ( sysRanDType
* ) rootSysRanPtr ; systemRan [ 1 ] = ( NULL ) ; systemRan [ 2 ] = ( NULL ) ;
systemRan [ 3 ] = ( NULL ) ; systemTid [ 1 ] = hobuwbvixl -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 2 ] = hobuwbvixl -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 3 ] = hobuwbvixl -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 0 ] = rootTid ; rtContextSystems [ 0 ] =
0 ; rtContextSystems [ 1 ] = 0 ; rtContextSystems [ 2 ] = 0 ;
rtContextSystems [ 3 ] = 0 ; }
#endif
#ifndef HOST_CAPI_BUILD
void bh_DDR_component_model_InitializeDataMapInfo ( j2huxwjt4d * const
hobuwbvixl , jhzhbof20x * localDW , gactmdiaa1 * localX , void * sysRanPtr ,
int contextTid ) { rtwCAPI_SetVersion ( hobuwbvixl -> DataMapInfo . mmi , 1 )
; rtwCAPI_SetStaticMap ( hobuwbvixl -> DataMapInfo . mmi , & mmiStatic ) ;
rtwCAPI_SetLoggingStaticMap ( hobuwbvixl -> DataMapInfo . mmi , &
mmiStaticInfoLogging ) ; bh_DDR_component_model_InitializeDataAddr (
hobuwbvixl -> DataMapInfo . dataAddress , localDW , localX ) ;
rtwCAPI_SetDataAddressMap ( hobuwbvixl -> DataMapInfo . mmi , hobuwbvixl ->
DataMapInfo . dataAddress ) ; bh_DDR_component_model_InitializeVarDimsAddr (
hobuwbvixl -> DataMapInfo . vardimsAddress ) ; rtwCAPI_SetVarDimsAddressMap (
hobuwbvixl -> DataMapInfo . mmi , hobuwbvixl -> DataMapInfo . vardimsAddress
) ; rtwCAPI_SetPath ( hobuwbvixl -> DataMapInfo . mmi , ( NULL ) ) ;
rtwCAPI_SetFullPath ( hobuwbvixl -> DataMapInfo . mmi , ( NULL ) ) ;
bh_DDR_component_model_InitializeLoggingFunctions ( hobuwbvixl -> DataMapInfo
. loggingPtrs ) ; rtwCAPI_SetLoggingPtrs ( hobuwbvixl -> DataMapInfo . mmi ,
hobuwbvixl -> DataMapInfo . loggingPtrs ) ; rtwCAPI_SetInstanceLoggingInfo (
hobuwbvixl -> DataMapInfo . mmi , & hobuwbvixl -> DataMapInfo .
mmiLogInstanceInfo ) ; rtwCAPI_SetChildMMIArray ( hobuwbvixl -> DataMapInfo .
mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( hobuwbvixl -> DataMapInfo .
mmi , 0 ) ; bh_DDR_component_model_InitializeSystemRan ( hobuwbvixl ,
hobuwbvixl -> DataMapInfo . systemRan , localDW , hobuwbvixl -> DataMapInfo .
systemTid , sysRanPtr , contextTid ) ; rtwCAPI_SetSystemRan ( hobuwbvixl ->
DataMapInfo . mmi , hobuwbvixl -> DataMapInfo . systemRan ) ;
rtwCAPI_SetSystemTid ( hobuwbvixl -> DataMapInfo . mmi , hobuwbvixl ->
DataMapInfo . systemTid ) ; rtwCAPI_SetGlobalTIDMap ( hobuwbvixl ->
DataMapInfo . mmi , & hobuwbvixl -> Timing . mdlref_GlobalTID [ 0 ] ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void bh_DDR_component_model_host_InitializeDataMapInfo (
bh_DDR_component_model_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif

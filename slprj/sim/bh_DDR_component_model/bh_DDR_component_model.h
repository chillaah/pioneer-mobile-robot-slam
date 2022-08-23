#ifndef RTW_HEADER_bh_DDR_component_model_h_
#define RTW_HEADER_bh_DDR_component_model_h_
#include <string.h>
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#ifndef bh_DDR_component_model_COMMON_INCLUDES_
#define bh_DDR_component_model_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "sf_runtime/sfc_sdi.h"
#endif
#include "bh_DDR_component_model_types.h"
#include "multiword_types.h"
#include "model_reference_types.h"
#include "mwmathutil.h"
#include "rt_nonfinite.h"
typedef struct { real_T bqrtpkxeqm ; real_T jmwbohukhp [ 2 ] ; real_T
exovt42qxt ; real_T db1e0tgf4x ; real_T hshgcm3oro ; real_T lhggxwrwhf ;
real_T cviplrj0tr ; real_T bre5cnwes5 ; real_T ht4canyxjr ; real_T h5hetjludb
; real_T dlpo2pe5rr ; real_T ma0xi25ait ; real_T cus04135ho ; } nzedqmilb2 ;
typedef struct { int_T gvetprdmne ; int_T cli0y3u5lp ; int_T hlrxlsd5sz ;
int_T pu0300myw3 ; } jhzhbof20x ; typedef struct { real_T lbnyjhpnvx [ 2 ] ;
real_T amvvfqs5o4 ; real_T d5p4oduw10 ; real_T n0f5vnujvs ; } gactmdiaa1 ;
typedef struct { real_T lbnyjhpnvx [ 2 ] ; real_T amvvfqs5o4 ; real_T
d5p4oduw10 ; real_T n0f5vnujvs ; } p2tzx000jt ; typedef struct { boolean_T
lbnyjhpnvx [ 2 ] ; boolean_T amvvfqs5o4 ; boolean_T d5p4oduw10 ; boolean_T
n0f5vnujvs ; } a51gcomsgb ; typedef struct { real_T lbnyjhpnvx [ 2 ] ; real_T
amvvfqs5o4 ; real_T d5p4oduw10 ; real_T n0f5vnujvs ; } kl5piisb2c ; typedef
struct { real_T lbnyjhpnvx [ 2 ] ; real_T amvvfqs5o4 ; real_T d5p4oduw10 ;
real_T n0f5vnujvs ; } dr5tz5j5hf ; typedef struct { real_T lbnyjhpnvx [ 2 ] ;
real_T amvvfqs5o4 ; real_T d5p4oduw10 ; real_T n0f5vnujvs ; } jbw2akcjvw ;
struct kyvdc2iekoi_ { real_T P_1 ; real_T P_2 ; real_T P_3 ; real_T P_4 ;
real_T P_5 ; real_T P_6 ; real_T P_7 ; real_T P_8 ; real_T P_9 ; real_T P_10
; } ; struct fbsae5kyyl { struct SimStruct_tag * _mdlRefSfcnS ; const
rtTimingBridge * timingBridge ; struct { rtwCAPI_ModelMappingInfo mmi ;
rtwCAPI_ModelMapLoggingInstanceInfo mmiLogInstanceInfo ; void * dataAddress [
4 ] ; int32_T * vardimsAddress [ 4 ] ; RTWLoggingFcnPtr loggingPtrs [ 4 ] ;
sysRanDType * systemRan [ 4 ] ; int_T systemTid [ 4 ] ; } DataMapInfo ;
struct { int_T mdlref_GlobalTID [ 2 ] ; } Timing ; } ; typedef struct {
nzedqmilb2 rtb ; jhzhbof20x rtdw ; j2huxwjt4d rtm ; } ekeuq13di1j ; extern
struct_KgyuWirBFPgZYO8JXc0O3B rtP_veh ; extern void erydabnrep ( SimStruct *
_mdlRefSfcnS , int_T mdlref_TID0 , int_T mdlref_TID1 , j2huxwjt4d * const
hobuwbvixl , nzedqmilb2 * localB , jhzhbof20x * localDW , gactmdiaa1 * localX
, void * sysRanPtr , int contextTid , rtwCAPI_ModelMappingInfo * rt_ParentMMI
, const char_T * rt_ChildPath , int_T rt_ChildMMIIdx , int_T rt_CSTATEIdx ) ;
extern void mr_bh_DDR_component_model_MdlInfoRegFcn ( SimStruct * mdlRefSfcnS
, char_T * modelName , int_T * retVal ) ; extern mxArray *
mr_bh_DDR_component_model_GetDWork ( const ekeuq13di1j * mdlrefDW ) ; extern
void mr_bh_DDR_component_model_SetDWork ( ekeuq13di1j * mdlrefDW , const
mxArray * ssDW ) ; extern void
mr_bh_DDR_component_model_RegisterSimStateChecksum ( SimStruct * S ) ; extern
mxArray * mr_bh_DDR_component_model_GetSimStateDisallowedBlocks ( ) ; extern
const rtwCAPI_ModelMappingStaticInfo *
bh_DDR_component_model_GetCAPIStaticMap ( void ) ; extern void ivevcnx1h3 (
j2huxwjt4d * const hobuwbvixl , jhzhbof20x * localDW , gactmdiaa1 * localX )
; extern void lllyhlm0sr ( j2huxwjt4d * const hobuwbvixl , jhzhbof20x *
localDW , gactmdiaa1 * localX ) ; extern void inmi3y1gkk ( nzedqmilb2 *
localB ) ; extern void kviuoi4m5n ( real_T bped04z5az [ 2 ] , nzedqmilb2 *
localB , p2tzx000jt * localXdot ) ; extern void dljfqprwl0 ( jhzhbof20x *
localDW ) ; extern void dljfqprwl0TID1 ( void ) ; extern void
bh_DDR_component_model ( j2huxwjt4d * const hobuwbvixl , const real_T *
i5ntoahcdk , const real_T * nvje5zq2o1 , real_T * m1i4qmwhzl , real_T *
fstmgkf35t , real_T * h3vjgejhf4 , real_T e4uvcdk54s [ 2 ] , real_T
ccwhyw3z5n [ 2 ] , real_T j2wj3a1r4n [ 2 ] , real_T bped04z5az [ 2 ] , real_T
cggdc1bpaw [ 2 ] , real_T * gaqlt05bjk , real_T * mtwsk1yeax , real_T *
gp4bu05qnz , real_T * bqonsvzrgk , real_T * ghn2nxly15 , real_T * kesth4x2ap
, real_T * czk4kp0oz4 , real_T * hhezpj2fwm , real_T * klb3dtnhre , real_T *
emokchsxwx , real_T * ob2lnwtug2 , real_T * ovtdwwd1dn , real_T * c41ibpcltn
, real_T * mxkxrtj1ce , real_T * hnc3jtlmqc , real_T * cxub3fha1r , real_T
b2bawpqkdg [ 3 ] , real_T l0oh1v00tg [ 2 ] , real_T fvrrayoptg [ 2 ] , real_T
hnahwjzsa0 [ 3 ] , real_T * icnuizkgs5 , real_T * imfkrdxtrb , nzedqmilb2 *
localB , jhzhbof20x * localDW , gactmdiaa1 * localX ) ; extern void
bh_DDR_component_modelTID1 ( nzedqmilb2 * localB ) ; extern void ojgv1fm03w (
j2huxwjt4d * const hobuwbvixl ) ;
#endif

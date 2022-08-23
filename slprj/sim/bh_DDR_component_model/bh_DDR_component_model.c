#include "bh_DDR_component_model_capi.h"
#include "bh_DDR_component_model.h"
#include "bh_DDR_component_model_private.h"
static RegMdlInfo rtMdlInfo_bh_DDR_component_model [ 56 ] = { { "ekeuq13di1j"
, MDL_INFO_NAME_MDLREF_DWORK , 0 , - 1 , ( void * ) "bh_DDR_component_model"
} , { "h254f0yzhe" , MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "jbw2akcjvw" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "dr5tz5j5hf" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "kl5piisb2c" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "a51gcomsgb" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "p2tzx000jt" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "gactmdiaa1" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "kkdbez01t3" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "ks2b0w3f42" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "ea31nip2xz" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "bzi1oda3fa" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "jhzhbof20x" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "nzedqmilb2" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "oygrmroebj" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "ojgv1fm03w" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "gcmm02urtz" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "mwygpsusay" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "kviuoi4m5n" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "dljfqprwl0" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "lllyhlm0sr" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "ivevcnx1h3" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "erydabnrep" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "inmi3y1gkk" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "fwezjswjys" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "bh_DDR_component_model" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , 0 , ( NULL ) } , { "dqekhbeqfy" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "fbsae5kyyl" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "j2huxwjt4d" ,
MDL_INFO_ID_GLOBAL_RTW_CONSTRUCT , 0 , - 1 , ( void * )
"bh_DDR_component_model" } , { "BUS_DDR_state" , MDL_INFO_ID_DATA_TYPE , 0 ,
- 1 , ( NULL ) } , { "BUS_veh_F" , MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL )
} , { "BUS_veh_FG" , MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , {
"BUS_veh_Fb" , MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , { "BUS_wheel" ,
MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , { "BUS_wheel_force" ,
MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , { "BUS_wheel_acc" ,
MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , { "BUS_wheel_vel" ,
MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , { "BUS_G_frame" ,
MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , { "BUS_B_frame" ,
MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL ) } , {
"struct_KgyuWirBFPgZYO8JXc0O3B" , MDL_INFO_ID_DATA_TYPE , 0 , - 1 , ( NULL )
} , { "struct_s4VvLCBdSIwVEbafGrQ0zF" , MDL_INFO_ID_DATA_TYPE , 0 , - 1 , (
NULL ) } , { "struct_sOj469SnoQkToRTbCInVGH" , MDL_INFO_ID_DATA_TYPE , 0 , -
1 , ( NULL ) } , { "mr_bh_DDR_component_model_GetSimStateDisallowedBlocks" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_extractBitFieldFromCellArrayWithOffset" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_cacheBitFieldToCellArrayWithOffset" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_restoreDataFromMxArrayWithOffset" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_cacheDataToMxArrayWithOffset" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_extractBitFieldFromMxArray" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_cacheBitFieldToMxArray" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_restoreDataFromMxArray" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_cacheDataAsMxArray" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_RegisterSimStateChecksum" ,
MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" }
, { "mr_bh_DDR_component_model_SetDWork" , MDL_INFO_ID_MODEL_FCN_NAME , 0 , -
1 , ( void * ) "bh_DDR_component_model" } , {
"mr_bh_DDR_component_model_GetDWork" , MDL_INFO_ID_MODEL_FCN_NAME , 0 , - 1 ,
( void * ) "bh_DDR_component_model" } , { "bh_DDR_component_model.h" ,
MDL_INFO_MODEL_FILENAME , 0 , - 1 , ( NULL ) } , { "bh_DDR_component_model.c"
, MDL_INFO_MODEL_FILENAME , 0 , - 1 , ( void * ) "bh_DDR_component_model" } }
; kyvdc2iekoi kyvdc2ieko = { 0.0 , 1.0 , 1.0 , 1.0 , 1.0 , 1.0 ,
0.017453292519943295 , 0.017453292519943295 , - 1.0 , - 1.0 } ; void
ivevcnx1h3 ( j2huxwjt4d * const hobuwbvixl , jhzhbof20x * localDW ,
gactmdiaa1 * localX ) { boolean_T tmp ; localDW -> gvetprdmne = 1 ; if (
rtmIsFirstInitCond ( hobuwbvixl ) ) { localX -> lbnyjhpnvx [ 0 ] = 0.0 ;
localX -> lbnyjhpnvx [ 1 ] = 0.0 ; tmp = slIsRapidAcceleratorSimulating ( ) ;
if ( tmp ) { tmp = ssGetGlobalInitialStatesAvailable ( hobuwbvixl ->
_mdlRefSfcnS ) ; localDW -> gvetprdmne = ! tmp ; } else { localDW ->
gvetprdmne = 1 ; } localX -> amvvfqs5o4 = 0.0 ; } localDW -> cli0y3u5lp = 1 ;
if ( rtmIsFirstInitCond ( hobuwbvixl ) ) { tmp =
slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp =
ssGetGlobalInitialStatesAvailable ( hobuwbvixl -> _mdlRefSfcnS ) ; localDW ->
cli0y3u5lp = ! tmp ; } else { localDW -> cli0y3u5lp = 1 ; } localX ->
d5p4oduw10 = 0.0 ; } localDW -> hlrxlsd5sz = 1 ; if ( rtmIsFirstInitCond (
hobuwbvixl ) ) { tmp = slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp
= ssGetGlobalInitialStatesAvailable ( hobuwbvixl -> _mdlRefSfcnS ) ; localDW
-> hlrxlsd5sz = ! tmp ; } else { localDW -> hlrxlsd5sz = 1 ; } localX ->
n0f5vnujvs = 0.0 ; } localDW -> pu0300myw3 = 1 ; if ( rtmIsFirstInitCond (
hobuwbvixl ) ) { tmp = slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp
= ssGetGlobalInitialStatesAvailable ( hobuwbvixl -> _mdlRefSfcnS ) ; localDW
-> pu0300myw3 = ! tmp ; } else { localDW -> pu0300myw3 = 1 ; } } } void
lllyhlm0sr ( j2huxwjt4d * const hobuwbvixl , jhzhbof20x * localDW ,
gactmdiaa1 * localX ) { boolean_T tmp ; localDW -> gvetprdmne = 1 ; if (
rtmIsFirstInitCond ( hobuwbvixl ) ) { localX -> lbnyjhpnvx [ 0 ] = 0.0 ;
localX -> lbnyjhpnvx [ 1 ] = 0.0 ; tmp = slIsRapidAcceleratorSimulating ( ) ;
if ( tmp ) { tmp = ssGetGlobalInitialStatesAvailable ( hobuwbvixl ->
_mdlRefSfcnS ) ; localDW -> gvetprdmne = ! tmp ; } else { localDW ->
gvetprdmne = 1 ; } localX -> amvvfqs5o4 = 0.0 ; } localDW -> cli0y3u5lp = 1 ;
if ( rtmIsFirstInitCond ( hobuwbvixl ) ) { tmp =
slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp =
ssGetGlobalInitialStatesAvailable ( hobuwbvixl -> _mdlRefSfcnS ) ; localDW ->
cli0y3u5lp = ! tmp ; } else { localDW -> cli0y3u5lp = 1 ; } localX ->
d5p4oduw10 = 0.0 ; } localDW -> hlrxlsd5sz = 1 ; if ( rtmIsFirstInitCond (
hobuwbvixl ) ) { tmp = slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp
= ssGetGlobalInitialStatesAvailable ( hobuwbvixl -> _mdlRefSfcnS ) ; localDW
-> hlrxlsd5sz = ! tmp ; } else { localDW -> hlrxlsd5sz = 1 ; } localX ->
n0f5vnujvs = 0.0 ; } localDW -> pu0300myw3 = 1 ; if ( rtmIsFirstInitCond (
hobuwbvixl ) ) { tmp = slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp
= ssGetGlobalInitialStatesAvailable ( hobuwbvixl -> _mdlRefSfcnS ) ; localDW
-> pu0300myw3 = ! tmp ; } else { localDW -> pu0300myw3 = 1 ; } } } void
inmi3y1gkk ( nzedqmilb2 * localB ) { localB -> jmwbohukhp [ 0 ] = rtP_veh .
states . init_pos_G_Cxy [ 0 ] ; localB -> jmwbohukhp [ 1 ] = rtP_veh . states
. init_pos_G_Cxy [ 1 ] ; localB -> ht4canyxjr = rtP_veh . states .
init_vel_B_Cx ; } void bh_DDR_component_model ( j2huxwjt4d * const hobuwbvixl
, const real_T * i5ntoahcdk , const real_T * nvje5zq2o1 , real_T * m1i4qmwhzl
, real_T * fstmgkf35t , real_T * h3vjgejhf4 , real_T e4uvcdk54s [ 2 ] ,
real_T ccwhyw3z5n [ 2 ] , real_T j2wj3a1r4n [ 2 ] , real_T bped04z5az [ 2 ] ,
real_T cggdc1bpaw [ 2 ] , real_T * gaqlt05bjk , real_T * mtwsk1yeax , real_T
* gp4bu05qnz , real_T * bqonsvzrgk , real_T * ghn2nxly15 , real_T *
kesth4x2ap , real_T * czk4kp0oz4 , real_T * hhezpj2fwm , real_T * klb3dtnhre
, real_T * emokchsxwx , real_T * ob2lnwtug2 , real_T * ovtdwwd1dn , real_T *
c41ibpcltn , real_T * mxkxrtj1ce , real_T * hnc3jtlmqc , real_T * cxub3fha1r
, real_T b2bawpqkdg [ 3 ] , real_T l0oh1v00tg [ 2 ] , real_T fvrrayoptg [ 2 ]
, real_T hnahwjzsa0 [ 3 ] , real_T * icnuizkgs5 , real_T * imfkrdxtrb ,
nzedqmilb2 * localB , jhzhbof20x * localDW , gactmdiaa1 * localX ) { real_T
bvlrfsyipf ; real_T jflkzltl1j ; real_T ma0xi25ait_tmp ; real_T
ma0xi25ait_tmp_b ; real_T ma0xi25ait_tmp_c ; real_T ma0xi25ait_tmp_e ; real_T
ma0xi25ait_tmp_f ; real_T ma0xi25ait_tmp_g ; real_T ma0xi25ait_tmp_i ; real_T
ma0xi25ait_tmp_j ; real_T ma0xi25ait_tmp_k ; real_T ma0xi25ait_tmp_l ; real_T
ma0xi25ait_tmp_m ; real_T ma0xi25ait_tmp_n ; real_T ma0xi25ait_tmp_p ; real_T
ma0xi25ait_tmp_tmp ; real_T ma0xi25ait_tmp_tmp_e ; real_T
ma0xi25ait_tmp_tmp_i ; real_T ma0xi25ait_tmp_tmp_p ; real_T n1ptaqr2cm ;
real_T t2 ; real_T t27 ; real_T t27_tmp ; real_T t27_tmp_e ; real_T t27_tmp_i
; real_T t27_tmp_m ; real_T t27_tmp_p ; real_T t27_tmp_tmp ; real_T t3 ;
real_T t4 ; real_T t5 ; real_T t6 ; real_T t7 ; if ( rtmIsMajorTimeStep (
hobuwbvixl ) ) { if ( localDW -> gvetprdmne != 0 ) { localX -> lbnyjhpnvx [ 0
] = localB -> jmwbohukhp [ 0 ] ; localX -> lbnyjhpnvx [ 1 ] = localB ->
jmwbohukhp [ 1 ] ; } j2wj3a1r4n [ 0 ] = localX -> lbnyjhpnvx [ 0 ] ;
j2wj3a1r4n [ 1 ] = localX -> lbnyjhpnvx [ 1 ] ; if ( localDW -> cli0y3u5lp !=
0 ) { localX -> amvvfqs5o4 = localB -> db1e0tgf4x ; } jflkzltl1j = localX ->
amvvfqs5o4 ; if ( localDW -> hlrxlsd5sz != 0 ) { localX -> d5p4oduw10 =
localB -> ht4canyxjr ; } bvlrfsyipf = localX -> d5p4oduw10 ; if ( localDW ->
pu0300myw3 != 0 ) { localX -> n0f5vnujvs = localB -> exovt42qxt ; } localB ->
bqrtpkxeqm = localX -> n0f5vnujvs ; } else { j2wj3a1r4n [ 0 ] = localX ->
lbnyjhpnvx [ 0 ] ; j2wj3a1r4n [ 1 ] = localX -> lbnyjhpnvx [ 1 ] ; jflkzltl1j
= localX -> amvvfqs5o4 ; bvlrfsyipf = localX -> d5p4oduw10 ; localB ->
bqrtpkxeqm = localX -> n0f5vnujvs ; } b2bawpqkdg [ 0 ] = j2wj3a1r4n [ 0 ] ;
b2bawpqkdg [ 1 ] = j2wj3a1r4n [ 1 ] ; b2bawpqkdg [ 2 ] = jflkzltl1j ;
n1ptaqr2cm = localB -> bqrtpkxeqm * localB -> h5hetjludb ; e4uvcdk54s [ 0 ] =
bvlrfsyipf ; e4uvcdk54s [ 1 ] = n1ptaqr2cm ; t2 = rtP_veh . wheel . r *
rtP_veh . wheel . r ; t3 = t2 * t2 ; t4 = rtP_veh . L_half_axle * rtP_veh .
L_half_axle ; t5 = kyvdc2ieko . P_1 * kyvdc2ieko . P_1 ; t6 = rtP_veh . mass
* rtP_veh . mass ; t7 = localB -> bqrtpkxeqm * localB -> bqrtpkxeqm ; t27 =
rtP_veh . wheel . I * rtP_veh . Inertia * t2 ; t27_tmp = rtP_veh . Inertia *
rtP_veh . wheel . mass * t3 ; t27_tmp_tmp = rtP_veh . wheel . I * rtP_veh .
mass * t2 ; t27_tmp_p = t27_tmp_tmp * t4 ; t27_tmp_e = rtP_veh . wheel . I *
rtP_veh . wheel . mass * t2 * t4 * 4.0 ; t27_tmp_i = t27_tmp_tmp * t5 ;
t27_tmp_tmp = rtP_veh . mass * rtP_veh . wheel . mass * t3 ; t27_tmp_m =
t27_tmp_tmp * t4 ; t27_tmp_tmp *= t5 ; t27 = 1.0 / ( ( ( ( ( ( ( ( ( ( ( ( (
( ( ( ( rtP_veh . wheel . I * rtP_veh . wheel . I * t4 * 4.0 + t3 * t5 * t6 )
+ t27 ) + t27 ) + rtP_veh . Inertia * rtP_veh . mass * t3 ) + t27_tmp ) +
t27_tmp ) + t27_tmp_p ) + t27_tmp_p ) + t27_tmp_e ) + t27_tmp_e ) + t27_tmp_i
) + t27_tmp_i ) + t27_tmp_m ) + t27_tmp_m ) + rtP_veh . wheel . mass *
rtP_veh . wheel . mass * t3 * t4 * 4.0 ) + t27_tmp_tmp ) + t27_tmp_tmp ) ;
t27_tmp = rtP_veh . wheel . I * rtP_veh . L_half_axle ; ma0xi25ait_tmp =
rtP_veh . Inertia * rtP_veh . L_half_axle ; ma0xi25ait_tmp_tmp_e = rtP_veh .
wheel . I * kyvdc2ieko . P_1 * rtP_veh . mass * t2 ; ma0xi25ait_tmp_p =
ma0xi25ait_tmp_tmp_e * t4 * t7 ; t27_tmp_p = rtP_veh . L_half_axle * rtP_veh
. wheel . bL ; t27_tmp_e = rtP_veh . L_half_axle * rtP_veh . wheel . bR ;
ma0xi25ait_tmp_tmp_i = kyvdc2ieko . P_1 * rtP_veh . mass * rtP_veh . wheel .
mass * t3 ; ma0xi25ait_tmp_e = ma0xi25ait_tmp_tmp_i * t4 * t7 ;
ma0xi25ait_tmp_tmp = t27_tmp * kyvdc2ieko . P_1 * rtP_veh . mass * t2 ;
ma0xi25ait_tmp_i = ma0xi25ait_tmp_tmp * localB -> bqrtpkxeqm * bvlrfsyipf ;
ma0xi25ait_tmp_tmp_p = rtP_veh . L_half_axle * kyvdc2ieko . P_1 * rtP_veh .
mass * rtP_veh . wheel . mass * t3 ; ma0xi25ait_tmp_m = ma0xi25ait_tmp_tmp_p
* localB -> bqrtpkxeqm * bvlrfsyipf ; t27_tmp_i = t27_tmp * rtP_veh . wheel .
bL ; t27_tmp_m = t27_tmp * rtP_veh . wheel . bR ; t27_tmp_tmp = rtP_veh .
wheel . I * rtP_veh . wheel . bL * t4 ; ma0xi25ait_tmp_g = rtP_veh . wheel .
I * rtP_veh . wheel . bR * t4 ; ma0xi25ait_tmp_j = t27_tmp_p * rtP_veh . mass
* t2 ; ma0xi25ait_tmp_f = t27_tmp_e * rtP_veh . mass * t2 ; t27_tmp_p =
t27_tmp_p * rtP_veh . wheel . mass * t2 ; t27_tmp_e = t27_tmp_e * rtP_veh .
wheel . mass * t2 ; ma0xi25ait_tmp_c = rtP_veh . wheel . bL * rtP_veh . mass
* t2 ; ma0xi25ait_tmp_k = rtP_veh . wheel . bR * rtP_veh . mass * t2 ;
ma0xi25ait_tmp_b = rtP_veh . wheel . bL * rtP_veh . wheel . mass * t2 * t4 ;
ma0xi25ait_tmp_n = rtP_veh . wheel . bR * rtP_veh . wheel . mass * t2 * t4 ;
ma0xi25ait_tmp_l = kyvdc2ieko . P_1 * t3 ; localB -> ma0xi25ait = ( ( ( ( ( (
( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( rtP_veh . wheel . I * *
i5ntoahcdk * rtP_veh . wheel . r * t4 * - 2.0 - rtP_veh . Inertia * *
i5ntoahcdk * rtP_veh . wheel . r * t2 ) - rtP_veh . wheel . I * * nvje5zq2o1
* rtP_veh . wheel . r * t4 * 2.0 ) - rtP_veh . Inertia * * nvje5zq2o1 *
rtP_veh . wheel . r * t2 ) + t27_tmp_tmp * bvlrfsyipf * 2.0 ) + rtP_veh .
Inertia * rtP_veh . wheel . bL * t2 * bvlrfsyipf ) + ma0xi25ait_tmp_g *
bvlrfsyipf * 2.0 ) + rtP_veh . Inertia * rtP_veh . wheel . bR * t2 *
bvlrfsyipf ) - t27_tmp_i * t4 * localB -> bqrtpkxeqm * 2.0 ) - ma0xi25ait_tmp
* rtP_veh . wheel . bL * t2 * localB -> bqrtpkxeqm ) + t27_tmp_m * t4 *
localB -> bqrtpkxeqm * 2.0 ) + ma0xi25ait_tmp * rtP_veh . wheel . bR * t2 *
localB -> bqrtpkxeqm ) + rtP_veh . Inertia * kyvdc2ieko . P_1 * rtP_veh .
mass * t3 * t7 ) - * i5ntoahcdk * rtP_veh . mass * rtP_veh . wheel . r * t2 *
t5 ) - * nvje5zq2o1 * rtP_veh . mass * rtP_veh . wheel . r * t2 * t5 ) - *
i5ntoahcdk * rtP_veh . wheel . mass * rtP_veh . wheel . r * t2 * t4 * 2.0 ) -
* nvje5zq2o1 * rtP_veh . wheel . mass * rtP_veh . wheel . r * t2 * t4 * 2.0 )
+ ma0xi25ait_tmp_c * t5 * bvlrfsyipf ) + ma0xi25ait_tmp_k * t5 * bvlrfsyipf )
+ ma0xi25ait_tmp_b * bvlrfsyipf * 2.0 ) + ma0xi25ait_tmp_n * bvlrfsyipf * 2.0
) + ma0xi25ait_tmp_l * t5 * t6 * t7 ) + ma0xi25ait_tmp_p ) + ma0xi25ait_tmp_p
) - ma0xi25ait_tmp_j * t5 * localB -> bqrtpkxeqm ) + ma0xi25ait_tmp_f * t5 *
localB -> bqrtpkxeqm ) - t27_tmp_p * t4 * localB -> bqrtpkxeqm * 2.0 ) +
t27_tmp_e * t4 * localB -> bqrtpkxeqm * 2.0 ) + ma0xi25ait_tmp_e ) +
ma0xi25ait_tmp_e ) - ma0xi25ait_tmp_i ) + ma0xi25ait_tmp_i ) -
ma0xi25ait_tmp_m ) + ma0xi25ait_tmp_m ) * - t27 ; t3 = rtP_veh . L_half_axle
* * i5ntoahcdk ; t5 = rtP_veh . L_half_axle * * nvje5zq2o1 ;
ma0xi25ait_tmp_tmp *= t7 ; t7 *= ma0xi25ait_tmp_tmp_p ; ma0xi25ait_tmp_tmp_e
= ma0xi25ait_tmp_tmp_e * localB -> bqrtpkxeqm * bvlrfsyipf ;
ma0xi25ait_tmp_tmp_i = ma0xi25ait_tmp_tmp_i * localB -> bqrtpkxeqm *
bvlrfsyipf ; localB -> cus04135ho = ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( (
( ( ( ( ( t27_tmp * * i5ntoahcdk * rtP_veh . wheel . r * 2.0 - t27_tmp * *
nvje5zq2o1 * rtP_veh . wheel . r * 2.0 ) - t27_tmp_i * bvlrfsyipf * 2.0 ) +
t27_tmp_m * bvlrfsyipf * 2.0 ) + t27_tmp_tmp * localB -> bqrtpkxeqm * 2.0 ) +
ma0xi25ait_tmp_g * localB -> bqrtpkxeqm * 2.0 ) + t3 * rtP_veh . mass *
rtP_veh . wheel . r * t2 ) - t5 * rtP_veh . mass * rtP_veh . wheel . r * t2 )
+ t3 * rtP_veh . wheel . mass * rtP_veh . wheel . r * t2 * 2.0 ) - t5 *
rtP_veh . wheel . mass * rtP_veh . wheel . r * t2 * 2.0 ) - ma0xi25ait_tmp_j
* bvlrfsyipf ) + ma0xi25ait_tmp_f * bvlrfsyipf ) - t27_tmp_p * bvlrfsyipf *
2.0 ) + t27_tmp_e * bvlrfsyipf * 2.0 ) + ma0xi25ait_tmp_c * t4 * localB ->
bqrtpkxeqm ) + ma0xi25ait_tmp_k * t4 * localB -> bqrtpkxeqm ) +
ma0xi25ait_tmp_b * localB -> bqrtpkxeqm * 2.0 ) + ma0xi25ait_tmp_n * localB
-> bqrtpkxeqm * 2.0 ) - ma0xi25ait_tmp_l * t6 * localB -> bqrtpkxeqm *
bvlrfsyipf ) + ma0xi25ait_tmp_tmp ) - ma0xi25ait_tmp_tmp ) + t7 ) - t7 ) -
ma0xi25ait_tmp_tmp_e ) - ma0xi25ait_tmp_tmp_e ) - ma0xi25ait_tmp_tmp_i ) -
ma0xi25ait_tmp_tmp_i ) * - t27 ; t3 = localB -> ma0xi25ait - n1ptaqr2cm *
localB -> bqrtpkxeqm ; t2 = localB -> bqrtpkxeqm * bvlrfsyipf + localB ->
cus04135ho * localB -> dlpo2pe5rr ; ccwhyw3z5n [ 0 ] = t3 ; ccwhyw3z5n [ 1 ]
= t2 ; * gaqlt05bjk = bvlrfsyipf - rtP_veh . L_half_axle * localB ->
bqrtpkxeqm ; * icnuizkgs5 = 1.0 / rtP_veh . wheel . r * * gaqlt05bjk ; *
gp4bu05qnz = * icnuizkgs5 ; * bqonsvzrgk = rtP_veh . L_half_axle * localB ->
bqrtpkxeqm + bvlrfsyipf ; * imfkrdxtrb = 1.0 / rtP_veh . wheel . r * *
bqonsvzrgk ; * kesth4x2ap = * imfkrdxtrb ; t4 = muDoubleScalarSin (
jflkzltl1j ) ; t5 = muDoubleScalarCos ( jflkzltl1j ) ; t6 = bvlrfsyipf ; *
czk4kp0oz4 = localB -> ma0xi25ait - rtP_veh . L_half_axle * localB ->
cus04135ho ; * klb3dtnhre = 1.0 / rtP_veh . wheel . r * * czk4kp0oz4 ;
bvlrfsyipf = ( ( * i5ntoahcdk - * icnuizkgs5 * rtP_veh . wheel . bL ) - *
klb3dtnhre * rtP_veh . wheel . I ) - * klb3dtnhre * localB -> hshgcm3oro ; *
c41ibpcltn = bvlrfsyipf / rtP_veh . wheel . r ; * emokchsxwx = rtP_veh .
L_half_axle * localB -> cus04135ho + localB -> ma0xi25ait ; * ovtdwwd1dn =
1.0 / rtP_veh . wheel . r * * emokchsxwx ; bvlrfsyipf = ( ( * nvje5zq2o1 - *
imfkrdxtrb * rtP_veh . wheel . bR ) - * ovtdwwd1dn * rtP_veh . wheel . I ) -
* ovtdwwd1dn * localB -> lhggxwrwhf ; * cxub3fha1r = bvlrfsyipf / rtP_veh .
wheel . r ; l0oh1v00tg [ 0 ] = kyvdc2ieko . P_2 * * c41ibpcltn + kyvdc2ieko .
P_3 * * cxub3fha1r ; l0oh1v00tg [ 1 ] = rtP_veh . mass * t2 ; * hnc3jtlmqc =
* ovtdwwd1dn * localB -> cviplrj0tr + * cxub3fha1r ; * mxkxrtj1ce = localB ->
bre5cnwes5 * * klb3dtnhre + * c41ibpcltn ; * mtwsk1yeax = 1.0 / rtP_veh .
wheel . r * * gaqlt05bjk ; * ghn2nxly15 = 1.0 / rtP_veh . wheel . r * *
bqonsvzrgk ; * hhezpj2fwm = 1.0 / rtP_veh . wheel . r * * czk4kp0oz4 ; *
ob2lnwtug2 = 1.0 / rtP_veh . wheel . r * * emokchsxwx ; * fstmgkf35t =
kyvdc2ieko . P_4 * localB -> bqrtpkxeqm ; * h3vjgejhf4 = kyvdc2ieko . P_5 *
localB -> cus04135ho ; * m1i4qmwhzl = kyvdc2ieko . P_6 * jflkzltl1j ;
bped04z5az [ 0 ] = 0.0 ; cggdc1bpaw [ 0 ] = 0.0 ; fvrrayoptg [ 0 ] = 0.0 ;
bped04z5az [ 0 ] += t5 * t6 ; cggdc1bpaw [ 0 ] += t5 * t3 ; fvrrayoptg [ 0 ]
+= t5 * l0oh1v00tg [ 0 ] ; bped04z5az [ 0 ] += - t4 * n1ptaqr2cm ; cggdc1bpaw
[ 0 ] += - t4 * t2 ; fvrrayoptg [ 0 ] += - t4 * l0oh1v00tg [ 1 ] ; hnahwjzsa0
[ 0 ] = j2wj3a1r4n [ 0 ] ; bped04z5az [ 1 ] = 0.0 ; cggdc1bpaw [ 1 ] = 0.0 ;
fvrrayoptg [ 1 ] = 0.0 ; bped04z5az [ 1 ] += t4 * t6 ; cggdc1bpaw [ 1 ] += t4
* t3 ; fvrrayoptg [ 1 ] += t4 * l0oh1v00tg [ 0 ] ; bped04z5az [ 1 ] += t5 *
n1ptaqr2cm ; cggdc1bpaw [ 1 ] += t5 * t2 ; fvrrayoptg [ 1 ] += t5 *
l0oh1v00tg [ 1 ] ; hnahwjzsa0 [ 1 ] = j2wj3a1r4n [ 1 ] ; hnahwjzsa0 [ 2 ] =
jflkzltl1j ; } void bh_DDR_component_modelTID1 ( nzedqmilb2 * localB ) {
real_T hshgcm3oro_tmp ; real_T hshgcm3oro_tmp_tmp ; localB -> jmwbohukhp [ 0
] = rtP_veh . states . init_pos_G_Cxy [ 0 ] ; localB -> jmwbohukhp [ 1 ] =
rtP_veh . states . init_pos_G_Cxy [ 1 ] ; localB -> exovt42qxt = kyvdc2ieko .
P_7 * rtP_veh . states . init_theta_vel_deg ; localB -> db1e0tgf4x =
kyvdc2ieko . P_8 * rtP_veh . states . init_theta_pos_deg ; hshgcm3oro_tmp_tmp
= rtP_veh . wheel . r * rtP_veh . wheel . mass ; hshgcm3oro_tmp =
hshgcm3oro_tmp_tmp * rtP_veh . wheel . r ; localB -> hshgcm3oro =
hshgcm3oro_tmp ; localB -> lhggxwrwhf = hshgcm3oro_tmp ; localB -> cviplrj0tr
= hshgcm3oro_tmp_tmp ; localB -> bre5cnwes5 = hshgcm3oro_tmp_tmp ; localB ->
ht4canyxjr = rtP_veh . states . init_vel_B_Cx ; localB -> h5hetjludb =
kyvdc2ieko . P_9 * kyvdc2ieko . P_1 ; localB -> dlpo2pe5rr = kyvdc2ieko .
P_10 * kyvdc2ieko . P_1 ; } void dljfqprwl0 ( jhzhbof20x * localDW ) {
localDW -> gvetprdmne = 0 ; localDW -> cli0y3u5lp = 0 ; localDW -> hlrxlsd5sz
= 0 ; localDW -> pu0300myw3 = 0 ; } void dljfqprwl0TID1 ( void ) { } void
kviuoi4m5n ( real_T bped04z5az [ 2 ] , nzedqmilb2 * localB , p2tzx000jt *
localXdot ) { localXdot -> lbnyjhpnvx [ 0 ] = bped04z5az [ 0 ] ; localXdot ->
lbnyjhpnvx [ 1 ] = bped04z5az [ 1 ] ; localXdot -> amvvfqs5o4 = localB ->
bqrtpkxeqm ; localXdot -> d5p4oduw10 = localB -> ma0xi25ait ; localXdot ->
n0f5vnujvs = localB -> cus04135ho ; } void ojgv1fm03w ( j2huxwjt4d * const
hobuwbvixl ) { if ( ! slIsRapidAcceleratorSimulating ( ) ) {
slmrRunPluginEvent ( hobuwbvixl -> _mdlRefSfcnS , "bh_DDR_component_model" ,
"SIMSTATUS_TERMINATING_MODELREF_ACCEL_EVENT" ) ; } } void erydabnrep (
SimStruct * _mdlRefSfcnS , int_T mdlref_TID0 , int_T mdlref_TID1 , j2huxwjt4d
* const hobuwbvixl , nzedqmilb2 * localB , jhzhbof20x * localDW , gactmdiaa1
* localX , void * sysRanPtr , int contextTid , rtwCAPI_ModelMappingInfo *
rt_ParentMMI , const char_T * rt_ChildPath , int_T rt_ChildMMIIdx , int_T
rt_CSTATEIdx ) { rt_InitInfAndNaN ( sizeof ( real_T ) ) ; ( void ) memset ( (
void * ) hobuwbvixl , 0 , sizeof ( j2huxwjt4d ) ) ; hobuwbvixl -> Timing .
mdlref_GlobalTID [ 0 ] = mdlref_TID0 ; hobuwbvixl -> Timing .
mdlref_GlobalTID [ 1 ] = mdlref_TID1 ; hobuwbvixl -> _mdlRefSfcnS = (
_mdlRefSfcnS ) ; if ( ! slIsRapidAcceleratorSimulating ( ) ) {
slmrRunPluginEvent ( hobuwbvixl -> _mdlRefSfcnS , "bh_DDR_component_model" ,
"START_OF_SIM_MODEL_MODELREF_ACCEL_EVENT" ) ; } { localB -> bqrtpkxeqm = 0.0
; localB -> jmwbohukhp [ 0 ] = 0.0 ; localB -> jmwbohukhp [ 1 ] = 0.0 ;
localB -> exovt42qxt = 0.0 ; localB -> db1e0tgf4x = 0.0 ; localB ->
hshgcm3oro = 0.0 ; localB -> lhggxwrwhf = 0.0 ; localB -> cviplrj0tr = 0.0 ;
localB -> bre5cnwes5 = 0.0 ; localB -> ht4canyxjr = 0.0 ; localB ->
h5hetjludb = 0.0 ; localB -> dlpo2pe5rr = 0.0 ; localB -> ma0xi25ait = 0.0 ;
localB -> cus04135ho = 0.0 ; } ( void ) memset ( ( void * ) localDW , 0 ,
sizeof ( jhzhbof20x ) ) ; bh_DDR_component_model_InitializeDataMapInfo (
hobuwbvixl , localDW , localX , sysRanPtr , contextTid ) ; if ( (
rt_ParentMMI != ( NULL ) ) && ( rt_ChildPath != ( NULL ) ) ) {
rtwCAPI_SetChildMMI ( * rt_ParentMMI , rt_ChildMMIIdx , & ( hobuwbvixl ->
DataMapInfo . mmi ) ) ; rtwCAPI_SetPath ( hobuwbvixl -> DataMapInfo . mmi ,
rt_ChildPath ) ; rtwCAPI_MMISetContStateStartIndex ( hobuwbvixl ->
DataMapInfo . mmi , rt_CSTATEIdx ) ; } } void
mr_bh_DDR_component_model_MdlInfoRegFcn ( SimStruct * mdlRefSfcnS , char_T *
modelName , int_T * retVal ) { * retVal = 0 ; { boolean_T regSubmodelsMdlinfo
= false ; ssGetRegSubmodelsMdlinfo ( mdlRefSfcnS , & regSubmodelsMdlinfo ) ;
if ( regSubmodelsMdlinfo ) { } } * retVal = 0 ; ssRegModelRefMdlInfo (
mdlRefSfcnS , modelName , rtMdlInfo_bh_DDR_component_model , 56 ) ; * retVal
= 1 ; } static void mr_bh_DDR_component_model_cacheDataAsMxArray ( mxArray *
destArray , mwIndex i , int j , const void * srcData , size_t numBytes ) ;
static void mr_bh_DDR_component_model_cacheDataAsMxArray ( mxArray *
destArray , mwIndex i , int j , const void * srcData , size_t numBytes ) {
mxArray * newArray = mxCreateUninitNumericMatrix ( ( size_t ) 1 , numBytes ,
mxUINT8_CLASS , mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( newArray ) , (
const uint8_T * ) srcData , numBytes ) ; mxSetFieldByNumber ( destArray , i ,
j , newArray ) ; } static void
mr_bh_DDR_component_model_restoreDataFromMxArray ( void * destData , const
mxArray * srcArray , mwIndex i , int j , size_t numBytes ) ; static void
mr_bh_DDR_component_model_restoreDataFromMxArray ( void * destData , const
mxArray * srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( (
uint8_T * ) destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber (
srcArray , i , j ) ) , numBytes ) ; } static void
mr_bh_DDR_component_model_cacheBitFieldToMxArray ( mxArray * destArray ,
mwIndex i , int j , uint_T bitVal ) ; static void
mr_bh_DDR_component_model_cacheBitFieldToMxArray ( mxArray * destArray ,
mwIndex i , int j , uint_T bitVal ) { mxSetFieldByNumber ( destArray , i , j
, mxCreateDoubleScalar ( ( double ) bitVal ) ) ; } static uint_T
mr_bh_DDR_component_model_extractBitFieldFromMxArray ( const mxArray *
srcArray , mwIndex i , int j , uint_T numBits ) ; static uint_T
mr_bh_DDR_component_model_extractBitFieldFromMxArray ( const mxArray *
srcArray , mwIndex i , int j , uint_T numBits ) { const uint_T varVal = (
uint_T ) mxGetScalar ( mxGetFieldByNumber ( srcArray , i , j ) ) ; return
varVal & ( ( 1u << numBits ) - 1u ) ; } static void
mr_bh_DDR_component_model_cacheDataToMxArrayWithOffset ( mxArray * destArray
, mwIndex i , int j , mwIndex offset , const void * srcData , size_t numBytes
) ; static void mr_bh_DDR_component_model_cacheDataToMxArrayWithOffset (
mxArray * destArray , mwIndex i , int j , mwIndex offset , const void *
srcData , size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_bh_DDR_component_model_restoreDataFromMxArrayWithOffset ( void *
destData , const mxArray * srcArray , mwIndex i , int j , mwIndex offset ,
size_t numBytes ) ; static void
mr_bh_DDR_component_model_restoreDataFromMxArrayWithOffset ( void * destData
, const mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t
numBytes ) { const uint8_T * varData = ( const uint8_T * ) mxGetData (
mxGetFieldByNumber ( srcArray , i , j ) ) ; memcpy ( ( uint8_T * ) destData ,
( const uint8_T * ) & varData [ offset * numBytes ] , numBytes ) ; } static
void mr_bh_DDR_component_model_cacheBitFieldToCellArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , uint_T fieldVal ) ; static
void mr_bh_DDR_component_model_cacheBitFieldToCellArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , uint_T fieldVal ) {
mxSetCell ( mxGetFieldByNumber ( destArray , i , j ) , offset ,
mxCreateDoubleScalar ( ( double ) fieldVal ) ) ; } static uint_T
mr_bh_DDR_component_model_extractBitFieldFromCellArrayWithOffset ( const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ;
static uint_T
mr_bh_DDR_component_model_extractBitFieldFromCellArrayWithOffset ( const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) {
const uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell (
mxGetFieldByNumber ( srcArray , i , j ) , offset ) ) ; return fieldVal & ( (
1u << numBits ) - 1u ) ; } mxArray * mr_bh_DDR_component_model_GetDWork (
const ekeuq13di1j * mdlrefDW ) { static const char * ssDWFieldNames [ 3 ] = {
"rtb" , "rtdw" , "NULL->rtzce" , } ; mxArray * ssDW = mxCreateStructMatrix (
1 , 1 , 3 , ssDWFieldNames ) ; mr_bh_DDR_component_model_cacheDataAsMxArray (
ssDW , 0 , 0 , ( const void * ) & ( mdlrefDW -> rtb ) , sizeof ( mdlrefDW ->
rtb ) ) ; { static const char * rtdwDataFieldNames [ 4 ] = {
"mdlrefDW->rtdw.gvetprdmne" , "mdlrefDW->rtdw.cli0y3u5lp" ,
"mdlrefDW->rtdw.hlrxlsd5sz" , "mdlrefDW->rtdw.pu0300myw3" , } ; mxArray *
rtdwData = mxCreateStructMatrix ( 1 , 1 , 4 , rtdwDataFieldNames ) ;
mr_bh_DDR_component_model_cacheDataAsMxArray ( rtdwData , 0 , 0 , ( const
void * ) & ( mdlrefDW -> rtdw . gvetprdmne ) , sizeof ( mdlrefDW -> rtdw .
gvetprdmne ) ) ; mr_bh_DDR_component_model_cacheDataAsMxArray ( rtdwData , 0
, 1 , ( const void * ) & ( mdlrefDW -> rtdw . cli0y3u5lp ) , sizeof (
mdlrefDW -> rtdw . cli0y3u5lp ) ) ;
mr_bh_DDR_component_model_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const
void * ) & ( mdlrefDW -> rtdw . hlrxlsd5sz ) , sizeof ( mdlrefDW -> rtdw .
hlrxlsd5sz ) ) ; mr_bh_DDR_component_model_cacheDataAsMxArray ( rtdwData , 0
, 3 , ( const void * ) & ( mdlrefDW -> rtdw . pu0300myw3 ) , sizeof (
mdlrefDW -> rtdw . pu0300myw3 ) ) ; mxSetFieldByNumber ( ssDW , 0 , 1 ,
rtdwData ) ; } ( void ) mdlrefDW ; return ssDW ; } void
mr_bh_DDR_component_model_SetDWork ( ekeuq13di1j * mdlrefDW , const mxArray *
ssDW ) { ( void ) ssDW ; ( void ) mdlrefDW ;
mr_bh_DDR_component_model_restoreDataFromMxArray ( ( void * ) & ( mdlrefDW ->
rtb ) , ssDW , 0 , 0 , sizeof ( mdlrefDW -> rtb ) ) ; { const mxArray *
rtdwData = mxGetFieldByNumber ( ssDW , 0 , 1 ) ;
mr_bh_DDR_component_model_restoreDataFromMxArray ( ( void * ) & ( mdlrefDW ->
rtdw . gvetprdmne ) , rtdwData , 0 , 0 , sizeof ( mdlrefDW -> rtdw .
gvetprdmne ) ) ; mr_bh_DDR_component_model_restoreDataFromMxArray ( ( void *
) & ( mdlrefDW -> rtdw . cli0y3u5lp ) , rtdwData , 0 , 1 , sizeof ( mdlrefDW
-> rtdw . cli0y3u5lp ) ) ; mr_bh_DDR_component_model_restoreDataFromMxArray (
( void * ) & ( mdlrefDW -> rtdw . hlrxlsd5sz ) , rtdwData , 0 , 2 , sizeof (
mdlrefDW -> rtdw . hlrxlsd5sz ) ) ;
mr_bh_DDR_component_model_restoreDataFromMxArray ( ( void * ) & ( mdlrefDW ->
rtdw . pu0300myw3 ) , rtdwData , 0 , 3 , sizeof ( mdlrefDW -> rtdw .
pu0300myw3 ) ) ; } } void mr_bh_DDR_component_model_RegisterSimStateChecksum
( SimStruct * S ) { const uint32_T chksum [ 4 ] = { 3561042974U , 3125026272U
, 2015319291U , 3757646252U , } ; slmrModelRefRegisterSimStateChecksum ( S ,
"bh_DDR_component_model" , & chksum [ 0 ] ) ; } mxArray *
mr_bh_DDR_component_model_GetSimStateDisallowedBlocks ( ) { return NULL ; }
#if defined(_MSC_VER)
#pragma warning(disable: 4505) //unreferenced local function has been removed
#endif

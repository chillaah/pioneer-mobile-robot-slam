#ifndef RTW_HEADER_bh_DDR_component_model_cap_host_h_
#define RTW_HEADER_bh_DDR_component_model_cap_host_h_
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap_simtarget.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
bh_DDR_component_model_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void bh_DDR_component_model_host_InitializeDataMapInfo (
bh_DDR_component_model_host_DataMapInfo_T * dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif

#ifndef RTW_HEADER_bh_DDR_component_model_types_h_
#define RTW_HEADER_bh_DDR_component_model_types_h_
#include "rtwtypes.h"
#include "model_reference_types.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#ifndef DEFINED_TYPEDEF_FOR_BUS_B_frame_
#define DEFINED_TYPEDEF_FOR_BUS_B_frame_
typedef struct { real_T vel_B_C [ 2 ] ; real_T acc_B_C [ 2 ] ; } BUS_B_frame
;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_G_frame_
#define DEFINED_TYPEDEF_FOR_BUS_G_frame_
typedef struct { real_T pos_G_C [ 2 ] ; real_T vel_G_C [ 2 ] ; real_T acc_G_C
[ 2 ] ; } BUS_G_frame ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_wheel_vel_
#define DEFINED_TYPEDEF_FOR_BUS_wheel_vel_
typedef struct { real_T vB_L_wheel ; real_T wL_wheel ; real_T psi_L_DOT ;
real_T vB_R_wheel ; real_T wR_wheel ; real_T psi_R_DOT ; } BUS_wheel_vel ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_wheel_acc_
#define DEFINED_TYPEDEF_FOR_BUS_wheel_acc_
typedef struct { real_T aB_L_wheel ; real_T alphaL_wheel ; real_T
psi_L_DOT_DOT ; real_T aB_R_wheel ; real_T alpha_R_wheel ; real_T
psi_R_DOT_DOT ; } BUS_wheel_acc ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_wheel_force_
#define DEFINED_TYPEDEF_FOR_BUS_wheel_force_
typedef struct { real_T HL ; real_T fsL ; real_T fsR ; real_T HR ; }
BUS_wheel_force ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_wheel_
#define DEFINED_TYPEDEF_FOR_BUS_wheel_
typedef struct { BUS_wheel_vel BUS_wheel_vel ; BUS_wheel_acc BUS_wheel_acc ;
BUS_wheel_force BUS_wheel_force ; } BUS_wheel ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_veh_Fb_
#define DEFINED_TYPEDEF_FOR_BUS_veh_Fb_
typedef struct { real_T FB [ 2 ] ; } BUS_veh_Fb ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_veh_FG_
#define DEFINED_TYPEDEF_FOR_BUS_veh_FG_
typedef struct { real_T FG [ 2 ] ; } BUS_veh_FG ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_veh_F_
#define DEFINED_TYPEDEF_FOR_BUS_veh_F_
typedef struct { BUS_veh_Fb BUS_veh_Fb ; BUS_veh_FG BUS_veh_FG ; } BUS_veh_F
;
#endif
#ifndef DEFINED_TYPEDEF_FOR_BUS_DDR_state_
#define DEFINED_TYPEDEF_FOR_BUS_DDR_state_
typedef struct { real_T theta ; real_T theta_dot ; real_T theta_dot_dot ;
BUS_B_frame BUS_B_frame ; BUS_G_frame BUS_G_frame ; BUS_wheel BUS_wheel ;
real_T pose [ 3 ] ; BUS_veh_F BUS_veh_F ; } BUS_DDR_state ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_sOj469SnoQkToRTbCInVGH_
#define DEFINED_TYPEDEF_FOR_struct_sOj469SnoQkToRTbCInVGH_
typedef struct { real_T init_vel_B_Cx ; real_T init_theta_pos_deg ; real_T
init_theta_vel_deg ; real_T init_pos_G_Cxy [ 2 ] ; real_T init_pose [ 3 ] ; }
struct_sOj469SnoQkToRTbCInVGH ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_s4VvLCBdSIwVEbafGrQ0zF_
#define DEFINED_TYPEDEF_FOR_struct_s4VvLCBdSIwVEbafGrQ0zF_
typedef struct { real_T r ; real_T mass ; real_T I ; real_T bR ; real_T bL ;
} struct_s4VvLCBdSIwVEbafGrQ0zF ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_KgyuWirBFPgZYO8JXc0O3B_
#define DEFINED_TYPEDEF_FOR_struct_KgyuWirBFPgZYO8JXc0O3B_
typedef struct { real_T L_full_axle ; real_T L_half_axle ; real_T d ; real_T
mass ; real_T Inertia ; struct_sOj469SnoQkToRTbCInVGH states ;
struct_s4VvLCBdSIwVEbafGrQ0zF wheel ; } struct_KgyuWirBFPgZYO8JXc0O3B ;
#endif
typedef struct kyvdc2iekoi_ kyvdc2iekoi ; typedef struct fbsae5kyyl
j2huxwjt4d ;
#endif

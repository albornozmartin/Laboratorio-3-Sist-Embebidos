#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_device_events.c mcc_generated_files/rtcc.c mcc_generated_files/pin_manager.c mcc_generated_files/interrupt_manager.c mcc_generated_files/system.c mcc_generated_files/tmr2.c mcc_generated_files/clock.c mcc_generated_files/mcc.c mcc_generated_files/exceptions.c main.c Platform/utils.c Platform/WS2812.c Framework/interfaz.c Framework/parpadeo.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Platform/utils.o ${OBJECTDIR}/Platform/WS2812.o ${OBJECTDIR}/Framework/interfaz.o ${OBJECTDIR}/Framework/parpadeo.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d ${OBJECTDIR}/mcc_generated_files/rtcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/tmr2.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/exceptions.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/Platform/utils.o.d ${OBJECTDIR}/Platform/WS2812.o.d ${OBJECTDIR}/Framework/interfaz.o.d ${OBJECTDIR}/Framework/parpadeo.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Platform/utils.o ${OBJECTDIR}/Platform/WS2812.o ${OBJECTDIR}/Framework/interfaz.o ${OBJECTDIR}/Framework/parpadeo.o

# Source Files
SOURCEFILES=mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_device_events.c mcc_generated_files/rtcc.c mcc_generated_files/pin_manager.c mcc_generated_files/interrupt_manager.c mcc_generated_files/system.c mcc_generated_files/tmr2.c mcc_generated_files/clock.c mcc_generated_files/mcc.c mcc_generated_files/exceptions.c main.c Platform/utils.c Platform/WS2812.c Framework/interfaz.c Framework/parpadeo.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MM0256GPM064
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/eb101e0bba96560bb06f3c7dfaaa1918d11cccb9 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/ea7ad8f8246fb86b8c08d9c4946d5eab0078e02d .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/82c8e978ec18f45a5497e3adb5041ac6fcee122 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/e482d743d2fdb6d952d48a756e6d4de280bcb2cc .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/default/6508448a3eaec362eaa8b3015f27e960adbbb9de .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/ee1e4d065272cba4d4981f82fcb1c6fc758a0755 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/24736746a71332196d4f2f5c3975e56edab8d2c3 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/760f76f5bb4980e57d0067407c4d1129731ce7b8 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/a616bb572c4aa03ba75051d06c99b726ec47d2f9 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr2.o mcc_generated_files/tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/2dfb3c113153c060e14232a1cf600058c5e5097d .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/147d89cf02b50690189601502a98f5c6fada325 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/4b342d3f87ee61a2033d9ee21f76b85453a39694 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/ad919b0cf379113391a1bc75f9ef74017f0d34ec .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Platform/utils.o: Platform/utils.c  .generated_files/flags/default/e27d6d31b6da32a06dedee13832b729ac0d3ea13 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Platform" 
	@${RM} ${OBJECTDIR}/Platform/utils.o.d 
	@${RM} ${OBJECTDIR}/Platform/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Platform/utils.o.d" -o ${OBJECTDIR}/Platform/utils.o Platform/utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Platform/WS2812.o: Platform/WS2812.c  .generated_files/flags/default/4f9f554469ee0334c390553e0e1987b6382ac862 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Platform" 
	@${RM} ${OBJECTDIR}/Platform/WS2812.o.d 
	@${RM} ${OBJECTDIR}/Platform/WS2812.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Platform/WS2812.o.d" -o ${OBJECTDIR}/Platform/WS2812.o Platform/WS2812.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Framework/interfaz.o: Framework/interfaz.c  .generated_files/flags/default/a3f181fdf1f6fa899ec25fe814131f505c947f61 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Framework" 
	@${RM} ${OBJECTDIR}/Framework/interfaz.o.d 
	@${RM} ${OBJECTDIR}/Framework/interfaz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Framework/interfaz.o.d" -o ${OBJECTDIR}/Framework/interfaz.o Framework/interfaz.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Framework/parpadeo.o: Framework/parpadeo.c  .generated_files/flags/default/6f44265c6ba1ae3be3b3c50437e40a675860c4a0 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Framework" 
	@${RM} ${OBJECTDIR}/Framework/parpadeo.o.d 
	@${RM} ${OBJECTDIR}/Framework/parpadeo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Framework/parpadeo.o.d" -o ${OBJECTDIR}/Framework/parpadeo.o Framework/parpadeo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/13b6d92e1098346838813b06a2ad66dc8e276cb6 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/5f08c9a1a9bb59da3deb29852c2a66b6d90d01a6 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/28a0998d03788af386c2670d7dffe8b8f9e8cba2 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/1d520086a1498696b720a82420dedf3a21deb95e .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/default/a782467e9001961168fb3a971c18bd03cb5866f0 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/dd888c375438d8ebdb74887839ca89a5c3f26642 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/32d704dc9d7005f7df01dd737b8213302c17f1c6 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/ee7540548e155c53e114c67c715b672d087344cd .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/a78a03ad4b7e9445008a208e5133e818ee6f7d7f .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr2.o mcc_generated_files/tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/1ef9f9f502a7d32a76087a0f5209a3eda159d923 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/74971ced8400da3ac19ebe6e1642b311086717ea .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/37f3402fb484976cfb72274b38eab394dad2e9ad .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/abd2874579c71ef461fbf2920b385ff4aed841f1 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Platform/utils.o: Platform/utils.c  .generated_files/flags/default/12b59f74059a90492f88a95aac3f085bf1494923 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Platform" 
	@${RM} ${OBJECTDIR}/Platform/utils.o.d 
	@${RM} ${OBJECTDIR}/Platform/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Platform/utils.o.d" -o ${OBJECTDIR}/Platform/utils.o Platform/utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Platform/WS2812.o: Platform/WS2812.c  .generated_files/flags/default/aecd47a674874969b97ee900af29b763eba3cdcf .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Platform" 
	@${RM} ${OBJECTDIR}/Platform/WS2812.o.d 
	@${RM} ${OBJECTDIR}/Platform/WS2812.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Platform/WS2812.o.d" -o ${OBJECTDIR}/Platform/WS2812.o Platform/WS2812.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Framework/interfaz.o: Framework/interfaz.c  .generated_files/flags/default/61f5b2677b65c058e25deeb201ce340b07bc8e81 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Framework" 
	@${RM} ${OBJECTDIR}/Framework/interfaz.o.d 
	@${RM} ${OBJECTDIR}/Framework/interfaz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Framework/interfaz.o.d" -o ${OBJECTDIR}/Framework/interfaz.o Framework/interfaz.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Framework/parpadeo.o: Framework/parpadeo.c  .generated_files/flags/default/a04ed5823459c2f57c3d55c0d16c98f3d0268e7d .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/Framework" 
	@${RM} ${OBJECTDIR}/Framework/parpadeo.o.d 
	@${RM} ${OBJECTDIR}/Framework/parpadeo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Framework/parpadeo.o.d" -o ${OBJECTDIR}/Framework/parpadeo.o Framework/parpadeo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC016FF -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=100,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=100,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/lab_3_ULTIMO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

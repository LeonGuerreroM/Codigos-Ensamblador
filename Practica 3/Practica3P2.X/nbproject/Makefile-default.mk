#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
SHELL=cmd.exe
# Adding MPLAB X bin directory to path
PATH:=C:/Program Files (x86)/Microchip/MPLABX/mplab_ide/mplab_ide/modules/../../bin/:$(PATH)
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/P3Parte2.o
POSSIBLE_DEPFILES=${OBJECTDIR}/P3Parte2.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/P3Parte2.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH="C:\Program Files (x86)\Java\jdk1.6.0_45\jre/bin/"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# MP_CC is not defined
# MP_BC is not defined
MP_AS="C:\Program Files (x86)\Microchip\MPLABX\mpasmx\mpasmx.exe"
MP_LD="C:\Program Files (x86)\Microchip\MPLABX\mpasmx\mplink.exe"
MP_AR="C:\Program Files (x86)\Microchip\MPLABX\mpasmx\mplib.exe"
DEP_GEN=${MP_JAVA_PATH}java -jar "C:/Program Files (x86)/Microchip/MPLABX/mplab_ide/mplab_ide/modules/../../bin/extractobjectdependencies.jar" 
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps
# MP_CC_DIR is not defined
# MP_BC_DIR is not defined
MP_AS_DIR="C:\Program Files (x86)\Microchip\MPLABX\mpasmx"
MP_LD_DIR="C:\Program Files (x86)\Microchip\MPLABX\mpasmx"
MP_AR_DIR="C:\Program Files (x86)\Microchip\MPLABX\mpasmx"
# MP_BC_DIR is not defined

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16f887
MP_LINKER_DEBUG_OPTION= -u_DEBUGCODESTART=0x1f00 -u_DEBUGCODELEN=0xff -u_DEBUGDATASTART=0x1e5 -u_DEBUGDATALEN=0xb
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/P3Parte2.o: P3Parte2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/P3Parte2.o.d 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/P3Parte2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PICKIT2=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/P3Parte2.lst\" -e\"${OBJECTDIR}/P3Parte2.err\" $(ASM_OPTIONS)   -o\"${OBJECTDIR}/P3Parte2.o\" P3Parte2.asm 
	@${DEP_GEN} -d ${OBJECTDIR}/P3Parte2.o 
	
else
${OBJECTDIR}/P3Parte2.o: P3Parte2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/P3Parte2.o.d 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/P3Parte2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/P3Parte2.lst\" -e\"${OBJECTDIR}/P3Parte2.err\" $(ASM_OPTIONS)   -o\"${OBJECTDIR}/P3Parte2.o\" P3Parte2.asm 
	@${DEP_GEN} -d ${OBJECTDIR}/P3Parte2.o 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1    -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PICKIT2=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w     -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/Practica3P2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES}     
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

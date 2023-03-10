###############################################################
#   Makefile for the Marvell download for MMP2/wukong/NEVO on linux platform. 
# 
# 
############################################################## 


#CC = arm_1103_le-g++ -static
#CC = mipsel-linux-uclibc-g++ -static
#CC = mipsel-openwrt-linux-g++ -static
#CC = arm-hisiv200-linux-gnueabi-g++ --static

#CC = ${CROSS}gcc #-static

CC= arm-linux-gnueabi-gcc -static

BASE:=$(shell pwd)
IFL_PATH = ./
IFL_INCLUDE_DIR = $(IFL_PATH)
IFL_LIBRARY_DIR = $(IFL_PATH)

TBBOBJS =	CommonFun.o\
		ParaDefine.o\
			WTPCOMMCLASS.o\
			BinFileWtp.o\
			WtptpDownloader.o\
			WtptpDownLoad.o\
			ConvetEdian.o\
			BulkDevNonDrv_Linux.o\
			kstring.o\
			FBFDownloader.o\

CCFLAGS += -O2 -D LINUX=1 -D WINDOWS=0 -D DEBUG_MODE=0 -D PRINTLOG=1 -std=gnu99

	LIBS =  -lpthread -lc -lgcc_eh



CCFLAGS += -D TRUSTED_BOOT=1 -I $(IFL_INCLUDE_DIR)
OUTPUT = fbfdownloader_arm7l


OBJS = $(TBBOBJS)

all: $(OBJS)
	$(CC) -g -o $(OUTPUT) $(OBJS) $(LIBS) -ldl
	-rm *.o

$(TBBOBJS): %.o: $(BASE)/%.c
	$(CC) -g $(CCFLAGS) -c $(BASE)/$*.c -o $(BASE)/$*.o 
	
.PHONY: clean
clean:
	-rm *.o $(OUTPUT)





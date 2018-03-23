# example Android Native Library makefile
# contributed by Gregory Junker <ggjunker@gmail.com>
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libwebsockets

LOCAL_CFLAGS := -DLWS_BUILTIN_GETIFADDRS -DLWS_WITH_HTTP2 -DLWS_OPENSSL_SUPPORT -DLWS_LIBRARY_VERSION= -DLWS_BUILD_HASH= -DLWS_MAX_SMP=1 \
	-DLWS_SSL_CLIENT_USE_OS_CA_CERTS -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\"

LWS_LIB_PATH := lib

LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(LWS_LIB_PATH) \
	$(LOCAL_PATH)/$(LWS_LIB_PATH)/ext \
	$(LOCAL_PATH)/$(LWS_LIB_PATH)/http2 \
	$(LOCAL_PATH)/$(LWS_LIB_PATH)/misc

LOCAL_SRC_FILES := ./$(LWS_LIB_PATH)/alloc.c \
	./$(LWS_LIB_PATH)/client/client.c \
	./$(LWS_LIB_PATH)/client/client-handshake.c \
	./$(LWS_LIB_PATH)/client/client-parser.c \
	./$(LWS_LIB_PATH)/client/ssl-client.c \
	./$(LWS_LIB_PATH)/ext/extension.c \
	./$(LWS_LIB_PATH)/ext/extension-permessage-deflate.c \
	./$(LWS_LIB_PATH)/http2/http2.c \
	./$(LWS_LIB_PATH)/http2/ssl-http2.c \
	./$(LWS_LIB_PATH)/http2/hpack.c \
	./$(LWS_LIB_PATH)/http2/minihuf.c \
	./$(LWS_LIB_PATH)/misc/sha-1.c \
	./$(LWS_LIB_PATH)/misc/getifaddrs.c \
	./$(LWS_LIB_PATH)/misc/base64-decode.c \
	./$(LWS_LIB_PATH)/server/daemonize.c \
	./$(LWS_LIB_PATH)/server/parsers.c \
	./$(LWS_LIB_PATH)/server/server.c \
	./$(LWS_LIB_PATH)/server/server-handshake.c \
	./$(LWS_LIB_PATH)/server/ssl-server.c \
	./$(LWS_LIB_PATH)/plat/lws-plat-unix.c \
	./$(LWS_LIB_PATH)/context.c \
	./$(LWS_LIB_PATH)/ssl.c \
	./$(LWS_LIB_PATH)/handshake.c \
	./$(LWS_LIB_PATH)/header.c \
	./$(LWS_LIB_PATH)/libwebsockets.c \
	./$(LWS_LIB_PATH)/minilex.c \
	./$(LWS_LIB_PATH)/output.c \
	./$(LWS_LIB_PATH)/pollfd.c \
	./$(LWS_LIB_PATH)/service.c

include $(BUILD_STATIC_LIBRARY)


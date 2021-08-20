export GO111MODULE=on

REMOTE_BUILD_DIR:=/home/isucon/isucari/webapp/go
LOCAL_BUILD_DIR:=webapp/go
BIN_NAME:=isucari

SSH_USER:=isucon

.PHONY: deploy-isuA
deploy-isuA:
	scp ./isuA/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuA:$(REMOTE_BUILD_DIR)

.PHONY: deploy-isuB
deploy-isuB:
	scp ./isuB/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuB:$(REMOTE_BUILD_DIR)

.PHONY: deploy-isuC
deploy-isuC:
	scp ./isuB/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuB:$(REMOTE_BUILD_DIR)


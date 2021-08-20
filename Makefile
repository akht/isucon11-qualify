export GO111MODULE=on

REMOTE_BUILD_DIR:=/home/isucon/isucari/webapp/go
LOCAL_BUILD_DIR:=webapp/go
BIN_NAME:=isucari

SSH_USER:=isucon

.PHONY: deploy-isuA
deploy-isuA:
	cd ./isuA/$(LOCAL_BUILD_DIR) && GOOS=linux GOARCH=amd64 go build -o $(BIN_NAME)
	scp ./isuA/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuA:$(REMOTE_BUILD_DIR)

.PHONY: deploy-isuB
deploy-isuB:
	cd ./isuB/$(LOCAL_BUILD_DIR) && GOOS=linux GOARCH=amd64 go build -o $(BIN_NAME)
	scp ./isuB/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuB:$(REMOTE_BUILD_DIR)

.PHONY: deploy-isuC
deploy-isuC:
	cd ./isuC/$(LOCAL_BUILD_DIR) && GOOS=linux GOARCH=amd64 go build -o $(BIN_NAME)
	scp ./isuC/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuC:$(REMOTE_BUILD_DIR)

.PHONY: deploy-app-all
deploy-app-all: deploy-isuA deploy-isuB deploy-isuC


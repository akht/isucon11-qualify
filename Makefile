export GO111MODULE=on

REMOTE_BUILD_DIR:=/home/isucon/isucari/webapp/go
LOCAL_BUILD_DIR:=webapp/go
SOURCE_NAME:=main.go
BIN_NAME:=isucari

SSH_USER:=isucon

.PHONY: deploy-code-isuA
deploy-code-isuA:
	scp ./isuA/$(LOCAL_BUILD_DIR)/$(SOURCE_NAME) $(SSH_USER)@isuA:$(REMOTE_BUILD_DIR)

.PHONY: deploy-bin-isuA
deploy-bin-isuA:
	cd ./isuA/$(LOCAL_BUILD_DIR) && GOOS=linux GOARCH=amd64 go build -o $(BIN_NAME)
	scp ./isuA/$(LOCAL_BUILD_DIR)/$(BIN_NAME) $(SSH_USER)@isuA:$(REMOTE_BUILD_DIR)


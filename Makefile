APP_NAME=Eject\ Backup
APP_PATH=$(APP_NAME).app/Contents
SCRIPT=eject-backup.sh
ICON=/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/EjectMediaIcon.icns

all:
	@mkdir -p $(APP_PATH)/{MacOS,Resources}
	@cp $(SCRIPT) $(APP_PATH)/MacOS/$(APP_NAME)
	@cp $(ICON) $(APP_PATH)/Resources/$(APP_NAME).icns
	@chmod +x $(APP_PATH)/MacOS/$(APP_NAME)
	@touch $(APP_NAME).app

clean:
	@rm -rf $(APP_NAME).app

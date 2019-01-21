# Live Options+ (https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=36005)
# Copyright 2019 Andrii Burkatskyi aka underr
# EULA - https://raw.githubusercontent.com/underr-ua/ocmod3-live-options-plus/master/EULA.txt

zip=$(shell basename `pwd`).ocmod.zip

eula=EULA.txt
readme=README.md
datetime=201901010000.00
src=src
bin=bin


all: checkg clean makedir timestamp makezip hideg

checkg:
	@if [ ! -f "hideg.pwd" ]; then hideg; fi

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(eula)"

hideg: hideg.pwd
	hideg "$(bin)/$(zip)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(bin)"/*.zip

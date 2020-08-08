#!/bin/bash -x
##	./bin/deploy/common/config.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Copy configs and secrets into /run/
## ===================================
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################
function prepare_configs()
{

	mkdir -pv	/run/configs/;
	cp -LrvT --remove-destination	run/configs/www/	/run/configs/www;
}

function prepare_secrets()
{

	mkdir -pv	/run/secrets/;
	cp -LrvT --remove-destination	run/secrets/www/	/run/secrets/www;
}


################################################################################
##	main								      ##
################################################################################
function main()
{

	prepare_configs;
	prepare_secrets;
}


################################################################################
##	run								      ##
################################################################################
argc=$#;
if [ ${argc} -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})";
	exit	${EX_USAGE};
fi

main;


################################################################################
##	end of file							      ##
################################################################################

#!/bin/bash -x
##	./bin/deploy/swarm/deploy.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Deploy stack
## ============
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;

source	etc/www/config.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################
function deploy_stack()
{
	local	compose_path="etc/docker/swarm/docker-compose.yaml"
	local	stack_name="${WWW_STACK_BASENAME}-${WWW_STABILITY}";

	docker stack deploy -c "${compose_path}" "${stack_name}"
}


################################################################################
##	main								      ##
################################################################################
function main()
{

	./bin/deploy/common/config.sh;
	deploy_stack;
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

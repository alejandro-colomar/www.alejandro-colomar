#!/bin/bash -x
##	./bin/version/branch.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Prepare a branch
## ================
##
##  - Update version number
##  - Update exposed port
##  - Update stack name
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;

source	etc/www/config.sh;
source	lib/www/version/port.sh;
source	lib/www/version/stability.sh;
source	lib/www/version/version.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################


################################################################################
##	main								      ##
################################################################################
function main()
{
	local	branch="$(git branch --show-current)";

	update_port		"${WWW_PORT_EXP}";
	update_stability	"exp";
	update_version		"${branch}";

	git commit -a -m "Branch: ${branch}";
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
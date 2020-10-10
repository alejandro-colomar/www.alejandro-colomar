################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Update version number
## =====================
##
################################################################################


################################################################################
##	source								      ##
################################################################################


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
function update_version()
{
	local	version="$1";

	sed "/alejandrocolomar\/www:/s/www:.*\"/www:${version}\"/"	\
		-i ./etc/docker/kubernetes/deploy.yaml;
	sed "/alejandrocolomar\/www:/s/www:.*\"/www:${version}\"/"	\
		-i ./etc/docker/swarm/compose.yaml;
	sed "/WWW_VERSION=/s/\".*\"\;/\"${version}\"\;/"		\
		-i ./etc/www/config.sh;
	sed "/Version:/s/ .*/ ${version}/"				\
		-i ./srv/www/index.html;
}


################################################################################
##	end of file							      ##
################################################################################

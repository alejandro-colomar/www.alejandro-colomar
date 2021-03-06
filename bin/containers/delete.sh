#!/bin/bash
set -Eeuo pipefail;
########################################################################
#      Copyright (C) 2020        Alejandro Colomar Andres
#      SPDX-License-Identifier:  GPL-2.0-only
########################################################################

. ~/.bash_aliases;

if [ $# -ne 1 ]; then
	echo >&2 "Usage:  ${BASH_SOURCE[0]} exp|rc|stable";
	exit ${EX_USAGE};
fi;
stability="$1";

. etc/www/config.sh;

stack="${WWW_PROJECT}-${stability}";
alx_stack_delete "${WWW_DK_ORCHESTRATOR}" "${stack}";

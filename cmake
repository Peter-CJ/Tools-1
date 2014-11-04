#!/bin/bash
#
# Wrapper around make, to colorize it's output and pipe through less.
# Jumps to the first gcc error that occurs during the build process.
#

#make $* 2>&1 | colormake.pl `stty size`
case "$@" in
	*menuconfig*|*firmware*|*sample*|doctor|release)
		make $@
		;;
	*)
		make $@ 2>&1 | colormake-vvtk.pl
		;;
esac


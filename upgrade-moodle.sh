#!/usr/bin/env bash
######################################################################
# upgrade-moodle.sh
# Upgrades an existing Moodle install.
######################################################################
# CHANGE LOG
######################################################################
# Date        Author   Comment
# 20 Aug 2022 akulcsar Initial release
######################################################################

# Get our bearings; learn about the environment.
export bin_path="$( readlink -f "${0}" )"
xdir="$( dirname "${bin_path}" )"
libdir="${xdir}/lib"

# Load option.bm in the script's directory.
if [ ! -d $xdir ]
then
    echo "Unable to locate executable directory ${xdir}; aborting."
    exit 1
fi
if [ ! -f ${xdir}/options.bm ]
then
    echo "Unable to locate ${xdir}/options.bm; aborting."
    exit 1
fi
. ${xdir}/options.bm

# Verify configuration
if [ -z "$web_dir" -o ! -d "${web_dir}" -o ! -L "${web_dir}/current" ]
then
    echo "Verify your 'options.bm' file."
    echo "Either web directory '$web_dir' does not exist"
    echo "  or it does not contain a symlink called 'current' that"
    echo "  points to the version of Moodle running on your web server."
    exit 1
fi

# Load bash modules in the lib directory.
for bm in $( ls "${libdir}"/*.bm ) ;
do
    if [ $DEBUG -eq 1 ]
    then
        echo "Loading module ${bm}."
    fi
    . "$bm"
done

split_version_string

# Print configuration variables.
if [ $DEBUG -eq 1 ]
then
    print_vars
fi

compare_moodle_versions
retval=$?
if [ $retval -gt 0 ]
then
    exit $retval
else
    upgrade_moodle
fi

echo "Moodle is ready at http://${ip_addr}"
cd "$cwd"
exit 0

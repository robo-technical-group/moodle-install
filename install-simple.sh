#!/usr/bin/env bash

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

retval=0
prep_debian
create_data_directories
retval=$?
if [ $retval -gt 0 ]
then
    exit $retval
fi

if [ $moodle_type == "moodle" ]
then
    get_moodle_src
    retval=$?
    if [ $retval -eq 0 ]
    then
        extract_moodle_src
        retval=$?
    fi
else
    get_iomad_src
    retval=$?
fi
if [ $retval -gt 0 ]
then
    cd "$cwd"
    exit $retval
fi

# Will only run when database server is localhost
create_db


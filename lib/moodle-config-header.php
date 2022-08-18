<?php
// Moodle configuration file
// Last modified: 18 December 2018
// Build Moodle configuration object
unset($CFG);
global $CFG;
$CFG = new stdClass();

// Common settings
$CFG->admin     = 'admin';
$CFG->directorypermissions = 02777;

// Override in site configuration if necessary
$CFG->wwwroot   = 'http://%%IPADDR%%';
$CFG->dataroot  = '%%MOODLEFILES%%';
$CFG->prefix    = 'mdl_';

// Insert database and site information from per-site settings

require_once(__DIR__ . '/lib/setup.php');

// Moodle configuration overrides for development
// Last modified: 26 August 2019
// Debug settings
@error_reporting(E_ALL | E_STRICT); // NOT FOR PRODUCTION SERVERS!
@ini_set('display_errors', '1');    // NOT FOR PRODUCTION SERVERS!
$CFG->debug = (E_ALL | E_STRICT);   // === DEBUG_DEVELOPER - NOT FOR PRODUCTION SERVERS!
$CFG->debugdisplay = 1;             // NOT FOR PRODUCTION SERVERS!
$CFG->debugstringids = 1; // Add strings=1 to url to get string ids.
$CFG->perfdebug = 15;
$CFG->debugpageinfo = 1;
$CFG->allowthemechangeonurl = 1;
// Disable e-mail
$CFG->noemailever = true;
// $CFG->smtphosts = 'localhost:1025';

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!

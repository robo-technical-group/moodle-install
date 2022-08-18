$CFG->dbtype    = 'mariadb';
$CFG->dblibrary = 'native';
$CFG->dbhost    = '%%DBHOST%%';
$CFG->dbname    = '%%DBNAME%%';
$CFG->dbuser    = '%%DBUSER%%';
$CFG->dbpass    = '%%DBPASS%%';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
);
// $CFG->upgradekey = 'Random String Here.';

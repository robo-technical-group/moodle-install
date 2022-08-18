$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbhost    = '%%DBHOST%%';
$CFG->dbname    = '%%DBNAME%%';
$CFG->dbuser    = '%%DBUSER%%';
$CFG->dbpass    = '%%DBPASS%%';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
);
// $CFG->upgradekey = 'Random string here.';

// Enable transfer to Azure Blob Storage
// $CFG->alternative_file_system_class = '\tool_objectfs\azure_file_system';

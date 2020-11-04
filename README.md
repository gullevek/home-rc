# home-rc
$HOME settings

dot-files: the actual . files
etc: git global config files

* vim
NOTE: uses airline, which is installed from package in debian and not via plugin

vim config + plugins used
- uses pathogen for bundle loading

Bundles installed are:
- nerdtree + nerdtree git hightlight plugin [subtree]
- undotree (static install)
- bufferline [subtree]
- fugitive git handling [subtree]
- git gutter, show git changes in the vim gutter [subtree]
- signature, show buffer names in gutter [subtree]

* psqlrc
basic command line settings and a list of helper queries

Helper Queries:
- tsize/rtsize/etsize: table + index size outputs
- trashindexes/trashindexesall: show unused indexes (all shows ALL of them)
- getindexes '<table>': show all indexes + usage for one table
- missingindexes: possible missing indexes (for foreign keys)
- percentindex: % of times index is used (with rows in table)
- running/runningidle: needs to be set for PostgreSQL version. Currently allowed old/9.6/10. shows all running queries
- missingpk: show missing primary key
- cachehit [not working]
- indexhit: index hits overall
- show_slow_queries: show queries that are slow on average of oaverall run queries
- shsp: show search path (schema)
- setsp '<schema>': set search path (schema)
- indexbloat: show bloated indexes (%, size, etc)
- indexusage: never used indexes + size (index/table)
- foreignkeycount: show foreign key connections to tables in numbers
- tablebloat: show table bloat in percent + size of table
- viewlockedqueries: show queries that are locked
- viewlocks: show current table/query locks
- vacuumneed: show if vacuum is needed
- tablebloatscan: more detailed bloat scan and show only truly bloated tables
- vacuumstatus: show status of current vacuum

* bash config
Basic PS1 settings, plus the use of bash git prompt interface

* screen
Screen config with hardline/split, etc settings. Also holds some additional line configs

* git + core etc
Files in etc/ are to be copied into the /etc folder and are core git configs with various aliases

<?php

$router->get('', 'PagesController@home');
$router->post('import-file', 'ImportController@import');
$router->post('export-file','ExportController@export');

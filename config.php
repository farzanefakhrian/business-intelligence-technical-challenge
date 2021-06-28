<?php

return [
  'database' => [
      'name' => 'test_schema',
      'username' => 'root',
      'password' => '',
      'connection' => 'mysql:host=localhost:3306',
      'options' => [
          PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
      ]
  ]
];
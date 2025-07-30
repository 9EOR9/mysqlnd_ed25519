<?php
    /*
    Default values are "localhost", "root",
    database "test" and empty password.
    Change the MARIADB_TEST environment values
    if you want to use another configuration
    */

    $host      = getenv("MARIADB_TEST_HOST")     ?: "localhost";
    $port      = getenv("MARIADB_TEST_PORT")     ?: 3306;
    $user      = getenv("MARIADB_TEST_USER")     ?: "root";
    $passwd    = getenv("MARIADB_TEST_PASSWD")   ?: NULL;
    $db        = getenv("MARIADB_TEST_DB")       ?: "test";
    $socket    = getenv("MARIADB_TEST_SOCKET")   ?: "/tmp/mysql.sock";
    if ($socket) {
        ini_set('mysqli.default_socket', $socket);
    }
?>

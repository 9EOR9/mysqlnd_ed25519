--TEST--
change_user using ed25519 plugin
--SKIPIF--
<?php
require_once("connect.inc");
if (!extension_loaded('mysqlnd_ed25519')) die('skip extension not loaded');
if (!extension_loaded('mysqli')) die('skip mysqli not loaded');
$mysqli = new mysqli($host, $user, $passwd, $db, $port, $socket);
if (!stripos($mysqli->server_info, "MariaDB"))
	die('skip not a MariaDB server')
?>
--EXTENSIONS--
mysqlnd mysqlnd_ed25519
--FILE--
<?php

require_once("connect.inc");
$mysqli = new mysqli($host, $user, $passwd, $db, $port, $socket);

/* Activate ed25519 on server */
$mysqli->query("INSTALL SONAME 'auth_ed25519'");

$mysqli->query("CREATE USER IF NOT EXISTS ed@$host IDENTIFIED via ed25519 USING PASSWORD('secret')");

$mysqli->change_user("ed", "secret", $db);

$result= $mysqli->query("SELECT CURRENT_USER()");

$row= $result->fetch_row();
print($row[0]);
?>
--EXPECTF--
ed@%s

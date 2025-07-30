/*
   +----------------------------------------------------------------------+
   | Copyright © The PHP Group and Contributors.                          |
   +----------------------------------------------------------------------+
   | This source file is subject to the Modified BSD License that is      |
   | bundled with this package in the file LICENSE, and is available      |
   | through the World Wide Web at <https://www.php.net/license/>.        |
   |                                                                      |
   | SPDX-License-Identifier: BSD-3-Clause                                |
   +----------------------------------------------------------------------+
   | Authors: Georg Richter <georg@mariadb.com>                           |
   +----------------------------------------------------------------------+
*/

#ifndef PHP_MARIADB_ED25519_PLUGIN_H
#define PHP_MARIADB_ED25519_PLUGIN_H

#define PHP_MARIADB_AUTH_PLUGIN_VERSION "0.0.2"

extern zend_module_entry mysqlnd_ed25519_plugin_module_entry;
#define phpext_mysqlnd_ed25519_plugin_ptr &mysqlnd_ed25519_plugin_module_entry

#endif

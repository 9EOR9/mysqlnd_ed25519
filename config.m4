PHP_ARG_ENABLE(mysqlnd_ed25519, whether to enable ed25519 authentication for mysqlnd, [ --enable-mysqlnd_ed25519 Enable MariaDB ed25519 authentication plugin for mysqlnd ])

if test "$PHP_MYSQLND_ED25519" != "no"; then
  PKG_PROG_PKG_CONFIG

  dnl Check for libsodium
  PKG_CHECK_MODULES([LIBSODIUM], [libsodium], [], [
    AC_MSG_ERROR([libsodium development files not found. Please install libsodium development files.])
  ])

  PHP_EVAL_INCLINE($LIBSODIUM_CFLAGS)
  PHP_EVAL_LIBLINE($LIBSODIUM_LIBS, MYSQLND_ED25519_SHARED_LIBADD)

  PHP_ADD_EXTENSION_DEP(mysqlnd_ed25519, mysqlnd, true)
  PHP_ADD_EXTENSION_DEP(mysqlnd_ed25519, sodium, true)
  PHP_REQUIRE_CXX()
  PHP_ADD_INCLUDE($MYSQLND_DIR/include)
  PHP_NEW_EXTENSION(mysqlnd_ed25519, php_mysqlnd_ed25519.c, $ext_shared)
  PHP_SUBST(MYSQLND_ED25519_SHARED_LIBADD)
fi

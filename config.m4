PHP_ARG_ENABLE(mysqlnd_ed25519, whether to enable ed25519 authentication for mysqlnd, [ --enable-mysqlnd_ed25519 Enable MariaDB ed25519 authentication plugin for mysqlnd ])

if test "$PHP_MYSQLND_ED25519" != "no"; then
  dnl Check for libsodium library
  AC_CHECK_HEADER(sodium.h, [have_sodium_h=yes], [have_sodium_h=no])
  AC_CHECK_LIB(sodium, sodium_init, [have_sodium_lib=yes], [have_sodium_lib=no])

  if test "$have_sodium_lib" = "no" || test "$have_sodium_h" = "no"; then
    AC_MSG_ERROR([libsodium library and headers not found. Please install libsodium development files.])
  fi

  PHP_ADD_LIBRARY(sodium, 1, MYSQLND_ED25519_SHARED_LIBADD)

  PHP_ADD_EXTENSION_DEP(mysqlnd_ed25519, mysqlnd, true)
  PHP_ADD_EXTENSION_DEP(mysqlnd_ed25519, sodium, true)
  PHP_REQUIRE_CXX()
  PHP_ADD_INCLUDE($MYSQLND_DIR/include)
  PHP_NEW_EXTENSION(mysqlnd_ed25519, php_mysqlnd_ed25519.c, $ext_shared)
  PHP_SUBST(MYSQLND_ED25519_SHARED_LIBADD)
fi

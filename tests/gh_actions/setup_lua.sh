#! /bin/bash

# A script for setting up environment for github-actions testing.
# Sets up Lua and Luarocks.
# LUA must be "lua5.1", "lua5.2", "5.3" or "luajit".
# luajit2.0 - master v2.0
# luajit2.1 - master v2.1

set -eufo pipefail

source $GITHUB_WORKSPACE/tests/gh_actions/platform.sh

LUA_HOME_DIR=$GITHUB_WORKSPACE/install/lua

LR_HOME_DIR=$GITHUB_WORKSPACE/install/luarocks

rm -rf $HOME/.lua
mkdir -p $HOME/.lua

LUAJIT="yes"

if [ "$PLATFORM" == "macosx" ]; then
  export MACOSX_DEPLOYMENT_TARGET=`sw_vers --productVersion`
fi

mkdir -p "$LUA_HOME_DIR"

if [ "$LUAJIT" == "yes" ]; then

  git clone https://luajit.org/git/luajit.git;

  cd luajit

  make && make install PREFIX="$LUA_HOME_DIR"

  ln -s $LUA_HOME_DIR/bin/luajit $HOME/.lua/luajit
  ln -s $LUA_HOME_DIR/bin/luajit $HOME/.lua/lua;

else

  if [ "$LUA" == "lua5.1" ]; then
    curl https://www.lua.org/ftp/lua-5.1.5.tar.gz | tar xz
    cd lua-5.1.5;
  elif [ "$LUA" == "lua5.2" ]; then
    curl https://www.lua.org/ftp/lua-5.2.4.tar.gz | tar xz
    cd lua-5.2.4;
  elif [ "$LUA" == "lua5.3" ]; then
    curl https://www.lua.org/ftp/lua-5.3.3.tar.gz | tar xz
    cd lua-5.3.3;
  elif [ "$LUA" == "lua5.4" ]; then
    curl https://www.lua.org/ftp/lua-5.4.7.tar.gz | tar xz
    cd lua-5.4.7;
  fi

  # Build Lua without backwards compatibility for testing
  perl -i -pe 's/-DLUA_COMPAT_(ALL|5_2)//' src/Makefile
  make $PLATFORM
  make INSTALL_TOP="$LUA_HOME_DIR" install;

  ln -s $LUA_HOME_DIR/bin/lua $HOME/.lua/lua
  ln -s $LUA_HOME_DIR/bin/luac $HOME/.lua/luac;

fi

cd $GITHUB_WORKSPACE

lua -v

LUAROCKS_BASE=luarocks-$LUAROCKS

curl --location http://luarocks.org/releases/$LUAROCKS_BASE.tar.gz | tar xz

cd $LUAROCKS_BASE

if [ "$LUA" == "luajit" ]; then
  ./configure --lua-version="5.1" --with-lua="$LUA_HOME_DIR" --prefix="$LR_HOME_DIR";
else
  ./configure --with-lua="$LUA_HOME_DIR" --prefix="$LR_HOME_DIR"
fi

make build && make install

ln -s $LR_HOME_DIR/bin/luarocks $HOME/.lua/luarocks

cd $GITHUB_WORKSPACE

luarocks --version
luarocks

rm -rf $LUAROCKS_BASE

if [ "$LUAJIT" == "yes" ]; then
  rm -rf $LUAJIT_BASE;
elif [ "$LUA" == "lua5.1" ]; then
  rm -rf lua-5.1.5;
elif [ "$LUA" == "lua5.2" ]; then
  rm -rf lua-5.2.4;
elif [ "$LUA" == "lua5.3" ]; then
  rm -rf lua-5.3.3;
fi

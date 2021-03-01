# Setup a xcommand to run scripts with php7.4, even if the default php is v8.x
# I use it on my macOS computers 
#
if [ -d /usr/local/Cellar/ ]
then
  PHP74=$(which /usr/local/Cellar/php@7.4/*/bin/php)

  alias php74="$PHP74"
  alias xphp74="XDEBUG_CONFIG=idekey=PHPSTORM $PHP74"
fi


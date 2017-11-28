#!/bin/bash
# ##########
#
# QWAT local test and upgrade  script
# 23.11.2017
# Sylvain Beorchia
# régis Haubourg
# ##########


# Default values

    SRID=21781
    CLEAN=0
    LOCALDIRGIVEN=1
    LOCALDIR=/home/regis/OSLANDIA/projets_locaux/QWAT/local_update_dir_test/
    TMPDIR=/tmp/qwat_dump
    VERSION=1.3.0

# todo
# add usage help and check getops arguments
# -c clean will clean comp and test databases at start
# -t "tmppath" will point to another temporary path for qwat_dump
# -d "localdirpath" will run a second update cycle using local customization delta files.

# todo: get version from a file tag in qwat sources (git tag forbidden) /system/"current_version" file should do.



# clean existing db




if [[CLEAN -eq 1 ]]; then
  echo " ----------------------------------------------"
  echo " - cleaning  Option --clean"
  echo " ----------------------------------------------"

  sleep 1s
   # TODO get dbname from service

   dropdb qwat_comp
   dropdb qwat_test
   createdb qwat_comp
   createdb qwat_test
fi


#initialize qwat db comparison db
echo " ----------------------------------------------"
echo " - Initializing qwat comparison db ------------"
echo " ----------------------------------------------"
sleep 1s
../init_qwat.sh -p qwat_comp -s $SRID -r

# add pum metadata to DB using current version
echo " ---------------------------------"
echo " --- PUM baseline on qwat_comp ---"
echo " ---------------------------------"
sleep 1s

pum baseline -p qwat_comp -t qwat_sys.info -d delta/ -b $VERSION


# checks delta files from 1.0 lead to the same version as current version, if yes upgrades
echo " ----------------------------------------------"
echo " - test and upgrade qwat core"
echo " ----------------------------------------------"
sleep 1s


pum test-and-upgrade -pp qwat_prod -pt qwat_test -pc qwat_comp -t qwat_sys.info -d delta/ -f $TMPDIR -i columns constraints views sequences indexes triggers functions rules

# applies local script to test

if [[ "$LOCALDIRGIVEN" -eq 1 ]]; then
  echo " ----------------------------------------------"
  echo " - upgrade qwat_comp with local directory  "
  echo " ----------------------------------------------"
  sleep 1s

  pum upgrade -p qwat_comp -t qwat_sys.info -d $LOCALDIR


  #   # display changes
  echo " ----------------------------------------------"
  echo " - check differences between prod and test + local delta "
  echo " ----------------------------------------------"
  sleep 1s

  pum check -p1 qwat_prod -p2 qwat_comp -i columns constraints views sequences indexes triggers functions rules

  # todo ASK user if he wants to apply changes
  echo " ----------------------------------------------"
  echo " -do the local upgrade  "
  echo " ----------------------------------------------"
  sleep 1s

  #   # applies local scripts to qwat_prod
  pum upgrade -p qwat_prod -t qwat_sys.info -d $LOCALDIR
  #
fi

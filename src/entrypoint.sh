#!/bin/sh

cd ${APP_HOME}
. venv/bin/activate
python emonhub/src/emonhub.py $@


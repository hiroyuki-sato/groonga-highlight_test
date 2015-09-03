#!/bin/sh

groonga --query-log-path log/groonga.log -s --protocol http database/data.db

all:
	groonga -n database/data.db < schema.txt
	ruby load.rb
 
clean:
	/bin/rm -rf database/*
	/bin/rm -rf log/*

slow:
	time groonga --query-log-path log/highlight.log database/data.db < groonga.txt

normal:
	time groonga --query-log-path log/no_highlight.log database/data.db < groonga2.txt



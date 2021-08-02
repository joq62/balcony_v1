all:
	rm -rf ebin/* priv;
	rm -rf src/*.beam *.beam  test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log catalog;
	mkdir priv;
	cp ../../web_example/priv/* priv;
#	interfaces
	erlc -I ../../interfaces -o ebin ../../interfaces/*.erl;
#	support
	erlc -I ../../interfaces -o ebin ../../support/src/*.erl;
#	cowboy
	cp ../../web_example/deps/cowboy/ebin/* ebin;
	cp ../../web_example/deps/cowlib/ebin/* ebin;
	cp ../../web_example/deps/ranch/ebin/* ebin;
#	application
	cp ../../web_example/src/*.app ebin;
	erlc -I ../../interfaces -o ebin ../../web_example/src/*.erl;
	erl -pa ebin -run balcony boot -sname balcony

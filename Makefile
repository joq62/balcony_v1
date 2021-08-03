all:
	rm -rf ebin/* priv;
	rm -rf src/*.beam *.beam  test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log catalog;
	mkdir priv;
	cp ../../balcony/priv/* priv;
#	interfaces
	erlc -I ../../interfaces -o ebin ../../interfaces/*.erl;
#	support
	erlc -I ../../interfaces -o ebin ../../support/src/*.erl;
#	cowboy
	cp ../../balcony/deps/cowboy/ebin/* ebin;
	cp ../../balcony/deps/cowlib/ebin/* ebin;
	cp ../../balcony/deps/ranch/ebin/* ebin;
#	application
	cp ../../balcony/src/*.app ebin;
	erlc -I ../../interfaces -o ebin ../../balcony/src/*.erl;
	erl -pa ebin -run balcony boot -sname balcony

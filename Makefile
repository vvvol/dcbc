CBC_PORT = c_src/cbc_port

compile: c_src
	./rebar compile

c_src:
	$(MAKE) -C c_src

deps:
	./rebar get-deps
	./rebar update-deps

test: compile
	$(MAKE) -C test

clean:
	$(MAKE) -C test clean
	$(MAKE) -C c_src clean
	./rebar clean
	rm -f erl_crash.dump *.log solution.sol

.PHONY: deps test clean compile c_src

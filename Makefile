REBAR = rebar
ERL ?= erl

.PHONY: deps

default: all

all: deps
	@$(REBAR) compile

deps:
	@$(REBAR) get-deps

clean:
	@$(REBAR) clean

distclean: clean
	@$(REBAR) delete-deps

test: all
	@$(REBAR) skip_deps=true eunit

fast:
	@$(REBAR) skip_deps=true compile

run:
	@$(ERL) -pa $(PWD)/../*/ebin

py:=3.7

all: run

bin/buildout:
	virtualenv -p python$(py) .
	bin/pip install -r requirements.txt

buildout.cfg:
	ln -fs base.cfg buildout.cfg

bin/instance: bin/buildout buildout.cfg
	bin/buildout -t 30

.PHONY: run
run: bin/instance
	bin/instance fg

.PHONY: cleanall
cleanall:
	rm -fr develop-eggs downloads eggs parts .installed.cfg lib include bin .mr.developer.cfg pip-selfcheck.json

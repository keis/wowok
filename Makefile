PYTHON=python2.7
VIRTUALENV=virtualenv -p ${PYTHON}
VIRTUAL=source env/bin/activate;
CONTENT=$(shell find content)
MEDIA=$(shell find media)
TEMPLATES=$(shell find templates)

.PHONY: serve

default: output

env/bin/activate: requirements.txt
	test -f env/bin/activate || ${VIRTUALENV} env
	${VIRTUAL} pip install -r requirements.txt
	touch $@

output: env/bin/activate ${CONTENT} ${MEDIA} ${TEMPLATES}
	${VIRTUAL} wok

serve: env/bin/activate
	${VIRTUAL} wok --server

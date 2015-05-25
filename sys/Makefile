PYTHON=python2.7
VIRTUALENV=virtualenv -p ${PYTHON}
VIRTUAL=source sys/env/bin/activate;
CONTENT=$(shell find content)
MEDIA=$(shell find sys/media)
TEMPLATES=$(shell find sys/templates)

.PHONY: serve clean

default: output

clean:
	rm -rf output

sys/env/bin/activate: sys/requirements.txt
	test -f $@ || ${VIRTUALENV} sys/env
	${VIRTUAL} pip install -r $<
	touch $@

output: sys/env/bin/activate ${CONTENT} ${MEDIA} ${TEMPLATES}
	${VIRTUAL} wok

serve: sys/env/bin/activate
	${VIRTUAL} wok --server

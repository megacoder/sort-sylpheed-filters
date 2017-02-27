TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	sort-sylpheed-filters.zsh sort-sylpheed-filters.xslt

${TARGETS}::

clobber distclean:: clean

check::	sort-sylpheed-filters.zsh sort-sylpheed-filters.xslt
	./sort-sylpheed-filters.zsh ${ARGS}

install:: sort-sylpheed-filters.zsh sort-sylpheed-filters.xslt
	${INSTALL} -D -m 0755 sort-sylpheed-filters.zsh  ${BINDIR}/sort-sylpheed-filters
	${INSTALL} -D -m 0644 sort-sylpheed-filters.xslt ${BINDIR}/sort-sylpheed-filters.xslt

uninstall::
	${RM} ${BINDIR}/sort-sylpheed-filters.{zsh,xslt}

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif

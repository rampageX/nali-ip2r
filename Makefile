include config.mak
all:nali2.c libip2region/ip2region.c
	gcc -O2 -static -s -o bin/ip2rnali nali2.c libip2region/ip2region.c
	cp share/nali2.sh bin/nali2
install:bin share
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(datadir)
	install bin/ip2rnali $(DESTDIR)$(bindir)
	install bin/nali2 $(DESTDIR)$(bindir)
	install bin/nali2-traceroute $(DESTDIR)$(bindir)
	install bin/nali2-tracepath $(DESTDIR)$(bindir)
	install bin/nali2-dig $(DESTDIR)$(bindir)
	install bin/nali2-nslookup $(DESTDIR)$(bindir)
	install bin/nali2-ping $(DESTDIR)$(bindir)
	install bin/nali2-mtr $(DESTDIR)$(bindir)
	install bin/nali2-update $(DESTDIR)$(bindir)
	install share/ip2region.db $(DESTDIR)$(datadir)
	install share/nali2.pl $(DESTDIR)$(datadir)
distclean: clean
	rm -f config.mak
	rm -f config.h
clean:
	rm -f bin/ip2rnali
	rm -f bin/nali2

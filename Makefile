TOKENIZE=petcat -w2  -l 1001

.PHONY: all
all: game.prg

.PHONY: run
run: game.prg
	xvic -autostart $<

%.bas: %.md
	awk 'BEGIN {f=0} {of = f} /^~~~~/ { f = !f; } {if(f && of) print}' < $<  | sort -n > $@
%.prg: %.bas
	$(TOKENIZE) -o $@ -- $<

.PHONY: all min clean

min-files = length.min.bf clip.min.bf concatenate.min.bf interleave.min.bf deinterleave.min.bf repeat.min.bf duplicate.min.bf swap.min.bf reverse.min.bf copy.min.bf equal.min.bf
min: $(min-files)

all: copy.bf equal.bf min

clean:
	rm copy.bf equal.bf $(min-files)

%.bf: %.in
	m4 str.m4 $^ >> $@

%.min.bf: %.bf
	echo "minclude($^)" | m4 str.m4 - >> $@

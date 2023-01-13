.PHONY: all min clean

min-files = length.min.bf clip.min.bf concatenate.min.bf interleave.min.bf deinterleave.min.bf repeat.min.bf duplicate.min.bf swap.min.bf reverse.min.bf copy.min.bf
min: $(min-files)

# copy.bf is the only derivative file so far
all: copy.bf min

clean:
	rm copy.bf $(min-files)

%.bf: %.in
	m4 str.m4 $^ >> $@

%.min.bf: %.bf
	echo "minclude($^)" | m4 str.m4 - >> $@

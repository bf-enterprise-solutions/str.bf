.PHONY: all min clean

min: length.min.bf clip.min.bf concatenate.min.bf deinterleave.min.bf duplicate.min.bf swap.min.bf reverse.min.bf copy.min.bf

# copy.bf is the only derivative file so far
all: copy.bf min

clean:
	rm copy.bf length.min.bf clip.min.bf concatenate.min.bf deinterleave.min.bf duplicate.min.bf swap.min.bf reverse.min.bf copy.min.bf

%.bf: %.in
	m4 str.m4 $^ >> $@

%.min.bf: %.bf
	echo "minclude($^)" | m4 str.m4 - >> $@

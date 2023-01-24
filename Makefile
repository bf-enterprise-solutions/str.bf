.PHONY: all min clean

rev-files = length.rev.bf clip.rev.bf concatenate.rev.bf interleave.rev.bf deinterleave.rev.bf repeat.rev.bf duplicate.rev.bf swap.rev.bf reverse.rev.bf copy.rev.bf equal.rev.bf
rev: $(rev-files)
min-files = length.min.bf clip.min.bf concatenate.min.bf interleave.min.bf deinterleave.min.bf repeat.min.bf duplicate.min.bf swap.min.bf reverse.min.bf copy.min.bf equal.min.bf   length.rev.min.bf clip.rev.min.bf concatenate.rev.min.bf interleave.rev.min.bf deinterleave.rev.min.bf repeat.rev.min.bf duplicate.rev.min.bf swap.rev.min.bf reverse.rev.min.bf copy.rev.min.bf equal.rev.min.bf
min: rev $(min-files)

all: copy.bf equal.bf min

clean:
	rm copy.bf equal.bf $(min-files) $(rev-files)

%.bf: %.in
	m4 str.m4 $^ >> $@

%.min.bf: %.bf
	echo "minclude($^)" | m4 str.m4 - >> $@

%.rev.bf: %.bf
	echo "revclude($^)" | m4 str.m4 - >> $@

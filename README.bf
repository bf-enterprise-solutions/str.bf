[STR.BF — THE STRING MANIPULATION LIBRARY FOR BRAINFUCK

 Given that Brainfuck is terribly low-level, one might encounter lots
 of difficulties trying to manipulate contiguous null-terminated chunks
 of cells (= strings/arrays, further simply strings) meaningfully and
 doing the operations on the level of (at least) C string.h
 library. str.bf tries to bridge this gap with familiar operations,
 like:
 - string copying,
 - concatenation,
 - comparison,
 - hashing,
 - length computation,
 and adding some Brainfuck-specific utilities, like
 - string (de)interleaving
 - duplication,
 - swapping,
 - reversal,
 - char repetition,
 - and string length clipping.

 The common features of all the algorithms in this library are:
 - They are optimized to be copy-paste-able in place, with the
 position of the cursor explicitly stated in their respective
 documentation below.
 - They grow memory to the right and are made to be usable on almost
 any Brainfuck implementation (even the one without tape and cell
 wrapping, unless stated otherwise).
 - They are exhaustively commented in the source code, with minified
 versions available through make script.
 - They are optimized to
 -- be easily embeddable and re-usable (to the point of some simpler
 ones being embedded into the more complex ones),
 -- take the least amount of cycles possible, and
 -- to be as short as possible command-wise.

 [1 GETTING STARTED

  Clone the code:
  [shell:
   git clone https://github.com/bf-enterprise-solutions/str.bf.git]
  And build str.bf:
  [shell:
   make all]

  Copy-paste it into your code and enjoy the seamless efficiency of
  the string algorithms in str.bf!]

 [2 STRING LENGTH (length.bf)

  Memory layout:
  [^0] [string...] [0]

  Measures the length of the string and terminates at this
  layout/result:
  [^0] [l] [0] [string...] [0]
  where l is the computed length of the string

  Moves the string two cells to the right to free the space for
  l. Make sure to free at least two cell on the right before using
  this algorithm, as it shifts the measured string to the right.]

 [3 STRING CLIPPING/SHORTENING (clip.bf)

  Memory layout:
  [^N] [0] [string..] [0]

  Clips the string to the length N, so that e.g.
  [^4] [0] [h] [e] [l] [l] [o] [0]
  becomes
  [^h] [e] [l] [l] [0]

  Moves the string two cells left and removes the N cell due to
  uselessness.

  - TODO: clip with start and end indices, not just end one.]

 [4 STRING CONCATENATION (concatenate.bf)

  Turns
  [^first string...] [0] [second string...] [0]
  into
  [^first string...] [second string...] [0]

  Just that, yes.

  - TODO: concatenate multiple strings.]

 [5 STRING INTERLEAVING (interleave.bf)

  Interleaving (in this context) means making two strings to move in
  parallel to each other in memory, exchanging the cells with the
  first one and the cells with the second one (empty if strings of
  uneven lengths). For instance, interleaving turns
  [0] [^A1] [A2] [A3] [0] [B1] [B2] [0]
  into
  [0] [^A1] [B1] [A2] [B2] [A3] [0]

  Requires value wrapping due to using 255 beacon cells.]

 [6 STRING DE-INTERLEAVING (deinterleave.bf)

  Deinterleaving (in this context) means the opposite of
  interleaving—splitting two sequences positioned in parallel to each
  other in memory (quite a frequent data layout in Brainfuck
  programs)—into two independent sequences. For instance,
  deinterleaving turns
  [0] [^A1] [B1] [A2] [B2] [A3] [0]
  into
  [0] [^A1] [A2] [A3] [0] [B1] [B2] [0]

  Should work fine with differing sequence lengths.]

 [7 CHARACTER REPETITION (repeat.bf)

  Memory layout:
  [^0] [N] [0] [C] [0]

  Creates a non-empty string of character C repeated N times. For example:
  [0] [^5] [0] [h] [0]
  becomes
  [0] [^h] [h] [h] [h] [h] [0]

  Uses N+1 cells (growing to the right) to generate the string of length N.]

 [8 STRING DUPLICATION (duplicate.bf)

  Memory layout:
  [^0] [string...] [0]

  BEWARE: Duplication (in this context) means creating a new string
  with every character duplicated, which means that strdup.bf turns
  this
  [0] [^A] [B] [C] [D] [E] [0]
  into
  [0] [^A] [A] [B] [B] [C] [C] [D] [D] [E] [E] [0]

  Requires at least 2N cells to duplicate the string, where N is the
  length of the string. Grows to the right.]

 [9 STRING SWAPPING (swap.bf)

  Swaps two strings adjacent to each other, so that
  [0] [^first string...] [0] [second string...] [0] [0]
  becomes
  [0] [^second string...] [0] [first string...] [0] [0]
  no matter the size of the strings.

  Uses
  - two cells to the right of the second string
  - and the zero cell preceding the first string, so it's mandatory
  (as all the other leading zeros in this repository memory layouts)
  for it to be empty.]

 [10 STRING REVERSAL (reverse.bf)

  Simply reverses the string, so that
  [0] [^h] [e] [l] [l] [o] [0]
  becomes
  [0] [^o] [l] [l] [e] [h] [0]

  Uses
  - N+2 cells, where N is the length of the string,
  - and the zero cell preceding the string, so it's mandatory for it to be empty.]

 [11 STRING COPYING (copy.bf)

  Memory layout:
  [0] [^string...] [0]

  Makes a copy of the string right after it. In other words
  [0] [^h] [e] [l] [l] [o] [0]
  ends up being
  [0] [^h] [e] [l] [l] [o] [0] [h] [e] [l] [l] [o] [0]

  Note that you have to invoke at least make copy.bf (or, at most,
  make all) to have copy.bf in the checkout. copy.bf is generated from
  duplicate.bf and deinterleave.bf via M4 macros.]

 [12 STRING COMPARISON (equal.bf)

  Memory layout:
  [0] [0] [^first string...] [0] [second string...] [0]
  compares the strings and ends up with
  [0] [0] [^equality flag] [0] [first string...] [0] [second string...] [0]
  where equality flag is either 1 (strings equal) or 0 (not equal).

  The biggest memory drain is a relatively spacious interleaving.bf,
  so once it's optimized equal.bf will take less memory too.]

 [12 STRING HASHING (hash.bf)

  Memory layout:
  [0] [^string...] [0] [0] [0]
  compares the strings and ends up with
  [0] [hash] [0]
  which means the string is destroyed. So one MUST copy.bf it if before
  hashing if they need to retain the contents.

  The computed hash is by no means cryptographic, but it's good enough
  for most string comparison purposes.

  You can alter the SALT in the source file before using the
  algorithm.]

 [TODO: CHAR SEARCH (char.bf)]
 [TODO: SUBSTRING SEARCH (search.bf)]]

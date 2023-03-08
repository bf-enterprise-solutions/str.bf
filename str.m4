changequote(~/,/~)dnl
define(~/minimize/~, ~/ifelse($#, ~/0/~, ~/~/$0/~/~, ~/translit(~/$@/~, ~/ -*/0-9:;=?@A-Z\\^-ab-z{-~
/~)/~)/~)dnl
define(~/minclude/~, ~/ifelse($#, ~/0/~, ~/~/$0/~/~, ~/minimize(include(~/$1/~))/~)/~)dnl
define(~/reverse/~, ~/ifelse($#, ~/0/~, ~/~/$0/~/~, ~/translit(~/$@/~, ~/ <> /~, ~/ >< /~)/~)/~)dnl
define(~/revclude/~, ~/ifelse($#, ~/0/~, ~/~/$0/~/~, ~/reverse(include(~/$1/~))/~)/~)dnl

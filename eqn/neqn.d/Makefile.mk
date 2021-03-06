VPATH=..
OBJ = diacrit.o e.o eqnbox.o font.o fromto.o funny.o glob.o integral.o \
	io.o lex.o lookup.o mark.o matrix.o move.o over.o paren.o pile.o \
	shift.o size.o sqrt.o text.o version.o

FLAGS = -I. -I.. -I../../include -DNEQN $(DEFINES)

.c.o:
	$(CC) $(_CFLAGS) $(FLAGS) -c $<

all: neqn

neqn: $(OBJ)
	$(CC) $(_CFLAGS) $(_LDFLAGS) $(OBJ) $(LIBS) -o neqn

e.c: e.y
	$(YACC) -d ../e.y
	sed -f ../yyval.sed <y.tab.c >$@

y.tab.h: e.c

install:
	$(INSTALL) -c neqn $(ROOT)$(BINDIR)/neqn
	$(STRIP) $(ROOT)$(BINDIR)/neqn
	rm -f $(ROOT)$(MANDIR)/man1/neqn.1
	ln -s eqn.1 $(ROOT)$(MANDIR)/man1/neqn.1

clean:
	rm -f $(OBJ) neqn e.c y.tab.* core log *~

mrproper: clean

diacrit.o: ../diacrit.c ../e.h y.tab.h
eqnbox.o: ../eqnbox.c ../e.h
font.o: ../font.c ../e.h
fromto.o: ../fromto.c ../e.h
funny.o: ../funny.c ../e.h y.tab.h
glob.o: ../glob.c ../e.h
integral.o: ../integral.c ../e.h y.tab.h
io.o: ../io.c ../e.h
lex.o: ../lex.c ../e.h y.tab.h
lookup.o: ../lookup.c ../e.h y.tab.h
mark.o: ../mark.c ../e.h
matrix.o: ../matrix.c ../e.h
move.o: ../move.c ../e.h y.tab.h
over.o: ../over.c ../e.h
paren.o: ../paren.c ../e.h
pile.o: ../pile.c ../e.h
shift.o: ../shift.c ../e.h y.tab.h
size.o: ../size.c ../e.h
sqrt.o: ../sqrt.c ../e.h
text.o: ../text.c ../e.h y.tab.h
e.o: e.c ../e.h

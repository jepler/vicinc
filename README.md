# VIC 20 Incremental Game

I still feel nostalgic for 80s Commodore computers, and it's been a goal
for awhile to write an incremental game.  So today, the two ideas got
mixed together, to make the VIC 20 Incremental Game.  The goal: to buy a
Commodore 64, or else to make the most income you can.

This game runs in VICE's "xvic" emulating the unexpanded Vic 20.  You can
buy over 5 different kinds of expansion items for your Vic 20, which
inexplicably earn you income that lets you buy more items.

It's not a very *balanced* incremental, but it's also not a bad effort
for part of a saturday morning.  (it's also an excellent reminder of just
how far we've come in hardware and software in the last 35 years)

![The game, in xvic](https://raw.githubusercontent.com/jepler/vicinc/master/vicinc.png)

# Building and running the software

The game is implemented in "literate basic", which is a markdown file
full of code-blocks and commentary.  On a UNIX-style system with standard
utilities like `awk` and `make` as well as VICE-specific tools like `petcat`
and `xvic`, you can build the whole thing by running `make` (which creates the
tokenized basic program `game.prg`, or run the game with `make run`.  In
principle, you could put `game.prg` onto a disk or tape and run it on actual
hardware, but of course I don't own my childhood Vic 20 anymore to try it

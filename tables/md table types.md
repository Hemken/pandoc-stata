# Four Pandoc table types
Pandoc recognizes markdown tables written in four different styles.  It
recognizes all of these table style by default.
These are:

- [Pipe Tables](#pipe-tables)
- [Simple Tables](#simple-tables)
- [Multi-line Tables](#multi-line-tables)
- [Grid Tables](#grid-tables)
- [Hidden Capabilities](#easter-eggs)

See the [Pandoc manual](https://pandoc.org/MANUAL.html#tables) for detailed
description of these table types.

Stata\'s markdown renderer only recognizes pipe tables.

## Pipe Tables
Demonstration of pipe table syntax, from the Pandoc manual.

The markdown is written:
```
| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |
```

which is rendered as:

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |
  
## Simple Tables
Are ***not*** rendered in Stata.  They would be
written like this:
```
  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.
```

and rendered as

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.

## Multi-line Tables
Are ***not*** rendered in Stata.  They would be
written like this:

```
-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.
```

Rendered as 

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.

## Grid Tables
Are ***not*** rendered in Stata.  They would be
written like this:

```
:Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+
```

Rendered as

:Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+


## Easter Eggs
Not really documented in Stata, several commands produce piped table
output.

- _coef_table
- estimates table
- tabulate
- tabstat

Just add a `markdown` option to each command!

- mata: matrixmarkdown
- mata: datamarkdown


+++
title = "The flashcards I used to memorize Helix commands"
date = 2024-07-30

[taxonomies]
tags = ["post", "helix-editor", "regex"]
+++


I compiled these flashcards when going through the `hx --tutor`. I then put them into my [Obsidian](https://obsidian.md/), using the [spaced repetition](https://forum.obsidian.md/t/plugin-for-flashcards-note-level-spaced-repetition-all-inside-obsidian/16498) plugin. By the time I finished the tutor, I knew enough to mass-edit my notes to the specific format spaced repetition expects.

Flashcards really help with my on-the-fly recollection, which helped me actually *use* the more advanced Helix actions in practice. I recommend making your own flashcards, if that's a thing you do.

<!-- more -->


# The flashcards

Copy this entire code block into any Helix note, then install and enable the spaced repetition plugin. :)

```
#flashcards/helix
`hjkl`:::move
`d`::: delete
`i`::: insert before selection
`a`::: insert after selection
`I`::: insert start of line
`A`::: insert end of line
`o`::: to open new line under cursor
`O`::: to open new line above cursor
`w`::: select until start of next word
`W`::: select until start of next WORD
`e`::: select until end of current word
`E`::: select until end of current WORD
`b`::: select backward to start of current word
`B`::: select backward to start of current WORD
`x`::: select whole line
`X`::: select whole line (does not skip linebreaks)
`v`::: Begin selection
`*`::: Selection to search
`s`::: Search matches in the selection
`S`::: Select matches in selection and split into separate cursors
`alt+s`::: Split selection on newlines. Equivalent to `<S><enter>`
`&`::: Align heads of selection
`d`::: Delete
`r<ch>`::: Replace all of selection with character
`R`::: Replace selection with yanked text
`J`::: Join selected lines (remove break)
`>`::: Indent selection
`<`::: Dedent selection
`<ctrl+a>`::: Increment number in selection
`<ctrl+x>`::: Decrement number under selection
`f`::: Search and select forward to character; inclusive
`F`::: Search and select backward to character; inclusive
`t`::: Search and select forward to character; exclusive
`T`::: Search and select backward to character; exclusive
`/`::: Search forward
`n`, `N`-  Ccycle matches
`?`::: Search backwards
`%`::: Select entire document
`c`::: change selection (equivalent to `di`)
`C`::: new cursor below
`;`:::  to collapse to single cursor
`d`::: delete selection
`u`::: Undo
`U`::: Redo
`y`::: yank (copy)  selection
`p`::: Paste after cursor
`P`::: Paste before cursor
 <ctrl+c>::: Toggle comment on selection
`.`::: Repeat last command
`Q`::: Start and stop recording macros
`q`::: Play macro
`mm`::: Select matching bracket
`mi(`::: Select inside `(` brackets
`ma(`::: Select around `(` brackets
`md(`::: Delete surrounding `(` brackets
`ms(`::: Add `(` brackets around selection
`mr([`::: Replace `(` brackets with `[` brackets
`space`::: Command menu
`g`::: Goto
`<ctrl+w>`::: Window menu
`space`::: Command menu
`"`::: Register picker / menu. (Multiple clipboards / macros)
`m`::: Matching brace jump menu
`<space><f>`::: File picker
`<space><F>`::: File picker at cwd
`<space><b>`::: Buffer picker
`g`    ::: goto
`gg`   ::: goto start
`ge`   ::: goto end
`g<n>g`::: goto nth line
`<ctrl+w><s>`::: Split horizontally
`<ctrl+w><v>`::: Split vertically
`<ctrl+w><o>`::: Close to return to single window view
`<ctrl+s>`::: Save space into jumplist
`<ctrl+o>`::: Jump "out" from last movement
`<ctrl+i>`::: Jump "in" to next movement
`:clipboard-yank`::: `:cy`; Yank to clipboard
`:buffer-new`::: `:bn`; Open new buffer
`:vsplit`::: Split into two vertical buffers
`<t><enter><S>< ><enter><i><enter>`::: Break spaces to newlines until end of line
`<10><x><s><char><enter><&>`::: Align next 10 lines on character
`<10><x><s><char><enter><&>`::: Align next 10 lines on character
`<*><v><n>`::: Selection  to  search,  enter  visual  mode, and  add  matches  to  selection
```

# p.s. helix made writing this post a lot easier

When I added these flashcards here, they came with Spaced Repetition's tracking comments. The file looked like this:

```
#flashcards/helix

 `hjkl`:::move
<!--SR:!2024-08-04,14,290!2024-08-06,16,294-->
`d`::: delete
<!--SR:!2024-08-07,17,291!2024-08-05,15,294-->
`i`::: insert before selection
<!--SR:!2024-08-06,16,290!2024-07-31,10,270-->
`a`::: insert after selection
<!--SR:!2024-08-02,12,274!2024-08-01,12,277-->
`I`::: insert start of line
(and so forth)
```

That's almost 100 lines of comments I'd have to remove manually! I was able to do so with the commands `%` `s` `^<!--` `<enter>` `x` `d`, which tuned the edit from a three-minute-thing into a one-second-thing. This sequence of commands:

- `%` selects the entire document (this post!)
- `s` enters "selection mode", so I can search within my selection.
- `^<!--SR` is regex, which searches within my selection for any lines starting with `<!--`. The `^` is important regex for "start of line".
- `<enter>` confirms my selection, splitting into a separate cursor on each matching line.
- `x` selects the entire line, and
- `d` deletes my selection.

# p.p.s. Here's my regex flashcards too

Thanks for reading this far :) Being good at regex was also super helpful. My regex flashcards helped me too. Flashcards are unreasonably effective.

Sorry, "learning but never remembering regex", I've fallen in love with "learning and remembering regex".

```
#flashcards/regex

`\`:::Escape character
`^`:::Start of string/line
`$`:::End of string/line
`.`:::Match any character
`[ ]`:::Bracket expression
`|`:::Boolean or
`( )`:::Subpattern
`?`:::Zero or one quantifier
`*`:::Zero or more quantifier
`+`:::One or more quantifier
`{n}`:::Match exactly `n` times
`{min,max}`:::Match `min` to `max` times, exclusive


`\d+`:::Match a digit `[0-9]` one or more times
`colou?r`:::Match `color` or `colour`
`gr(a|e)y`:::Match `gray` or `grey`
`.at`:::Match `hat`, `cat`, `bat`, `gat`, `7at`, ` at`, etc.
`[hc]at`:::Match `hat` or `cat`
`[^b]at`:::Match any `.at` string other than `bat`
`^[hc]at`:::Match any string `hat` or `cat` starting a line.
`\[.\]`:::Match any single character surrounded by brackets
`s.*`:::Match any string starting with `"s"` and at least one other character. (Equivalent to `s+`?)

`[a-z]`:::Lowercase characters
`[^abc]`:::Match any character OTHER than `abc`
`[A-Z]`:::Uppercase characters
`[0-9]`:::Numbers
`[A-Za-z0-9]`:::Alphanumeric characters
`[ \t]`:::Space and tab
`[A-Fa-f0-9]`:::Hex digits
```


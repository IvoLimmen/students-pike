# Students

Just a simple application to see how to build something in Pike.

## Requirements

* Pike v8.0 release 1738

## Run

```
pike students.pike
```

Type `help` for the list of commands.
When you type `end` or `quit` it will show the averages per course per student.

# Evaluation

The good:

  * You can use classes and proper OO.

The bad:

  * Documentation is not very clear on all the basics.   
  * Not all pages are available in the tutorial.
  * Documentation actually contains "FIXME:" in red.
  * Could not figure out how to display float when calculating an average. Kept getting errors.

The ugly:

  * It is scripting with a lot almost native calls (like `sscanf`)  
  * NULL does not exists so you really need to rethink you strategy there.
  * It is such a niche language that I only have syntax highlighting. No formatting, etc.

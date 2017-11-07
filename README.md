A partial implementation of the "Bank OCR" kata.

### Some things I might do

For user story #3:

- Seems like it's about time to create an executable script. It should take in
  one or more file paths and print the
- Since we're dealing with multiple files, we might want to create an object
  that encapsulates a collection of entries corresponding to the contents of one
  file. Not sure about the right name in the problem domain... call it a `Page`,
  maybe? The stuff to be written might be `Page#to_s`.
- We created an `IllegibleDigit` earlier on, so we can tack a `#to_s` method
  onto it and handle the `?` cases without too much trouble.

For user story #4:

- We'll need to examine each digit in each invalid entry. The brute-force
  solution would be to generate every block of characters that's one error away
  from the existing digit, then search that space for digits that produce a
  working checksum. That's, what, 3 ^ 9 possibilities for each digit? That's
  only about 20,000, which seems brute-force-able.
- Each digit's parsed from a block of characters. I'd been keeping that block as
  state in each of the `Digit` objects (and in each `IllegibleDigit`), but I
  ditched it along the way since it wasn't useful. I'd probably add it back now!
- Ambiguity is a bit tricky. We'll need to either iterate through the digits and
  maintain a flag or recurse though 'em with a conditional.

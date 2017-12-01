# BLAST
The Basic Local Alignment Search Tool (Blast) finds regions of local similarity
between sequences.

## Overview
Blast(Basic Local Alignment Search Tool)
This is mid-term project of computational biology course.

## Requirement
+ Time
+ Identiy score
+ Whole Genome

## Overall design
+ Construct the human gnome library
  - Using Hash to construct genemic library(Map)
  - Overlap(How large)
  - Using database to store the library(which info). Because the speed 
+ Scan the query sequence in library.
  - How to scan (二分搜索), search for matchers with high score[2]
+ Trace-back: Find the locations of insertions and delection for alignments.

## Contents of the BLAST/　directory
| File Name  | Content Description
|------------|--------------------------------
|README.md   | REDME.md for this subdirectory
|

## Reference
[1].http://www.biomedcentral.com/1471-2105/10/421
[2].http://www.cs.columbia.edu/4761/notes07/chapter2.3-sequenceDB.pdf
[3]https://github.com/INRiSC/BLAST-with-Perl

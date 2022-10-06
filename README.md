# api-python-cp-lookup
Communication Provider Lookup based on Ofcom Numbering Data - Python and SQLite Version

## Welcome!

It's been a long time in the development, but this is a remake of the original getCP API hosted at api.getcp.io, the free Communication Provider lookup tool that features a full login portal, API key management, fancy bulk lookup tools, etc.

All that is coming in a future release, however this is a completely self contained, rewritten version of this API. This particular version is written in Python, using an SQLite3 Backend.

It'll be available as an API endpoint for you to query yourself, but you can also pull the code and run your own copy.

To get it running, there are some nice scripts all setup and ready for you to get going in less than 5 minutes. Knowledge of the Linux command line is very much advised.

## Database

The SQLite3 Database and associated build scripts are completely self contained and can be used on their own for creating your own service. The scripts will automagically download the Ofcom Data (please check their license terms before running the script to make sure you accept them, they're a Government body, so the data *should* be under the Open Government License or Crown Copyright, but, check. #NotALawyer) then shove it into the SQLite3 database and sanitise it all, ready to use!

## N.B.

This is very early days and I may remove this repo in favour of a dockerised implementation.

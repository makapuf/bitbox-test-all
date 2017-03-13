Bitbox testing meta-project
===================

This is a repo that helps compiling all existing projects for the bitbox.

This repo was directly based on pulkomandy https://github.com/pulkomandy/bitbox-dist but : 

* uses submodules instead of gws. 
* therefore, has a list of all modules with a fixed version/commit id to ensure all versions / kernel are in sync.

It mainly focuses on testing and travis.yml is one of the points. Being able to test a whole set of fixed versions automaticaly for kernel changes.

For development, Pulkomandy version would be preferred.

How to use
----------

 * Clone the repo (recursively - that's the whole point)
 * make test
 * If you never built bitbox things, make haikudeps (for Haiku) to install all dependencies (help writing debian/ubuntu/... rules to do the same welcome).
 * enjoy the tests or the builds !

Status
------

https://travis-ci.org/makapuf/bitbox-test-all.svg?branch=master


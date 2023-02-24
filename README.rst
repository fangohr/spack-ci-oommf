

Testing Oommf package in spack (`spack-ci-oommf`)
=====================================================

Support repository for packaging of the `OOMMF tool <https://math.nist.gov/oommf/>`__ package in
`Spack <http://spack.readthedocs.io>`__.

There are (at least two different) error types that can lead to a problem with compiling OOMMF through spack:

1. changes to the oommf specific packaging instructions or newer versions of
oommf. In particular, this is the ``oommf/package.py`` file within spack. To
run tests before we suggest changes to this file, we have used the 
https://github.com/fangohr/oommf-in-spack repository.

2. changes to spack overall: changes in spack behaviour through new spack
releases, changes to third party libraries oommf depends on, changes due to
global reformatting of spack files, etc. This repository (at
https://github.com/fangohr/spack-ci-oommf) is meant to detect these changes
more easily.

Status
------

The following targets clone spack, and attempt to install oommf through spack.
The instructions are embedded in `this Dockerfile <Dockerfile>`__.

They following targets all use the default version of oommf (i.e. what spack
would install if we run `spack install oommf`).

We try different versions of Spack:

- |spack-develop-oommf-stable| Spack develop version (git head), OOMMF 2.0b0_vanilla
- |spack-latest-oommf-stable| Spack latest release (=0.19.1), OOMMF 2.0b0_vanilla
- |spack-v0.19.0-oommf-stable| Spack release 0.19.0, OOMMF 2.0a3
- |spack-v0.18.1-oommf-stable| Spack release 0.18.1, OOMMF 2.0a3

[Note that the tests for OOMMF in spack v0.19.0 are broken.]

.. |spack-latest-oommf-stable| image:: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-latest.yml/badge.svg
   :target: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-latest.yml
   
.. |spack-v0.19.0-oommf-stable| image:: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-v0.19.0.yml/badge.svg
   :target: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-v0.19.0.yml

.. |spack-v0.18.1-oommf-stable| image:: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-v0.18.1.yml/badge.svg
   :target: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-v0.18.1.yml

.. |spack-develop-oommf-stable| image:: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-develop.yml/badge.svg
   :target: https://github.com/fangohr/spack-ci-oommf/actions/workflows/spack-develop.yml

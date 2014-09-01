make_random_seed.pl
===================

Make random seed (random list of words). The program will ask for random numbers. You can make them using dice. Also you can use your imagination to write not only random numbers, but random expressions as well. For example: 

```
4548 * 484 / 485  + 6
```

You need to install `Math::Random::Secure` first:

```
$ cpan install Math::Random::Secure 
```

make_random_seed_maybe_too_complex.pl
=====================================

Make random seed (random list of words). Maybe too complex version.

You need to install `Math::Random::Secure` and `Crypt::Random` first:

```
$ cpan install Math::Random::Secure 
$ cpan install Crypt::Random
```

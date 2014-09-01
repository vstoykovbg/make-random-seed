make_random_seed_simple.pl
==========================

Make random seed (random list of words). No user input needed.

<a href="http://stackoverflow.com/questions/14741158/does-adding-random-numbers-make-them-more-random">Does adding random numbers make them more random?</a> No. It makes them less random.

If the second random number is relatively small (for example: 1..6), there is little decrease of randomness.

But the scripts below are using `%` (<a href="http://en.wikipedia.org/wiki/Modulo_operation">modulo operation</a>), so I suppose adding random numbers in this way is not bad:

```
$maybe_random = irand($maximum); # random integer between 0 and $maximum-1
$really_random = $maybe_random + $other_random_number;
$really_random = $really_random % $maximum;
```


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

make_random_seed_string.pl
==========================

Make random seed (random list of words). The program will ask for random strings. You can make them using dice and some random book. You can pick random words from random pages or use a dice for sentence number and word number.

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

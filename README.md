Mixing Random Numbers Without Decrease of Randomness
====================================================

<a href="http://stackoverflow.com/questions/14741158/does-adding-random-numbers-make-them-more-random">Does adding random numbers make them more random?</a> No. It makes them less random.


But the scripts below are using `^` (<a href="https://en.wikipedia.org/wiki/Bitwise_operation#XOR">binary XOR</a>) and `%` (<a href="http://en.wikipedia.org/wiki/Modulo_operation">modulo operation</a>), so I suppose mixing random numbers in this way is not bad:


```
$maybe_random = irand($maximum); # random integer between 0 and $maximum-1
$really_random = ( $maybe_random ^ $other_random_number ) % $maximum;
```

We have two random numbers. And we don't know which of them is more random than other. Maybe computer generated random numbers are more random. Maybe there is a bug and numbers from computer's RNG are not so random. So, we mix them and the result is more random than the less random number.


make_random_seed_simple.pl
==========================

Make random seed (random list of words). No user input needed. Run this if you trust the <a href="https://en.wikipedia.org/wiki/Pseudorandom_number_generator">PRNG</a>.

You need to install `Math::Random::Secure` first:

```
$ cpan install Math::Random::Secure 
```

make_random_seed_simple2.pl
===========================

Same as above, but is using `Crypt::Random`. You need to install it:

```
$ cpan install Crypt::Random
```


make_random_seed.pl
===================

Make random seed (random list of words). The program will ask for random numbers. You can make them using dice. Also you can use your imagination to write not only random numbers, but random expressions as well. For example: 

```
4548 * 484 / 485  + 6
```

The result of the human generated expression is mixed with the computer generated random number (using the algorithm listed above).

You need to install `Math::Random::Secure` first:

```
$ cpan install Math::Random::Secure 
```

make_random_seed_string.pl
==========================

Make random seed (random list of words). The program will ask for random strings. You can make them using dice and some random book. You can pick random words from random pages or use a dice for sentence number and word number.

The human generated string is mixed with computer generated random number.

You need to install `Math::Random::Secure` first:

```
$ cpan install Math::Random::Secure 
```

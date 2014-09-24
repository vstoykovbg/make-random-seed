Mixing Random Numbers
=====================

See the source code for explaination how it works. Also read this thread on Reddit: <a href="http://www.reddit.com/r/mathematics/comments/2f9286/is_this_algorithm_good_for_mixing_random_numbers/">Is this algorithm good for mixing random numbers?</a>.

TLDR version (simplified):

```
$really_random_number = decimal_from_dice($user_input_dice) ^  $random_number_from_PRNG ^ number_from_hash(sha256hash( join $random_string_input, $another_random_number_from_PRNG ));
```


make_random_seed.pl
===================

Make random seed (random list of words). The program will ask first which word list should be used (Electrum 1.x or BIP39). If you select BIP39 word list, the program will ask how many random words should be chosen. If you select Electrum 1.x word list, the program will choose 12 random words.

For every random word, the program will ask for 7 dice rolls and random string.

You need to install `Math::Random::Secure` and `Crypt::Random` first:

```
$ cpan install Math::Random::Secure 
$ cpan install Crypt::Random
```

Mixing Random Numbers Without Decrease of Randomness
====================================================

See the source code for explaination how it works. Also read this thread on Reddit: <a href="http://www.reddit.com/r/mathematics/comments/2f9286/is_this_algorithm_good_for_mixing_random_numbers/">Is this algorithm good for mixing random numbers?</a>.

TLDR version (simplified):

```
$really_random_number = decimal_from_dice($user_input_dice) ^  $random_number_from_PRNG ^ number_from_hash(sha256hash( join $random_string_input, $another_random_number_from_PRNG ));
```


make_random_seed.pl
===================

Make random seed (random list of words). The program will ask 12 times for 7 random numbers made with dice and random string. 

You need to install `Math::Random::Secure` and `Crypt::Random` first:

```
$ cpan install Math::Random::Secure 
$ cpan install Crypt::Random
```

Known bugs
==========

This script `make_random_seed.pl` does not compute the checksum according to a <a href="https://en.bitcoin.it/wiki/BIP_0039">BIP39</a>.

Also if you use the Diceware-like lits you probably will not get a mnemonic seed with correct checksum.

It looks like Electrum 1.9.8 works without computing the checksum. I tested it with an arbitrary mnemonic seed and the program is accepting it. Therefore, <b>this script is useful only for creating mnemonic seed for the Electrum 1.x</b>.


make_random_seed.pl
===================

Make random seed (random list of words). The program will ask first which word list should be used (Electrum 1.x or BIP39). If you select BIP39 word list, the program will ask how many random words should be chosen. If you select Electrum 1.x word list, the program will choose 12 random words.

For every random word, the program will ask for 7 dice rolls and random string.

You need to install `Math::Random::Secure` and `Crypt::Random` first:

```
$ cpan install Math::Random::Secure 
$ cpan install Crypt::Random
```

See the source code for explaination how it works. Also read this thread on Reddit: <a href="http://www.reddit.com/r/mathematics/comments/2f9286/is_this_algorithm_good_for_mixing_random_numbers/">Is this algorithm good for mixing random numbers?</a>.

TLDR version (simplified):

```
$really_random_number = decimal_from_dice($user_input_dice) ^  $random_number_from_PRNG ^ number_from_hash(sha256hash( join $random_string_input, $another_random_number_from_PRNG ));
```

Diceware-like lists
===================

The downside of using Diceware-like lists is that you need to "throw away" most of the random numbers made with dice. To choose one random word you need 5 dice rolls. If the <a href="http://en.wikipedia.org/wiki/Senary">senary</a> number is not in the list, you need to make another 5 dice rolls until you get senary number that is in the list (probably it will take about 25 dice rolls per word).

<a href="Diceware-like-list-for-Electrum-1.pl">Diceware-like-list-for-Electrum-1.pl</a> - for Electrum 1.x

<a href="Diceware-like-list-for-Electrum-2-BIP39.pl">Diceware-like-list-for-Electrum-2-BIP39.pl</a> - for BIP39 and Electrum 2.x


Ready for print lists in PDF format: <a href="http://www.docdroid.net/i5yd/electrum-1-list.pdf.html">for Electrum 1.x</a>, for <a href="http://www.docdroid.net/i5yc/electrum-2-bip39-list.pdf.html">Electrum 2.x/BIP39</a>.

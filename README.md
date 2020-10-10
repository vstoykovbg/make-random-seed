Make secure passphrases
=====

I am keeping it for educational purposes, as an example of bad user experience (the user needs to enter random stuff multiple times, instead of at once; the seed does not have a valid checksum). However, the code can be interesting, especially the algorithm of producing random numbers in range - `random_in_range()`.

 :point_right: This is my new key stretching script: [Doubleslow Keystretcher](https://github.com/vstoykovbg/doubleslow)
 
 :point_right: Simple script for creating random valid BIP39 seed with 24 words: [make-seed.py](https://github.com/vstoykovbg/doubleslow/blob/main/make-seed.py)

Rounding errors when using int()
=====

Sometimes `int( $a / $b )` produces rounding errors. For example: `int(-6.725/0.025)`.

Using `POSIX::floor( $a / $b )` is more reliable.

I corrected the script to use POSIX::floor() instead of int().

This bug is very unlikely to occur. Аnd its consequences on the quality of the generated random numbers are negligible.

I am not sure if the bug can happen at all, given the ranges of the numbers subject to division.

----------------

One use case for this script is to generate secure passphrases for apps accepting long passphrases. You may add additional security to your passphrase by using my [slow KDF](https://github.com/vstoykovbg/slowkdf).

Тhe benefits of using words from the BIP39 list (instead of random words) is that these words are selected to reduce the risk of human read-write errors (when you read the word list from paper and write it into computer). (But this is less useful if your app does not check if words are from the list - i.e. `build` vs `built`.) It's more easy for humans to read and write BIP39 word list than something like `TJpVlUntiWIKcBVsD4XLn2SdtsL3PIopcyBlah`.

* [NIST’s new password rules – what you need to know](https://nakedsecurity.sophos.com/2016/08/18/nists-new-password-rules-what-you-need-to-know/)
* [Best practices for passwords updated after original author regrets his advice](https://www.theverge.com/2017/8/7/16107966/password-tips-bill-burr-regrets-advice-nits-cybersecurity)

Known bugs (if used for seeds)
==========

TLDR: if you use Electrum 2.9.2, tick `[x] BIP39 seed` when using BIP39 seed (created by this script or manually with dice), otherwise it would not work.

This script `make_random_seed.pl` does not compute the checksum according to the <a href="https://en.bitcoin.it/wiki/BIP_0039">BIP39</a>. Also, if you use the Diceware-like lits you probably will not get a mnemonic seed with correct checksum.

It looks like Electrum 1.9.8 works without computing the checksum. I tested it with an arbitrary mnemonic seed and the program is accepting it.

Electrum 2.9.2 can accept seeds in the old format, BIP39 with (or without) checksum and BIP39 with (or without) checksum plus additional arbitrary words (you need to tick `[x] Extend this seed with custom words` to use this feature, it's visible after you click `Options`). The "custom words" can be anything - including BIP39 word list without checksum (generated by this script). You need to tick `[x] BIP39 seed` to make it accept seeds without checksum.

Better (or worse?) alternative to my script
=====

If you are looking for another script that computes seeds with correct checksums: [Mnemonic Code Converter](https://iancoleman.github.io/bip39/) (JavaScript, requires browser). It allows you to supply your own entropy (if you don't trust your [browser's random number generator](https://developer.mozilla.org/en-US/docs/Web/API/RandomSource/getRandomValues)).

I tested it with `1544234774264585` and it gives `coffee forward seat` every time - so, it looks like it does not mix your entropy with the machine-generated random numbers (like my script do).

You may use the full output of my script (including the `debug` lines and user's input) and copy/paste it into Mnemonic Code Converter as entropy source. This way it will... (Oops, I tested it and the browser freezes; I don't recommend it.)

Possible use cases if you use Electrum 2.9.2
=====

* Old version seed (Electrum 1.x format)
* BIP39 with checksum (cannot be generated by this script!)
* BIP39 without checksum (you need to tick `[x] BIP39 seed`)
* BIP39 without checksum (you need to tick `[x] BIP39 seed`) and adding additional words (`Options` => `[x] Extend this seed with custom words`)
* BIP39 with checksum generated by Electrum and adding additional words generated with this script (`Options` => `[x] Extend this seed with custom words`)

Possible use cases if you use another wallet
=====

I did not tested it with other BIP39 wallets, but it should work if your wallet does not require your seed to have a valid checksum.

make_random_seed.pl
===================

The program creates random seed (random list of words). The program will ask first which word list should be used (Electrum 1.x or BIP39). If you select BIP39 word list, the program will ask how many random words should be chosen. (It does not calculate correct checksums for the BIP39 list, see the "Known bugs" section above.)

For every random word, the program will ask for 7 dice rolls and а random string (you may get it from a random page on a random book you choose).

The program will tolerate user input errors. For example, you can write the results of only 4 dice rolls, 8 dice rolls. Or write only random strings (and skip writing the results from a dice rolls). It will produce usable results because it is mixing the user's input with a computer-generated random numbers.

You need to install `Math::Random::Secure` and `Crypt::Random` first:

```
$ cpan install Math::Random::Secure 
$ cpan install Crypt::Random
```

See the source code for explanation how it works. Also read this thread on Reddit: <a href="http://www.reddit.com/r/mathematics/comments/2f9286/is_this_algorithm_good_for_mixing_random_numbers/">Is this algorithm good for mixing random numbers?</a>.

TLDR version (simplified):

```
$really_random_number = decimal_from_dice($user_input_dice) ^  $random_number_from_PRNG ^ number_from_hash(sha256hash( join $random_string_input, $another_random_number_from_PRNG ));
```

Diceware-like lists
===================

The downside of using Diceware-like lists is that you need to "throw away" some of the random numbers made with dice. To choose one random word you need 5 dice rolls. If the <a href="http://en.wikipedia.org/wiki/Senary">senary</a> number is not in the list, you need to make another 5 dice rolls until you get senary number that is in the list.

<a href="Diceware-like-list-for-Electrum-1.pl">Diceware-like-list-for-Electrum-1.pl</a> - for Electrum 1.x

<a href="Diceware-like-list-for-Electrum-2-BIP39.pl">Diceware-like-list-for-Electrum-2-BIP39.pl</a> - for BIP39 and Electrum 2.x

<b>If using Electrum 2.9.2, tick `[x] BIP39 seed` (this way it will ignore the incorrect checksum and accept the seed)</b>

Ready for print lists in PDF format: <a href="http://www.docdroid.net/i5yd/electrum-1-list.pdf.html">for Electrum 1.x</a>, for <a href="http://www.docdroid.net/i5yc/electrum-2-bip39-list.pdf.html">Electrum 2.x/BIP39</a>.

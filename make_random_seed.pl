#!/usr/bin/perl

use strict;

use POSIX qw(floor);

use Switch;
use Math::Random::Secure qw( irand );
use Crypt::Random qw( makerandom );
use Digest::SHA;

my @words_electrum_1 = (
    "like",         "just",         "love",       "know",       "never",       "want",
    "time",         "out",          "there",      "make",       "look",        "eye",
    "down",         "only",         "think",      "heart",      "back",        "then",
    "into",         "about",        "more",       "away",       "still",       "them",
    "take",         "thing",        "even",       "through",    "long",        "always",
    "world",        "too",          "friend",     "tell",       "try",         "hand",
    "thought",      "over",         "here",       "other",      "need",        "smile",
    "again",        "much",         "cry",        "been",       "night",       "ever",
    "little",       "said",         "end",        "some",       "those",       "around",
    "mind",         "people",       "girl",       "leave",      "dream",       "left",
    "turn",         "myself",       "give",       "nothing",    "really",      "off",
    "before",       "something",    "find",       "walk",       "wish",        "good",
    "once",         "place",        "ask",        "stop",       "keep",        "watch",
    "seem",         "everything",   "wait",       "got",        "yet",         "made",
    "remember",     "start",        "alone",      "run",        "hope",        "maybe",
    "believe",      "body",         "hate",       "after",      "close",       "talk",
    "stand",        "own",          "each",       "hurt",       "help",        "home",
    "god",          "soul",         "new",        "many",       "two",         "inside",
    "should",       "true",         "first",      "fear",       "mean",        "better",
    "play",         "another",      "gone",       "change",     "use",         "wonder",
    "someone",      "hair",         "cold",       "open",       "best",        "any",
    "behind",       "happen",       "water",      "dark",       "laugh",       "stay",
    "forever",      "name",         "work",       "show",       "sky",         "break",
    "came",         "deep",         "door",       "put",        "black",       "together",
    "upon",         "happy",        "such",       "great",      "white",       "matter",
    "fill",         "past",         "please",     "burn",       "cause",       "enough",
    "touch",        "moment",       "soon",       "voice",      "scream",      "anything",
    "stare",        "sound",        "red",        "everyone",   "hide",        "kiss",
    "truth",        "death",        "beautiful",  "mine",       "blood",       "broken",
    "very",         "pass",         "next",       "forget",     "tree",        "wrong",
    "air",          "mother",       "understand", "lip",        "hit",         "wall",
    "memory",       "sleep",        "free",       "high",       "realize",     "school",
    "might",        "skin",         "sweet",      "perfect",    "blue",        "kill",
    "breath",       "dance",        "against",    "fly",        "between",     "grow",
    "strong",       "under",        "listen",     "bring",      "sometimes",   "speak",
    "pull",         "person",       "become",     "family",     "begin",       "ground",
    "real",         "small",        "father",     "sure",       "feet",        "rest",
    "young",        "finally",      "land",       "across",     "today",       "different",
    "guy",          "line",         "fire",       "reason",     "reach",       "second",
    "slowly",       "write",        "eat",        "smell",      "mouth",       "step",
    "learn",        "three",        "floor",      "promise",    "breathe",     "darkness",
    "push",         "earth",        "guess",      "save",       "song",        "above",
    "along",        "both",         "color",      "house",      "almost",      "sorry",
    "anymore",      "brother",      "okay",       "dear",       "game",        "fade",
    "already",      "apart",        "warm",       "beauty",     "heard",       "notice",
    "question",     "shine",        "began",      "piece",      "whole",       "shadow",
    "secret",       "street",       "within",     "finger",     "point",       "morning",
    "whisper",      "child",        "moon",       "green",      "story",       "glass",
    "kid",          "silence",      "since",      "soft",       "yourself",    "empty",
    "shall",        "angel",        "answer",     "baby",       "bright",      "dad",
    "path",         "worry",        "hour",       "drop",       "follow",      "power",
    "war",          "half",         "flow",       "heaven",     "act",         "chance",
    "fact",         "least",        "tired",      "children",   "near",        "quite",
    "afraid",       "rise",         "sea",        "taste",      "window",      "cover",
    "nice",         "trust",        "lot",        "sad",        "cool",        "force",
    "peace",        "return",       "blind",      "easy",       "ready",       "roll",
    "rose",         "drive",        "held",       "music",      "beneath",     "hang",
    "mom",          "paint",        "emotion",    "quiet",      "clear",       "cloud",
    "few",          "pretty",       "bird",       "outside",    "paper",       "picture",
    "front",        "rock",         "simple",     "anyone",     "meant",       "reality",
    "road",         "sense",        "waste",      "bit",        "leaf",        "thank",
    "happiness",    "meet",         "men",        "smoke",      "truly",       "decide",
    "self",         "age",          "book",       "form",       "alive",       "carry",
    "escape",       "damn",         "instead",    "able",       "ice",         "minute",
    "throw",        "catch",        "leg",        "ring",       "course",      "goodbye",
    "lead",         "poem",         "sick",       "corner",     "desire",      "known",
    "problem",      "remind",       "shoulder",   "suppose",    "toward",      "wave",
    "drink",        "jump",         "woman",      "pretend",    "sister",      "week",
    "human",        "joy",          "crack",      "grey",       "pray",        "surprise",
    "dry",          "knee",         "less",       "search",     "bleed",       "caught",
    "clean",        "embrace",      "future",     "king",       "son",         "sorrow",
    "chest",        "hug",          "remain",     "sat",        "worth",       "blow",
    "daddy",        "final",        "parent",     "tight",      "also",        "create",
    "lonely",       "safe",         "cross",      "dress",      "evil",        "silent",
    "bone",         "fate",         "perhaps",    "anger",      "class",       "scar",
    "snow",         "tiny",         "tonight",    "continue",   "control",     "dog",
    "edge",         "mirror",       "month",      "suddenly",   "comfort",     "given",
    "loud",         "quickly",      "gaze",       "plan",       "rush",        "stone",
    "town",         "battle",       "ignore",     "spirit",     "stood",       "stupid",
    "yours",        "brown",        "build",      "dust",       "hey",         "kept",
    "pay",          "phone",        "twist",      "although",   "ball",        "beyond",
    "hidden",       "nose",         "taken",      "fail",       "float",       "pure",
    "somehow",      "wash",         "wrap",       "angry",      "cheek",       "creature",
    "forgotten",    "heat",         "rip",        "single",     "space",       "special",
    "weak",         "whatever",     "yell",       "anyway",     "blame",       "job",
    "choose",       "country",      "curse",      "drift",      "echo",        "figure",
    "grew",         "laughter",     "neck",       "suffer",     "worse",       "yeah",
    "disappear",    "foot",         "forward",    "knife",      "mess",        "somewhere",
    "stomach",      "storm",        "beg",        "idea",       "lift",        "offer",
    "breeze",       "field",        "five",       "often",      "simply",      "stuck",
    "win",          "allow",        "confuse",    "enjoy",      "except",      "flower",
    "seek",         "strength",     "calm",       "grin",       "gun",         "heavy",
    "hill",         "large",        "ocean",      "shoe",       "sigh",        "straight",
    "summer",       "tongue",       "accept",     "crazy",      "everyday",    "exist",
    "grass",        "mistake",      "sent",       "shut",       "surround",    "table",
    "ache",         "brain",        "destroy",    "heal",       "nature",      "shout",
    "sign",         "stain",        "choice",     "doubt",      "glance",      "glow",
    "mountain",     "queen",        "stranger",   "throat",     "tomorrow",    "city",
    "either",       "fish",         "flame",      "rather",     "shape",       "spin",
    "spread",       "ash",          "distance",   "finish",     "image",       "imagine",
    "important",    "nobody",       "shatter",    "warmth",     "became",      "feed",
    "flesh",        "funny",        "lust",       "shirt",      "trouble",     "yellow",
    "attention",    "bare",         "bite",       "money",      "protect",     "amaze",
    "appear",       "born",         "choke",      "completely", "daughter",    "fresh",
    "friendship",   "gentle",       "probably",   "six",        "deserve",     "expect",
    "grab",         "middle",       "nightmare",  "river",      "thousand",    "weight",
    "worst",        "wound",        "barely",     "bottle",     "cream",       "regret",
    "relationship", "stick",        "test",       "crush",      "endless",     "fault",
    "itself",       "rule",         "spill",      "art",        "circle",      "join",
    "kick",         "mask",         "master",     "passion",    "quick",       "raise",
    "smooth",       "unless",       "wander",     "actually",   "broke",       "chair",
    "deal",         "favorite",     "gift",       "note",       "number",      "sweat",
    "box",          "chill",        "clothes",    "lady",       "mark",        "park",
    "poor",         "sadness",      "tie",        "animal",     "belong",      "brush",
    "consume",      "dawn",         "forest",     "innocent",   "pen",         "pride",
    "stream",       "thick",        "clay",       "complete",   "count",       "draw",
    "faith",        "press",        "silver",     "struggle",   "surface",     "taught",
    "teach",        "wet",          "bless",      "chase",      "climb",       "enter",
    "letter",       "melt",         "metal",      "movie",      "stretch",     "swing",
    "vision",       "wife",         "beside",     "crash",      "forgot",      "guide",
    "haunt",        "joke",         "knock",      "plant",      "pour",        "prove",
    "reveal",       "steal",        "stuff",      "trip",       "wood",        "wrist",
    "bother",       "bottom",       "crawl",      "crowd",      "fix",         "forgive",
    "frown",        "grace",        "loose",      "lucky",      "party",       "release",
    "surely",       "survive",      "teacher",    "gently",     "grip",        "speed",
    "suicide",      "travel",       "treat",      "vein",       "written",     "cage",
    "chain",        "conversation", "date",       "enemy",      "however",     "interest",
    "million",      "page",         "pink",       "proud",      "sway",        "themselves",
    "winter",       "church",       "cruel",      "cup",        "demon",       "experience",
    "freedom",      "pair",         "pop",        "purpose",    "respect",     "shoot",
    "softly",       "state",        "strange",    "bar",        "birth",       "curl",
    "dirt",         "excuse",       "lord",       "lovely",     "monster",     "order",
    "pack",         "pants",        "pool",       "scene",      "seven",       "shame",
    "slide",        "ugly",         "among",      "blade",      "blonde",      "closet",
    "creek",        "deny",         "drug",       "eternity",   "gain",        "grade",
    "handle",       "key",          "linger",     "pale",       "prepare",     "swallow",
    "swim",         "tremble",      "wheel",      "won",        "cast",        "cigarette",
    "claim",        "college",      "direction",  "dirty",      "gather",      "ghost",
    "hundred",      "loss",         "lung",       "orange",     "present",     "swear",
    "swirl",        "twice",        "wild",       "bitter",     "blanket",     "doctor",
    "everywhere",   "flash",        "grown",      "knowledge",  "numb",        "pressure",
    "radio",        "repeat",       "ruin",       "spend",      "unknown",     "buy",
    "clock",        "devil",        "early",      "false",      "fantasy",     "pound",
    "precious",     "refuse",       "sheet",      "teeth",      "welcome",     "add",
    "ahead",        "block",        "bury",       "caress",     "content",     "depth",
    "despite",      "distant",      "marry",      "purple",     "threw",       "whenever",
    "bomb",         "dull",         "easily",     "grasp",      "hospital",    "innocence",
    "normal",       "receive",      "reply",      "rhyme",      "shade",       "someday",
    "sword",        "toe",          "visit",      "asleep",     "bought",      "center",
    "consider",     "flat",         "hero",       "history",    "ink",         "insane",
    "muscle",       "mystery",      "pocket",     "reflection", "shove",       "silently",
    "smart",        "soldier",      "spot",       "stress",     "train",       "type",
    "view",         "whether",      "bus",        "energy",     "explain",     "holy",
    "hunger",       "inch",         "magic",      "mix",        "noise",       "nowhere",
    "prayer",       "presence",     "shock",      "snap",       "spider",      "study",
    "thunder",      "trail",        "admit",      "agree",      "bag",         "bang",
    "bound",        "butterfly",    "cute",       "exactly",    "explode",     "familiar",
    "fold",         "further",      "pierce",     "reflect",    "scent",       "selfish",
    "sharp",        "sink",         "spring",     "stumble",    "universe",    "weep",
    "women",        "wonderful",    "action",     "ancient",    "attempt",     "avoid",
    "birthday",     "branch",       "chocolate",  "core",       "depress",     "drunk",
    "especially",   "focus",        "fruit",      "honest",     "match",       "palm",
    "perfectly",    "pillow",       "pity",       "poison",     "roar",        "shift",
    "slightly",     "thump",        "truck",      "tune",       "twenty",      "unable",
    "wipe",         "wrote",        "coat",       "constant",   "dinner",      "drove",
    "egg",          "eternal",      "flight",     "flood",      "frame",       "freak",
    "gasp",         "glad",         "hollow",     "motion",     "peer",        "plastic",
    "root",         "screen",       "season",     "sting",      "strike",      "team",
    "unlike",       "victim",       "volume",     "warn",       "weird",       "attack",
    "await",        "awake",        "built",      "charm",      "crave",       "despair",
    "fought",       "grant",        "grief",      "horse",      "limit",       "message",
    "ripple",       "sanity",       "scatter",    "serve",      "split",       "string",
    "trick",        "annoy",        "blur",       "boat",       "brave",       "clearly",
    "cling",        "connect",      "fist",       "forth",      "imagination", "iron",
    "jock",         "judge",        "lesson",     "milk",       "misery",      "nail",
    "naked",        "ourselves",    "poet",       "possible",   "princess",    "sail",
    "size",         "snake",        "society",    "stroke",     "torture",     "toss",
    "trace",        "wise",         "bloom",      "bullet",     "cell",        "check",
    "cost",         "darling",      "during",     "footstep",   "fragile",     "hallway",
    "hardly",       "horizon",      "invisible",  "journey",    "midnight",    "mud",
    "nod",          "pause",        "relax",      "shiver",     "sudden",      "value",
    "youth",        "abuse",        "admire",     "blink",      "breast",      "bruise",
    "constantly",   "couple",       "creep",      "curve",      "difference",  "dumb",
    "emptiness",    "gotta",        "honor",      "plain",      "planet",      "recall",
    "rub",          "ship",         "slam",       "soar",       "somebody",    "tightly",
    "weather",      "adore",        "approach",   "bond",       "bread",       "burst",
    "candle",       "coffee",       "cousin",     "crime",      "desert",      "flutter",
    "frozen",       "grand",        "heel",       "hello",      "language",    "level",
    "movement",     "pleasure",     "powerful",   "random",     "rhythm",      "settle",
    "silly",        "slap",         "sort",       "spoken",     "steel",       "threaten",
    "tumble",       "upset",        "aside",      "awkward",    "bee",         "blank",
    "board",        "button",       "card",       "carefully",  "complain",    "crap",
    "deeply",       "discover",     "drag",       "dread",      "effort",      "entire",
    "fairy",        "giant",        "gotten",     "greet",      "illusion",    "jeans",
    "leap",         "liquid",       "march",      "mend",       "nervous",     "nine",
    "replace",      "rope",         "spine",      "stole",      "terror",      "accident",
    "apple",        "balance",      "boom",       "childhood",  "collect",     "demand",
    "depression",   "eventually",   "faint",      "glare",      "goal",        "group",
    "honey",        "kitchen",      "laid",       "limb",       "machine",     "mere",
    "mold",         "murder",       "nerve",      "painful",    "poetry",      "prince",
    "rabbit",       "shelter",      "shore",      "shower",     "soothe",      "stair",
    "steady",       "sunlight",     "tangle",     "tease",      "treasure",    "uncle",
    "begun",        "bliss",        "canvas",     "cheer",      "claw",        "clutch",
    "commit",       "crimson",      "crystal",    "delight",    "doll",        "existence",
    "express",      "fog",          "football",   "gay",        "goose",       "guard",
    "hatred",       "illuminate",   "mass",       "math",       "mourn",       "rich",
    "rough",        "skip",         "stir",       "student",    "style",       "support",
    "thorn",        "tough",        "yard",       "yearn",      "yesterday",   "advice",
    "appreciate",   "autumn",       "bank",       "beam",       "bowl",        "capture",
    "carve",        "collapse",     "confusion",  "creation",   "dove",        "feather",
    "girlfriend",   "glory",        "government", "harsh",      "hop",         "inner",
    "loser",        "moonlight",    "neighbor",   "neither",    "peach",       "pig",
    "praise",       "screw",        "shield",     "shimmer",    "sneak",       "stab",
    "subject",      "throughout",   "thrown",     "tower",      "twirl",       "wow",
    "army",         "arrive",       "bathroom",   "bump",       "cease",       "cookie",
    "couch",        "courage",      "dim",        "guilt",      "howl",        "hum",
    "husband",      "insult",       "led",        "lunch",      "mock",        "mostly",
    "natural",      "nearly",       "needle",     "nerd",       "peaceful",    "perfection",
    "pile",         "price",        "remove",     "roam",       "sanctuary",   "serious",
    "shiny",        "shook",        "sob",        "stolen",     "tap",         "vain",
    "void",         "warrior",      "wrinkle",    "affection",  "apologize",   "blossom",
    "bounce",       "bridge",       "cheap",      "crumble",    "decision",    "descend",
    "desperately",  "dig",          "dot",        "flip",       "frighten",    "heartbeat",
    "huge",         "lazy",         "lick",       "odd",        "opinion",     "process",
    "puzzle",       "quietly",      "retreat",    "score",      "sentence",    "separate",
    "situation",    "skill",        "soak",       "square",     "stray",       "taint",
    "task",         "tide",         "underneath", "veil",       "whistle",     "anywhere",
    "bedroom",      "bid",          "bloody",     "burden",     "careful",     "compare",
    "concern",      "curtain",      "decay",      "defeat",     "describe",    "double",
    "dreamer",      "driver",       "dwell",      "evening",    "flare",       "flicker",
    "grandma",      "guitar",       "harm",       "horrible",   "hungry",      "indeed",
    "lace",         "melody",       "monkey",     "nation",     "object",      "obviously",
    "rainbow",      "salt",         "scratch",    "shown",      "shy",         "stage",
    "stun",         "third",        "tickle",     "useless",    "weakness",    "worship",
    "worthless",    "afternoon",    "beard",      "boyfriend",  "bubble",      "busy",
    "certain",      "chin",         "concrete",   "desk",       "diamond",     "doom",
    "drawn",        "due",          "felicity",   "freeze",     "frost",       "garden",
    "glide",        "harmony",      "hopefully",  "hunt",       "jealous",     "lightning",
    "mama",         "mercy",        "peel",       "physical",   "position",    "pulse",
    "punch",        "quit",         "rant",       "respond",    "salty",       "sane",
    "satisfy",      "savior",       "sheep",      "slept",      "social",      "sport",
    "tuck",         "utter",        "valley",     "wolf",       "aim",         "alas",
    "alter",        "arrow",        "awaken",     "beaten",     "belief",      "brand",
    "ceiling",      "cheese",       "clue",       "confidence", "connection",  "daily",
    "disguise",     "eager",        "erase",      "essence",    "everytime",   "expression",
    "fan",          "flag",         "flirt",      "foul",       "fur",         "giggle",
    "glorious",     "ignorance",    "law",        "lifeless",   "measure",     "mighty",
    "muse",         "north",        "opposite",   "paradise",   "patience",    "patient",
    "pencil",       "petal",        "plate",      "ponder",     "possibly",    "practice",
    "slice",        "spell",        "stock",      "strife",     "strip",       "suffocate",
    "suit",         "tender",       "tool",       "trade",      "velvet",      "verse",
    "waist",        "witch",        "aunt",       "bench",      "bold",        "cap",
    "certainly",    "click",        "companion",  "creator",    "dart",        "delicate",
    "determine",    "dish",         "dragon",     "drama",      "drum",        "dude",
    "everybody",    "feast",        "forehead",   "former",     "fright",      "fully",
    "gas",          "hook",         "hurl",       "invite",     "juice",       "manage",
    "moral",        "possess",      "raw",        "rebel",      "royal",       "scale",
    "scary",        "several",      "slight",     "stubborn",   "swell",       "talent",
    "tea",          "terrible",     "thread",     "torment",    "trickle",     "usually",
    "vast",         "violence",     "weave",      "acid",       "agony",       "ashamed",
    "awe",          "belly",        "blend",      "blush",      "character",   "cheat",
    "common",       "company",      "coward",     "creak",      "danger",      "deadly",
    "defense",      "define",       "depend",     "desperate",  "destination", "dew",
    "duck",         "dusty",        "embarrass",  "engine",     "example",     "explore",
    "foe",          "freely",       "frustrate",  "generation", "glove",       "guilty",
    "health",       "hurry",        "idiot",      "impossible", "inhale",      "jaw",
    "kingdom",      "mention",      "mist",       "moan",       "mumble",      "mutter",
    "observe",      "ode",          "pathetic",   "pattern",    "pie",         "prefer",
    "puff",         "rape",         "rare",       "revenge",    "rude",        "scrape",
    "spiral",       "squeeze",      "strain",     "sunset",     "suspend",     "sympathy",
    "thigh",        "throne",       "total",      "unseen",     "weapon",      "weary"
);

my @words_BIP39 = (
    "abandon",  "ability",  "able",     "about",    "above",    "absent",   "absorb",   "abstract",
    "absurd",   "abuse",    "access",   "accident", "account",  "accuse",   "achieve",  "acid",
    "acoustic", "acquire",  "across",   "act",      "action",   "actor",    "actress",  "actual",
    "adapt",    "add",      "addict",   "address",  "adjust",   "admit",    "adult",    "advance",
    "advice",   "aerobic",  "affair",   "afford",   "afraid",   "again",    "age",      "agent",
    "agree",    "ahead",    "aim",      "air",      "airport",  "aisle",    "alarm",    "album",
    "alcohol",  "alert",    "alien",    "all",      "alley",    "allow",    "almost",   "alone",
    "alpha",    "already",  "also",     "alter",    "always",   "amateur",  "amazing",  "among",
    "amount",   "amused",   "analyst",  "anchor",   "ancient",  "anger",    "angle",    "angry",
    "animal",   "ankle",    "announce", "annual",   "another",  "answer",   "antenna",  "antique",
    "anxiety",  "any",      "apart",    "apology",  "appear",   "apple",    "approve",  "april",
    "arch",     "arctic",   "area",     "arena",    "argue",    "arm",      "armed",    "armor",
    "army",     "around",   "arrange",  "arrest",   "arrive",   "arrow",    "art",      "artefact",
    "artist",   "artwork",  "ask",      "aspect",   "assault",  "asset",    "assist",   "assume",
    "asthma",   "athlete",  "atom",     "attack",   "attend",   "attitude", "attract",  "auction",
    "audit",    "august",   "aunt",     "author",   "auto",     "autumn",   "average",  "avocado",
    "avoid",    "awake",    "aware",    "away",     "awesome",  "awful",    "awkward",  "axis",
    "baby",     "bachelor", "bacon",    "badge",    "bag",      "balance",  "balcony",  "ball",
    "bamboo",   "banana",   "banner",   "bar",      "barely",   "bargain",  "barrel",   "base",
    "basic",    "basket",   "battle",   "beach",    "bean",     "beauty",   "because",  "become",
    "beef",     "before",   "begin",    "behave",   "behind",   "believe",  "below",    "belt",
    "bench",    "benefit",  "best",     "betray",   "better",   "between",  "beyond",   "bicycle",
    "bid",      "bike",     "bind",     "biology",  "bird",     "birth",    "bitter",   "black",
    "blade",    "blame",    "blanket",  "blast",    "bleak",    "bless",    "blind",    "blood",
    "blossom",  "blouse",   "blue",     "blur",     "blush",    "board",    "boat",     "body",
    "boil",     "bomb",     "bone",     "bonus",    "book",     "boost",    "border",   "boring",
    "borrow",   "boss",     "bottom",   "bounce",   "box",      "boy",      "bracket",  "brain",
    "brand",    "brass",    "brave",    "bread",    "breeze",   "brick",    "bridge",   "brief",
    "bright",   "bring",    "brisk",    "broccoli", "broken",   "bronze",   "broom",    "brother",
    "brown",    "brush",    "bubble",   "buddy",    "budget",   "buffalo",  "build",    "bulb",
    "bulk",     "bullet",   "bundle",   "bunker",   "burden",   "burger",   "burst",    "bus",
    "business", "busy",     "butter",   "buyer",    "buzz",     "cabbage",  "cabin",    "cable",
    "cactus",   "cage",     "cake",     "call",     "calm",     "camera",   "camp",     "can",
    "canal",    "cancel",   "candy",    "cannon",   "canoe",    "canvas",   "canyon",   "capable",
    "capital",  "captain",  "car",      "carbon",   "card",     "cargo",    "carpet",   "carry",
    "cart",     "case",     "cash",     "casino",   "castle",   "casual",   "cat",      "catalog",
    "catch",    "category", "cattle",   "caught",   "cause",    "caution",  "cave",     "ceiling",
    "celery",   "cement",   "census",   "century",  "cereal",   "certain",  "chair",    "chalk",
    "champion", "change",   "chaos",    "chapter",  "charge",   "chase",    "chat",     "cheap",
    "check",    "cheese",   "chef",     "cherry",   "chest",    "chicken",  "chief",    "child",
    "chimney",  "choice",   "choose",   "chronic",  "chuckle",  "chunk",    "churn",    "cigar",
    "cinnamon", "circle",   "citizen",  "city",     "civil",    "claim",    "clap",     "clarify",
    "claw",     "clay",     "clean",    "clerk",    "clever",   "click",    "client",   "cliff",
    "climb",    "clinic",   "clip",     "clock",    "clog",     "close",    "cloth",    "cloud",
    "clown",    "club",     "clump",    "cluster",  "clutch",   "coach",    "coast",    "coconut",
    "code",     "coffee",   "coil",     "coin",     "collect",  "color",    "column",   "combine",
    "come",     "comfort",  "comic",    "common",   "company",  "concert",  "conduct",  "confirm",
    "congress", "connect",  "consider", "control",  "convince", "cook",     "cool",     "copper",
    "copy",     "coral",    "core",     "corn",     "correct",  "cost",     "cotton",   "couch",
    "country",  "couple",   "course",   "cousin",   "cover",    "coyote",   "crack",    "cradle",
    "craft",    "cram",     "crane",    "crash",    "crater",   "crawl",    "crazy",    "cream",
    "credit",   "creek",    "crew",     "cricket",  "crime",    "crisp",    "critic",   "crop",
    "cross",    "crouch",   "crowd",    "crucial",  "cruel",    "cruise",   "crumble",  "crunch",
    "crush",    "cry",      "crystal",  "cube",     "culture",  "cup",      "cupboard", "curious",
    "current",  "curtain",  "curve",    "cushion",  "custom",   "cute",     "cycle",    "dad",
    "damage",   "damp",     "dance",    "danger",   "daring",   "dash",     "daughter", "dawn",
    "day",      "deal",     "debate",   "debris",   "decade",   "december", "decide",   "decline",
    "decorate", "decrease", "deer",     "defense",  "define",   "defy",     "degree",   "delay",
    "deliver",  "demand",   "demise",   "denial",   "dentist",  "deny",     "depart",   "depend",
    "deposit",  "depth",    "deputy",   "derive",   "describe", "desert",   "design",   "desk",
    "despair",  "destroy",  "detail",   "detect",   "develop",  "device",   "devote",   "diagram",
    "dial",     "diamond",  "diary",    "dice",     "diesel",   "diet",     "differ",   "digital",
    "dignity",  "dilemma",  "dinner",   "dinosaur", "direct",   "dirt",     "disagree", "discover",
    "disease",  "dish",     "dismiss",  "disorder", "display",  "distance", "divert",   "divide",
    "divorce",  "dizzy",    "doctor",   "document", "dog",      "doll",     "dolphin",  "domain",
    "donate",   "donkey",   "donor",    "door",     "dose",     "double",   "dove",     "draft",
    "dragon",   "drama",    "drastic",  "draw",     "dream",    "dress",    "drift",    "drill",
    "drink",    "drip",     "drive",    "drop",     "drum",     "dry",      "duck",     "dumb",
    "dune",     "during",   "dust",     "dutch",    "duty",     "dwarf",    "dynamic",  "eager",
    "eagle",    "early",    "earn",     "earth",    "easily",   "east",     "easy",     "echo",
    "ecology",  "economy",  "edge",     "edit",     "educate",  "effort",   "egg",      "eight",
    "either",   "elbow",    "elder",    "electric", "elegant",  "element",  "elephant", "elevator",
    "elite",    "else",     "embark",   "embody",   "embrace",  "emerge",   "emotion",  "employ",
    "empower",  "empty",    "enable",   "enact",    "end",      "endless",  "endorse",  "enemy",
    "energy",   "enforce",  "engage",   "engine",   "enhance",  "enjoy",    "enlist",   "enough",
    "enrich",   "enroll",   "ensure",   "enter",    "entire",   "entry",    "envelope", "episode",
    "equal",    "equip",    "era",      "erase",    "erode",    "erosion",  "error",    "erupt",
    "escape",   "essay",    "essence",  "estate",   "eternal",  "ethics",   "evidence", "evil",
    "evoke",    "evolve",   "exact",    "example",  "excess",   "exchange", "excite",   "exclude",
    "excuse",   "execute",  "exercise", "exhaust",  "exhibit",  "exile",    "exist",    "exit",
    "exotic",   "expand",   "expect",   "expire",   "explain",  "expose",   "express",  "extend",
    "extra",    "eye",      "eyebrow",  "fabric",   "face",     "faculty",  "fade",     "faint",
    "faith",    "fall",     "false",    "fame",     "family",   "famous",   "fan",      "fancy",
    "fantasy",  "farm",     "fashion",  "fat",      "fatal",    "father",   "fatigue",  "fault",
    "favorite", "feature",  "february", "federal",  "fee",      "feed",     "feel",     "female",
    "fence",    "festival", "fetch",    "fever",    "few",      "fiber",    "fiction",  "field",
    "figure",   "file",     "film",     "filter",   "final",    "find",     "fine",     "finger",
    "finish",   "fire",     "firm",     "first",    "fiscal",   "fish",     "fit",      "fitness",
    "fix",      "flag",     "flame",    "flash",    "flat",     "flavor",   "flee",     "flight",
    "flip",     "float",    "flock",    "floor",    "flower",   "fluid",    "flush",    "fly",
    "foam",     "focus",    "fog",      "foil",     "fold",     "follow",   "food",     "foot",
    "force",    "forest",   "forget",   "fork",     "fortune",  "forum",    "forward",  "fossil",
    "foster",   "found",    "fox",      "fragile",  "frame",    "frequent", "fresh",    "friend",
    "fringe",   "frog",     "front",    "frost",    "frown",    "frozen",   "fruit",    "fuel",
    "fun",      "funny",    "furnace",  "fury",     "future",   "gadget",   "gain",     "galaxy",
    "gallery",  "game",     "gap",      "garage",   "garbage",  "garden",   "garlic",   "garment",
    "gas",      "gasp",     "gate",     "gather",   "gauge",    "gaze",     "general",  "genius",
    "genre",    "gentle",   "genuine",  "gesture",  "ghost",    "giant",    "gift",     "giggle",
    "ginger",   "giraffe",  "girl",     "give",     "glad",     "glance",   "glare",    "glass",
    "glide",    "glimpse",  "globe",    "gloom",    "glory",    "glove",    "glow",     "glue",
    "goat",     "goddess",  "gold",     "good",     "goose",    "gorilla",  "gospel",   "gossip",
    "govern",   "gown",     "grab",     "grace",    "grain",    "grant",    "grape",    "grass",
    "gravity",  "great",    "green",    "grid",     "grief",    "grit",     "grocery",  "group",
    "grow",     "grunt",    "guard",    "guess",    "guide",    "guilt",    "guitar",   "gun",
    "gym",      "habit",    "hair",     "half",     "hammer",   "hamster",  "hand",     "happy",
    "harbor",   "hard",     "harsh",    "harvest",  "hat",      "have",     "hawk",     "hazard",
    "head",     "health",   "heart",    "heavy",    "hedgehog", "height",   "hello",    "helmet",
    "help",     "hen",      "hero",     "hidden",   "high",     "hill",     "hint",     "hip",
    "hire",     "history",  "hobby",    "hockey",   "hold",     "hole",     "holiday",  "hollow",
    "home",     "honey",    "hood",     "hope",     "horn",     "horror",   "horse",    "hospital",
    "host",     "hotel",    "hour",     "hover",    "hub",      "huge",     "human",    "humble",
    "humor",    "hundred",  "hungry",   "hunt",     "hurdle",   "hurry",    "hurt",     "husband",
    "hybrid",   "ice",      "icon",     "idea",     "identify", "idle",     "ignore",   "ill",
    "illegal",  "illness",  "image",    "imitate",  "immense",  "immune",   "impact",   "impose",
    "improve",  "impulse",  "inch",     "include",  "income",   "increase", "index",    "indicate",
    "indoor",   "industry", "infant",   "inflict",  "inform",   "inhale",   "inherit",  "initial",
    "inject",   "injury",   "inmate",   "inner",    "innocent", "input",    "inquiry",  "insane",
    "insect",   "inside",   "inspire",  "install",  "intact",   "interest", "into",     "invest",
    "invite",   "involve",  "iron",     "island",   "isolate",  "issue",    "item",     "ivory",
    "jacket",   "jaguar",   "jar",      "jazz",     "jealous",  "jeans",    "jelly",    "jewel",
    "job",      "join",     "joke",     "journey",  "joy",      "judge",    "juice",    "jump",
    "jungle",   "junior",   "junk",     "just",     "kangaroo", "keen",     "keep",     "ketchup",
    "key",      "kick",     "kid",      "kidney",   "kind",     "kingdom",  "kiss",     "kit",
    "kitchen",  "kite",     "kitten",   "kiwi",     "knee",     "knife",    "knock",    "know",
    "lab",      "label",    "labor",    "ladder",   "lady",     "lake",     "lamp",     "language",
    "laptop",   "large",    "later",    "latin",    "laugh",    "laundry",  "lava",     "law",
    "lawn",     "lawsuit",  "layer",    "lazy",     "leader",   "leaf",     "learn",    "leave",
    "lecture",  "left",     "leg",      "legal",    "legend",   "leisure",  "lemon",    "lend",
    "length",   "lens",     "leopard",  "lesson",   "letter",   "level",    "liar",     "liberty",
    "library",  "license",  "life",     "lift",     "light",    "like",     "limb",     "limit",
    "link",     "lion",     "liquid",   "list",     "little",   "live",     "lizard",   "load",
    "loan",     "lobster",  "local",    "lock",     "logic",    "lonely",   "long",     "loop",
    "lottery",  "loud",     "lounge",   "love",     "loyal",    "lucky",    "luggage",  "lumber",
    "lunar",    "lunch",    "luxury",   "lyrics",   "machine",  "mad",      "magic",    "magnet",
    "maid",     "mail",     "main",     "major",    "make",     "mammal",   "man",      "manage",
    "mandate",  "mango",    "mansion",  "manual",   "maple",    "marble",   "march",    "margin",
    "marine",   "market",   "marriage", "mask",     "mass",     "master",   "match",    "material",
    "math",     "matrix",   "matter",   "maximum",  "maze",     "meadow",   "mean",     "measure",
    "meat",     "mechanic", "medal",    "media",    "melody",   "melt",     "member",   "memory",
    "mention",  "menu",     "mercy",    "merge",    "merit",    "merry",    "mesh",     "message",
    "metal",    "method",   "middle",   "midnight", "milk",     "million",  "mimic",    "mind",
    "minimum",  "minor",    "minute",   "miracle",  "mirror",   "misery",   "miss",     "mistake",
    "mix",      "mixed",    "mixture",  "mobile",   "model",    "modify",   "mom",      "moment",
    "monitor",  "monkey",   "monster",  "month",    "moon",     "moral",    "more",     "morning",
    "mosquito", "mother",   "motion",   "motor",    "mountain", "mouse",    "move",     "movie",
    "much",     "muffin",   "mule",     "multiply", "muscle",   "museum",   "mushroom", "music",
    "must",     "mutual",   "myself",   "mystery",  "myth",     "naive",    "name",     "napkin",
    "narrow",   "nasty",    "nation",   "nature",   "near",     "neck",     "need",     "negative",
    "neglect",  "neither",  "nephew",   "nerve",    "nest",     "net",      "network",  "neutral",
    "never",    "news",     "next",     "nice",     "night",    "noble",    "noise",    "nominee",
    "noodle",   "normal",   "north",    "nose",     "notable",  "note",     "nothing",  "notice",
    "novel",    "now",      "nuclear",  "number",   "nurse",    "nut",      "oak",      "obey",
    "object",   "oblige",   "obscure",  "observe",  "obtain",   "obvious",  "occur",    "ocean",
    "october",  "odor",     "off",      "offer",    "office",   "often",    "oil",      "okay",
    "old",      "olive",    "olympic",  "omit",     "once",     "one",      "onion",    "online",
    "only",     "open",     "opera",    "opinion",  "oppose",   "option",   "orange",   "orbit",
    "orchard",  "order",    "ordinary", "organ",    "orient",   "original", "orphan",   "ostrich",
    "other",    "outdoor",  "outer",    "output",   "outside",  "oval",     "oven",     "over",
    "own",      "owner",    "oxygen",   "oyster",   "ozone",    "pact",     "paddle",   "page",
    "pair",     "palace",   "palm",     "panda",    "panel",    "panic",    "panther",  "paper",
    "parade",   "parent",   "park",     "parrot",   "party",    "pass",     "patch",    "path",
    "patient",  "patrol",   "pattern",  "pause",    "pave",     "payment",  "peace",    "peanut",
    "pear",     "peasant",  "pelican",  "pen",      "penalty",  "pencil",   "people",   "pepper",
    "perfect",  "permit",   "person",   "pet",      "phone",    "photo",    "phrase",   "physical",
    "piano",    "picnic",   "picture",  "piece",    "pig",      "pigeon",   "pill",     "pilot",
    "pink",     "pioneer",  "pipe",     "pistol",   "pitch",    "pizza",    "place",    "planet",
    "plastic",  "plate",    "play",     "please",   "pledge",   "pluck",    "plug",     "plunge",
    "poem",     "poet",     "point",    "polar",    "pole",     "police",   "pond",     "pony",
    "pool",     "popular",  "portion",  "position", "possible", "post",     "potato",   "pottery",
    "poverty",  "powder",   "power",    "practice", "praise",   "predict",  "prefer",   "prepare",
    "present",  "pretty",   "prevent",  "price",    "pride",    "primary",  "print",    "priority",
    "prison",   "private",  "prize",    "problem",  "process",  "produce",  "profit",   "program",
    "project",  "promote",  "proof",    "property", "prosper",  "protect",  "proud",    "provide",
    "public",   "pudding",  "pull",     "pulp",     "pulse",    "pumpkin",  "punch",    "pupil",
    "puppy",    "purchase", "purity",   "purpose",  "purse",    "push",     "put",      "puzzle",
    "pyramid",  "quality",  "quantum",  "quarter",  "question", "quick",    "quit",     "quiz",
    "quote",    "rabbit",   "raccoon",  "race",     "rack",     "radar",    "radio",    "rail",
    "rain",     "raise",    "rally",    "ramp",     "ranch",    "random",   "range",    "rapid",
    "rare",     "rate",     "rather",   "raven",    "raw",      "razor",    "ready",    "real",
    "reason",   "rebel",    "rebuild",  "recall",   "receive",  "recipe",   "record",   "recycle",
    "reduce",   "reflect",  "reform",   "refuse",   "region",   "regret",   "regular",  "reject",
    "relax",    "release",  "relief",   "rely",     "remain",   "remember", "remind",   "remove",
    "render",   "renew",    "rent",     "reopen",   "repair",   "repeat",   "replace",  "report",
    "require",  "rescue",   "resemble", "resist",   "resource", "response", "result",   "retire",
    "retreat",  "return",   "reunion",  "reveal",   "review",   "reward",   "rhythm",   "rib",
    "ribbon",   "rice",     "rich",     "ride",     "ridge",    "rifle",    "right",    "rigid",
    "ring",     "riot",     "ripple",   "risk",     "ritual",   "rival",    "river",    "road",
    "roast",    "robot",    "robust",   "rocket",   "romance",  "roof",     "rookie",   "room",
    "rose",     "rotate",   "rough",    "round",    "route",    "royal",    "rubber",   "rude",
    "rug",      "rule",     "run",      "runway",   "rural",    "sad",      "saddle",   "sadness",
    "safe",     "sail",     "salad",    "salmon",   "salon",    "salt",     "salute",   "same",
    "sample",   "sand",     "satisfy",  "satoshi",  "sauce",    "sausage",  "save",     "say",
    "scale",    "scan",     "scare",    "scatter",  "scene",    "scheme",   "school",   "science",
    "scissors", "scorpion", "scout",    "scrap",    "screen",   "script",   "scrub",    "sea",
    "search",   "season",   "seat",     "second",   "secret",   "section",  "security", "seed",
    "seek",     "segment",  "select",   "sell",     "seminar",  "senior",   "sense",    "sentence",
    "series",   "service",  "session",  "settle",   "setup",    "seven",    "shadow",   "shaft",
    "shallow",  "share",    "shed",     "shell",    "sheriff",  "shield",   "shift",    "shine",
    "ship",     "shiver",   "shock",    "shoe",     "shoot",    "shop",     "short",    "shoulder",
    "shove",    "shrimp",   "shrug",    "shuffle",  "shy",      "sibling",  "sick",     "side",
    "siege",    "sight",    "sign",     "silent",   "silk",     "silly",    "silver",   "similar",
    "simple",   "since",    "sing",     "siren",    "sister",   "situate",  "six",      "size",
    "skate",    "sketch",   "ski",      "skill",    "skin",     "skirt",    "skull",    "slab",
    "slam",     "sleep",    "slender",  "slice",    "slide",    "slight",   "slim",     "slogan",
    "slot",     "slow",     "slush",    "small",    "smart",    "smile",    "smoke",    "smooth",
    "snack",    "snake",    "snap",     "sniff",    "snow",     "soap",     "soccer",   "social",
    "sock",     "soda",     "soft",     "solar",    "soldier",  "solid",    "solution", "solve",
    "someone",  "song",     "soon",     "sorry",    "sort",     "soul",     "sound",    "soup",
    "source",   "south",    "space",    "spare",    "spatial",  "spawn",    "speak",    "special",
    "speed",    "spell",    "spend",    "sphere",   "spice",    "spider",   "spike",    "spin",
    "spirit",   "split",    "spoil",    "sponsor",  "spoon",    "sport",    "spot",     "spray",
    "spread",   "spring",   "spy",      "square",   "squeeze",  "squirrel", "stable",   "stadium",
    "staff",    "stage",    "stairs",   "stamp",    "stand",    "start",    "state",    "stay",
    "steak",    "steel",    "stem",     "step",     "stereo",   "stick",    "still",    "sting",
    "stock",    "stomach",  "stone",    "stool",    "story",    "stove",    "strategy", "street",
    "strike",   "strong",   "struggle", "student",  "stuff",    "stumble",  "style",    "subject",
    "submit",   "subway",   "success",  "such",     "sudden",   "suffer",   "sugar",    "suggest",
    "suit",     "summer",   "sun",      "sunny",    "sunset",   "super",    "supply",   "supreme",
    "sure",     "surface",  "surge",    "surprise", "surround", "survey",   "suspect",  "sustain",
    "swallow",  "swamp",    "swap",     "swarm",    "swear",    "sweet",    "swift",    "swim",
    "swing",    "switch",   "sword",    "symbol",   "symptom",  "syrup",    "system",   "table",
    "tackle",   "tag",      "tail",     "talent",   "talk",     "tank",     "tape",     "target",
    "task",     "taste",    "tattoo",   "taxi",     "teach",    "team",     "tell",     "ten",
    "tenant",   "tennis",   "tent",     "term",     "test",     "text",     "thank",    "that",
    "theme",    "then",     "theory",   "there",    "they",     "thing",    "this",     "thought",
    "three",    "thrive",   "throw",    "thumb",    "thunder",  "ticket",   "tide",     "tiger",
    "tilt",     "timber",   "time",     "tiny",     "tip",      "tired",    "tissue",   "title",
    "toast",    "tobacco",  "today",    "toddler",  "toe",      "together", "toilet",   "token",
    "tomato",   "tomorrow", "tone",     "tongue",   "tonight",  "tool",     "tooth",    "top",
    "topic",    "topple",   "torch",    "tornado",  "tortoise", "toss",     "total",    "tourist",
    "toward",   "tower",    "town",     "toy",      "track",    "trade",    "traffic",  "tragic",
    "train",    "transfer", "trap",     "trash",    "travel",   "tray",     "treat",    "tree",
    "trend",    "trial",    "tribe",    "trick",    "trigger",  "trim",     "trip",     "trophy",
    "trouble",  "truck",    "true",     "truly",    "trumpet",  "trust",    "truth",    "try",
    "tube",     "tuition",  "tumble",   "tuna",     "tunnel",   "turkey",   "turn",     "turtle",
    "twelve",   "twenty",   "twice",    "twin",     "twist",    "two",      "type",     "typical",
    "ugly",     "umbrella", "unable",   "unaware",  "uncle",    "uncover",  "under",    "undo",
    "unfair",   "unfold",   "unhappy",  "uniform",  "unique",   "unit",     "universe", "unknown",
    "unlock",   "until",    "unusual",  "unveil",   "update",   "upgrade",  "uphold",   "upon",
    "upper",    "upset",    "urban",    "urge",     "usage",    "use",      "used",     "useful",
    "useless",  "usual",    "utility",  "vacant",   "vacuum",   "vague",    "valid",    "valley",
    "valve",    "van",      "vanish",   "vapor",    "various",  "vast",     "vault",    "vehicle",
    "velvet",   "vendor",   "venture",  "venue",    "verb",     "verify",   "version",  "very",
    "vessel",   "veteran",  "viable",   "vibrant",  "vicious",  "victory",  "video",    "view",
    "village",  "vintage",  "violin",   "virtual",  "virus",    "visa",     "visit",    "visual",
    "vital",    "vivid",    "vocal",    "voice",    "void",     "volcano",  "volume",   "vote",
    "voyage",   "wage",     "wagon",    "wait",     "walk",     "wall",     "walnut",   "want",
    "warfare",  "warm",     "warrior",  "wash",     "wasp",     "waste",    "water",    "wave",
    "way",      "wealth",   "weapon",   "wear",     "weasel",   "weather",  "web",      "wedding",
    "weekend",  "weird",    "welcome",  "west",     "wet",      "whale",    "what",     "wheat",
    "wheel",    "when",     "where",    "whip",     "whisper",  "wide",     "width",    "wife",
    "wild",     "will",     "win",      "window",   "wine",     "wing",     "wink",     "winner",
    "winter",   "wire",     "wisdom",   "wise",     "wish",     "witness",  "wolf",     "woman",
    "wonder",   "wood",     "wool",     "word",     "work",     "world",    "worry",    "worth",
    "wrap",     "wreck",    "wrestle",  "wrist",    "write",    "wrong",    "yard",     "year",
    "yellow",   "you",      "young",    "youth",    "zebra",    "zero",     "zone",     "zoo"
);

my @words;
my $howmanywords = 12;

print "Please choose the word list: \n";
print "1) Electrum 1.x\n";
print "2) BIP39 (without checksum!)\n";
print "   Please type 1 or 2 and press Enter: ";
my $word_list_number = <STDIN>;
$word_list_number =~ s/[^\d]//g;    # remove all non-digits

switch ($word_list_number) {
    case 1 { @words = @words_electrum_1; }
    case 2 {
        @words = @words_BIP39;

        print "Please enter how many random words should be chosen and press Enter.\n";
        $howmanywords = <STDIN>;
        $howmanywords =~ s/[^\d]//g;    # remove all non-digits

    }
    else { die "Invalid word list selected.\n" }
}

if ( $howmanywords < 1 ) {
    die "Invalid number of words selected.\n";
}

my $max_words = $#words;
my @seed;

# return number between 0 and 65535
# 0xFFFF = 65535
sub make_decimal_from_hex_hash($) {
    my $string = shift;

    my @string_parts = $string =~ /(.{1,4})/g;

    my $random;

    foreach (@string_parts) {
        $random = $random ^ hex $_;
    }

    return $random;
}

# the input should contain only numbers from 1 to 6
# not 0 to 5
sub dice_to_decimal($) {
    my $string = shift;
    my $m      = 0;
    my $dec    = 0;

    $string =~ s/[^\d]//g;    # remove all non-digits
    $string = reverse($string);

    foreach ( split //, $string ) {
        $dec += int( $_ - 1 ) * ( 6**$m );
        $m++;
    }

    return $dec;
}

sub get_random_number_between_zero_and_FFFF($$) {

    my $dice_input          = shift;
    my $random_string_input = shift;
    my $maxplusone          = 0xFFFF + 1;

    $random_string_input = join $random_string_input, makerandom( Size => 16, Strength => 1 );

    my $raw = dice_to_decimal($dice_input);

    print "    debug: raw=$raw (decimal number derived from dice)\n";

    my $limited = $raw % $maxplusone;    # between 0 and 0xFFFF

    print "    debug: limited=$limited (\$raw % \$maxplusone)\n";

    my $alg = "sha256";
    my $sha = Digest::SHA->new($alg);
    $sha->add($random_string_input);
    my $digest = $sha->hexdigest;

    my $from_hash = make_decimal_from_hex_hash($digest);

    print "    debug: from_hash=$from_hash\n";

    my $from_irand = irand($maxplusone);
    print "    debug: from_irand=$from_irand\n";

    return $from_hash ^ $limited ^ $from_irand;

}

# returns a random integer in the range [0, $n)
sub random_in_range($) {
    my $n        = shift;    # the new range - should be natural number smaller than $RAND_MAX
    my $RAND_MAX = 0xFFFF;

    print "Please enter the results from 7 dice rolls and press Enter: ";
    my $dice_rolls = <STDIN>;

    print "Please enter some random string and press Enter: ";

    my $some_random_data = <STDIN>;

    if ( $n <= 0 || $n > $RAND_MAX ) {
        return undef;
    }

    my $bucket_size_int = int( $RAND_MAX / $n );
    my $bucket_size = floor( $RAND_MAX / $n );

    print "    debug: bucket_size=$bucket_size\n";
    if ($bucket_size != $bucket_size_int) { print "    debug: bucket_size_int is different ($bucket_size_int)\n" }

    my $r;
    my $r_int;
    my $debug = 0;
    my $random_number_between_zero_and_FFFF;
    do {
        if    ( $debug != 0 ) { print "    debug: WARNING: algorithm did not like the number.\n" }
        elsif ( $debug > 20 ) { die "Fatal error: too many attempts - this was weird.\n" }
        $random_number_between_zero_and_FFFF = get_random_number_between_zero_and_FFFF( $dice_rolls, $some_random_data );
        $r_int = int( $random_number_between_zero_and_FFFF / $bucket_size );
        # int( $a / $b ) sometimes produces rounding errors. For example: int(-6.725/0.025)
        # Using POSIX::floor() is more reliable.
        $r = floor( $random_number_between_zero_and_FFFF / $bucket_size );
        print "    debug: r=$r n=$n counter=$debug\n";
        if ($r != $r_int) { print "    debug: r_int is different ($r_int)\n" }
        $debug++;
    } while ( $r >= $n );

    return $r;

}

for ( my $m = 0 ; $m < $howmanywords ; $m++ ) {

    push( @seed, $words[ random_in_range($max_words) ] );

}

print "\n==== $howmanywords random words from word list $word_list_number: ===\n\n";

foreach (@seed) {
    print "$_ ";
}

print "\n\n=======================================================================\n\n";


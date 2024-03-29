my $Brotherhood = quest::saylink("Brotherhood", 1);
my $Monks = quest::saylink("Monks", 1);
my $legacy = quest::saylink("legacy", 1);
my $interested = quest::saylink("interested", 1);
my $joining = quest::saylink("joining", 1);
my $Idol = quest::saylink("Idol", 1);
my $reward = quest::saylink("reward", 1);

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("In the name of the $Brotherhood of the Lost Circle I greet you.");
    }
    if($text=~/Brotherhood/i) {
        quest::say("The $Monks of the Whistling Fist are called the Lost Circle by others. We are an ancient league of monks. Long forgotten and few remaining. Within this realm there are only two. I and Brother Zephyl. We seeks the items stolen from us. I seek the Code of Zan Fi.");
    }
    if($text=~/Monks/i) {
        quest::say("The Monks of the Whistling fist were forged from the ways of the great master , Zan Fi. When the Combine Empire reigned supreme, a single bard grew to learn the ways of the monk. This bard was Zan Fi. The brotherhood was all but destroyed in the times that followed. Now only a few remain to carry on Zan Fi's $legacy.");
    }
    if($text=~/legacy/i) {
        quest::say("The tome called the Code of the Whistling Fist has been stolen from me. It contains many secrets pertaining to our brotherhood. Thankfully it is magically locked and only a Zan Fi master could unlock it. I quest for a monk to retrieve it. Would you be an $interested monk.");
    }
    if($text=~/interested/i) {
        quest::say("Then venture into the depths beyond the great Solusek Mining Company. There, living among the Kobolds, will be Targin the Rock. Get the book from him and return here and wait for my reappearance. When we meet again you shall hand me the book and a Purple Headband earned from the Silent Fist Clan. Do so and you shall be closer to $joining the brotherhood.");
    }
    if($text=~/joining/i) {
        quest::say("Brother Zephyl is searching for one who can return the $Idol of Zan Fi. I believe he is within the vicinity of the Rathe Mountains.");
    }
    if($text=~/Idol/i) {
        quest::say("The Idol of Zan Fi is a sacred totem to our brotherhood. I cannot share it's secrets, but I can tell you that Brother Zephyl will offer to you a $reward for it's return.");
    }
    if($text=~/reward/i) {
        quest::say("Then you will return that which was earned or the robe.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 12316 => 1, 10114 => 1)) {
        quest::say("We had an agreement. The proof of a skilled monk, the purple Headband, and the Code of the Whistling Fist.");
        quest::say("We thank you for the return of the Code of the Whistling Fist. Take this sewing needle. You shall find it useful should you aid Brother Zephyl in his quest. His item, the needle, a swatch of shadow silk and a scroll containing Jonathan's Whistling Warsong. Into a sewing kit they will be going. And into the brotherhood will you. I hope you do not wish me to return the headband..");
        quest::summonitem(12314);
        quest::ding();
        quest::exp("20000");
    }
    if(plugin::check_handin(\%itemcount, 12314 => 1)) {
        quest::summonitem(10114);
    }
    if(plugin::check_handin(\%itemcount, 12256 => 1)) {
        quest::summonitem(10114);
    }
}
#END of FILE Zone:southkarana  ID:436 -- Brother_Qwinn 


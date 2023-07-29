#BeginFile: warslikswood\Lurking_Hopeful.pl
#Quest for Warsliks Wood - Lurking Hopeful: Berserker Epic 1.0 (Trial of Mastery)
########################################
##         Edited By Aardil           ##
##            11-11-2013              ##
## Changed Mob ID from 79127 to 79131 ##
########################################

my $medal;

sub EVENT_SPAWN {
    $medal = 2;
}

sub EVENT_SAY {
    if(($text=~/hail/i) && ($ulevel > 45)) {
        if(defined($qglobals{raving}) && ($qglobals{raving} == 1)) {
            quest::say("So soon you ask too much of me!");
        }
        elsif($medal == 0) {
            quest::say("You want information? You prove yourself by giving me a Medal of Mastery! Oh worry you should not, I will give it back, with many more information.");
        }
        else {
            quest::say("Ah, me also got one of dose medal tings. Me guess you here for da same reason me is -- to finish da final berserker trial. Me been waiting for someone to come by here. Me need to figure out how to do dis challenge. Me tried once and didn't have a chance. Me ran. Dat goblin is mad. Hey, if you give me 1000 platinum, me save you some time and show you where da crazy goblin is. Me hate to ask for money, but me needs to hire help for dis.");
        }
    }
}

sub EVENT_ITEM {
    if(($ulevel > 45) && plugin::check_handin(\%itemcount, 60210 => 1)) {
        #Medal of Mastery 
        if(defined($qglobals{raving}) && ($qglobals{raving} == 1)) {
            quest::say("You must wait to attempt this again.");
            quest::summonitem(60210); #Medal of Mastery
        }
        else {
            quest::say("Ah, me also got one of dose medal tings. Me guess you here for da same reason me is -- to finish da final berserker trial. Me been waiting for someone to come by here. Me need to figure out how to do dis challenge. Me tried once and didn't have a chance. Me ran. Dat goblin is mad. Hey, if you give me 1000 platinum, me save you some time and show you where da crazy goblin is. Me hate to ask for money, but me needs to hire help for dis.");
            quest::summonitem(60210); #Medal of Mastery
            $medal = 1;
        }
    }
    if(($medal == 1) && ($platinum >= 1000)) {
        quest::say("Good timing. Me can hear him giggling. Go down to da stream's end where it opens into a big river between da cliffs. Crazy goblin is usually in dat area stirring up troubles. Go tell him dat you are a berserker and be ready. He go nuts. Good lucks. Me go find help.");
        quest::spawn2(79128,0,0,395.2,888.8,-212,185); #Raving_Goblinmaster - Quest
        quest::setglobal("raving",1,0,"H1");
        $medal = 2;
        quest::depop();
    }
    else {
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            $client->Message(14, "I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            $client->Message(14, "Thanks for the coin!");
        }
    }
}
#EndFile: warslikswood\Lurking_Hopeful.pl (79115) 


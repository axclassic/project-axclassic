    ############################################
    # ZONE: Paineel (paineel)
    # DATABASE: AX-Classic 3.10e
    # LAST EDIT DATE: April 10,2009
    # VERSION: 1.1
    # BASE QUEST BY: HELLIFIKNOW
    # DEVELOPER: ASRAM
    #
    # *** NPC INFORMATION ***
    #
    # NAME: Davorre_Bloodthorn.pl
    # ID: 75110
    # TYPE: GM Shadowknight
    # RACE: Erudite
    # LEVEL: 61
    #
    # *** ITEMS GIVEN OR TAKEN ***
    #
    # Rolled Up Note             - 12998
    # Rolled Up Note             - 14041
    # Veisha's Engagement Ring   - 12997
    # Veisha Fathomwalker's Head - 12994
    # Battle Worn Halberd        - 5526
    #
    # *** QUESTS INVOLVED IN ***
    #
    # Neonate Cowardice
    # Experienced Courier
    #
    # *** QUESTS AVAILABLE TO ***
    #
    # Shadowknights (All)
    #
    # *** NPC NOTES ***
    #
    #
    #
    ############################################

    ######## EVENT_SAY AREA ####################
    ### Called when the NPC is spoken to by a PC

    sub EVENT_SAY {
	my $neonate = quest::saylink("neonate", 1);
    my $experienced = quest::saylink("experienced", 1);
    my $cowardice = quest::saylink("cowardice", 1);
    my $assist = quest::saylink("assist", 1);
    if($text=~/Hail/i){
    quest::say("Greetings.  Perhaps within that husk you call a body there is some worth?  Are you $experienced in your craft, young one, or are you a $neonate?");
    }
    if($text=~/neonate/i){
    quest::say("Well then, child. I may still have a task for you.  Will you make use of your pathetic $cowardice, then, eh?");
    }

    if($text=~/cowardice/i){
    quest::say("I see.  This will not be the first time for you, I am sure.  Take this list to Auhrik Siet'ka.  His writing has become illegible in his old age, but he shall clarify what it is he needs you to do.  Do as he says, child, and perhaps you will prove yourself a bit more worthy than the rotting flesh he will most likely have you return to him.");
    quest::summonitem("14041"); #Rolled Up Note
    }

    if($text=~/experienced/i){
    quest::say("Ahhhh, a youth doth approach me with such confidence!  That is to be commended in and of itself.  Ordinarily, I would turn you away without a second glance, but perhaps you can be of some use.  Tell me, child, are you willing to $assist me in a small, yet important task?");
    }

    if($text=~/assist/i){
    quest::say("Good, child.  Deliver this note to Veisha Fathomwalker.  You shall find her patrolling the outer regions of Toxxulia Forest.  I trust that you will keep your eyes to yourself in this matter.  Now go, and please travel within the veil of night, so you will not be seen by those whose minds are still clouded with delusions of Erudin's grandeur.");
    quest::summonitem("12998"); # Rolled up Note
    }
    }

    ######## EVENT_ITEM AREA ###################
    ### Called when the NPC is handed items

    sub EVENT_ITEM {
      # Veisha's Engagement Ring   - 12997
      if (plugin::check_handin(\%itemcount, 12997 =>1 )) {
        quest::say("Only a few years have passed and her heart has already forgotten me. No doubt she has found another to warm her bed. Go, find her lover, and bring me nothing less than his head.");
        quest::givecash("8","2","14","5"); # Cash
        quest::faction("56","-25");        # Craftkeepers
        quest::faction("60","-25");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-25");        # Deepwater Knights
        quest::faction("112","-25");       # Gate Callers 
      }
        # Veisha Fathomwalker's Head   - 12994
      if (plugin::check_handin(\%itemcount, 12994 =>1 )) {
        quest::say("My revenge has been satisfied. Thank you, my child. You have proven yourself to be a most worthy asset to our cause. Here, I no longer have any use for this. My ties to the old life are now severed.");
         quest::ding(); quest::exp(100000);                 # Experience
        quest::summonitem("5526");          # Battle Worn Halberd
        quest::faction("56","-25");        # Craftkeepers
        quest::faction("60","-25");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-25");        # Deepwater Knights
        quest::faction("112","-25");       # Gate Callers 
      }
     
    }
    #END of FILE Zone:paineel  ID:75110 -- Davorre_Bloodthorn.pl





##Bronin Higginsbot, Misty Thicket, Avenger Battle Axe quest
##Quest by Aeolwind
    sub EVENT_SAY
    {
       if($text=~/Hail/i)
       {
          quest::say("Hello.  It is dangerous out in the woods.  You should go to Rivervale.  It's at the end of the path.  You will find good times there.  Travel safely, my friend!");
       }
       if($text=~/emerald shard/i)
       {
          quest::say("Searching for that blasted emerald shard, are you?  That thing has done nothing but bring me bad luck!!  I would gladly give it to you if you would do a [small favor] for me.");
       }
       if($text=~/small favor/i)
       {
          if ($faction =>4)
          {
             quest::say("I have been tracked here by a bounty hunter named Slaythe.  I have heard reports of his presence beyond the Great Wall.  Please seek him out and bring me some board part of his as proof of his passing.  Do this and the emerald shard is yours.");
             quest::spawn2(33146,0,0,77.7,1026.9,13.5,129.3);
          }
          elsif ($faction < 4){
             quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!!");
          }
       }
    }

    sub EVENT_ITEM
    {
    # Check for A Froglok Leg ID:12192
      if(plugin::check_handin(\%itemcount, 12192 => 1))
      {
       if($faction => 4){
                quest::say("Take this wretched shard and leave, it's been nothing but trouble.  The Deeppockets are thankful for your assistance, however.");
       quest::faction(77, 3); #deeppockets
       quest::faction(218, 3); #merchants of rivervale
       quest::faction(31, -2); #Carson McCabe
       quest::faction(33, -2); #Circle of Unseen Hands
       quest::faction(48, -2); #Coalition of Tradefolk Underground
                 quest::ding(); quest::exp(2000);
       quest::givecash(5,4,3,0);
                quest::summonitem(13323);#Give Emerald Shard II ID:13323
       }
       elsif ($faction < 4){
          quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!!");
        }
      }
      plugin::return_items(\%itemcount);
    }


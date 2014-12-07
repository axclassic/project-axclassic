#Xeib Darkskies ID 27121#
sub EVENT_SAY {
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("So you've finally returned. Let's see what you've brought me."); 
   }
   }
sub EVENT_ITEM {
if ($ulevel == 41 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 81904 => 1)) { 
   quest::say("A scrap of cloth, that's all! Let me look at it, maybe you're not completely waisting my time. Well, it's old. I haven't seen anything like this since I did some adventuring in Kunark. This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that. Not worth anything at all these days. Looks like it's the color of royal robes or something. Ok, this is interesting enough, you've earned your reward. Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   }
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);  
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);  
  }
  elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 81909 => 1)) {
   quest::say("What! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't help us at all, but you tried your best. We'll will keep looking, just in case.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);  
  }
      else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }  
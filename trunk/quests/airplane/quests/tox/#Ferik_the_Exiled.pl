#NPC: #Ferik_the_Exiled    Zone: Tox
#by Qadar

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Who are you?  Were you sent to [spy] on me?");
  }
  if($text=~/spy/i){
    quest::say("Tesha has been sending spies who do nothing but follow me, watching my every move.  Is it not bad enough I was [unfairly exiled]?  But now I have to endure this harassment!");
  }
  if($text=~/unfairly exiled/i){
    quest::say("I was accused of necromancy!  Can you believe that!  What proof do they have!  Tesha was jealous, I was far more intelligent than any of the Kerrans, so she made up lies and falses accusations!  If only someone would [help] restore my good name!");
  }
  if($text=~/help/i){
    quest::say("There is only one way to help me.  I need the missing pages of my [journal], they were torn from my book by Erfer Longclaw and stolen from me in a struggle before I was exiled.  If I could get them, my journal would be complete and I am sure I could convince the elders of my innocence!");
  }
  if($text=~/journal/i){
    quest::say("Erfer Longclaw can usually be found in Kerra Isle near the water.  Ask him about the [journal].  I know he has the missing pages, he was gloating about it when I was fleeing from the city.  Please get them!");
  }
}

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 600 => 1)){          #if Ferik's Journal Pages are given
    quest::settimer(1,5);
    quest::emote("opens the journal and adds the missing pages to the book.  A chill runs down your spine as he begins to cast a spell in an evil language unlike any you have ever heard.  'Fool!  This journal allows me to complete my work!  This is what I need to build my undead army!  I will destroy all those who worked against me!' ");
  }else{
    plugin::return_items(\%itemcount);
    quest::say("How is this supposed to help me?");
  }
}

sub EVENT_SPAWN{
  quest::depopall(38205);                                   #Despawn Ferik Soulstealer and Ferik's Minions if they are still around
  quest::depopall(38204);
}

sub EVENT_DEATH{
  quest::say("I cannot be defeated, I will rise again!");
}

sub EVENT_TIMER{                                            #Depop Ferik the exiled, and spawn Ferik Soulstealer
  quest::emote("laughs as his skin burns away.");
  quest::spawn2(38205,0,0,$npc->GetX(),$npc->GetY,$npc->GetZ(),152.5);
  quest::depop();
  quest::stoptimer(1);
}

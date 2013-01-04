#!/usr/bin/perl

sub EVENT_SAY {
  my $bind = quest::saylink("bind", 1);
  my $sense = quest::saylink("sense", 1);
    if($text=~/hail/i){
      $client->Message(14,"Greetings $name . When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity it is my duty to $bind your soul to this location, or $sense the ties to your soul, thus sending you back to the city you once started in, if that is your wish.");
    }
    elsif($text=~/bind/i) {
      $client->Message(14,"Binding your soul. You will return
here when you die.");
      quest::selfcast(2049);
    }
    elsif($text=~/sense/i) {
      my $origin = quest::saylink("origin", 1);
      $client->Message(14,"Not only can I bind your soul, but I can return you to your bind of $origin .");
    }
    elsif($text=~/origin/i) {
      $client->Message(14,"Returning you to your home!");
      quest::selfcast(5824);
    }
}
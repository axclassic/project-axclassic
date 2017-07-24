##Crystal_Shard 211198##
sub EVENT_NPC_SLAY {
my $meatbag = $entity_list->GetMobID($userid);
      if($meatbag->IsBot()) {
	  $meatbag->Message(5,"$name tells you $mname just killed me! I hate $zoneln");
	  quest::signalwith(211200,200,1);
	  }
    }
sub EVENT_DEATH {
quest::signalwith(211182,211,0);
}
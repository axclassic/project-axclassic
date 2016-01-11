sub EVENT_SPAWN{
    my $random_result = int(rand(6));
    if($random_result==1){
quest::spawn2(166597,0,0,3045.4,1303.9,112,190.5);
quest::signalwith(166597,1001,100);
quest::spawn2(166407,0,0,3046.8,1134.4,109.2,190.3); #Wolf_attack_Owlbear_fail_Counter
quest::signalwith(166407,2120,0);
quest::spawn2(166315,0,0,3047.3,1145.7,112,210); #Wolves attack Owls counter
quest::spawn2(166405,0,0,1303.8,2131.1,280.9,197.5);
quest::depop();
}
    if($random_result==2){
quest::spawn2(166597,0,0,3045.4,1303.9,112,190.5);
quest::signalwith(166597,1002,100);
quest::spawn2(166576,0,0,3046.8,1134.4,109.2,190.3); #Grimling_attack_Owlbear_fail_Counter
quest::signalwith(166576,3120,0);
quest::spawn2(166316,0,0,3047.3,1145.7,112,210); #Grimlings attack Owls counter
quest::spawn2(166405,0,0,1303.8,2131.1,280.9,197.5);
quest::depop();
}
    if($random_result==3){
quest::spawn2(166597,0,0,3045.4,1303.9,112,190.5);
quest::signalwith(166597,1004,100);
quest::spawn2(166722,0,0,3046.8,1134.4,109.2,190.3); #Grimlings_attack_Wolves_fail_Counter
quest::signalwith(166722,5120,0);
quest::spawn2(166721,0,0,3047.3,1145.7,112,210); #Grimlings_attack_Wolves_Counter
quest::spawn2(166663,0,0,-2857.1,553.3,167,56.1);
quest::depop();
}
   if($random_result==4){
quest::spawn2(166597,0,0,3045.4,1303.9,112,190.5);
quest::signalwith(166597,1003,100);
quest::spawn2(166662,0,0,3046.8,1134.4,109.2,190.3); #Owls_attack_Wolves_fail_Counter
quest::signalwith(166662,4120,0);
quest::spawn2(166661,0,0,3047.3,1145.7,112,210); #Owls_attack_Wolves_Counter
quest::spawn2(166663,0,0,-2857.1,553.3,167,56.1);
quest::depop();
}
   if($random_result==5){
quest::spawn2(166597,0,0,3045.4,1303.9,112,190.5);
quest::signalwith(166597,1005,100);
quest::spawn2(166823,0,0,3046.8,1134.4,109.2,190.3); #Owlbears_attack_Grimlings_fail_Counter
quest::signalwith(166823,6120,0);
quest::spawn2(166822,0,0,3047.3,1145.7,112,210); #Owlbears_attack_Grimlings_Counter
quest::spawn2(166821,0,0,-637,-2944.4,174.1,249.1);
quest::depop();
}
    if($random_result==6){
quest::spawn2(166597,0,0,3045.4,1303.9,112,190.5);
quest::signalwith(166597,1006,100);
quest::spawn2(166825,0,0,3046.8,1134.4,109.2,190.3); #Wolves_attack_Grimlings_fail_Counter
quest::signalwith(166825,7120,0);
quest::spawn2(166824,0,0,3047.3,1145.7,112,210); #Wolves_attack_Grimlings_Counter
quest::spawn2(166821,0,0,-637,-2944.4,174.1,249.1);
quest::depop();
}
}


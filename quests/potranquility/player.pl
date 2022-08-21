# Plane of Tranquility Door Flags

sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    $client->Message(14, "Door Clicked doorid = $doorid");
    $client->Message(14, "Door Clicked d_id = $d_id");
    #timea
    if($doorid == 18 || $d_id == 18) {
        if(defined $qglobals{pop_time_maelin}) {
            if(!$client->HasZoneFlag(219)) {
                $client->SetZoneFlag(219);
            }
        }

        ##
        ## Instance Code
        ##
        ## Every player or group gets their own private zone.
        ## It can be re-entered if you die up to 3 hours.
        ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
        ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
        ## 
        my @clients;
        my $the_group = $client->GetGroup();
        if($the_group) {
            my $nMembers = $the_group->GroupCount();
            for($i=0; $i<$nMembers; $i++) {
                my $member = $the_group->GetMember($i);
                if($the_group->IsClient($member)) {
                    push(@clients, $member);
                }
            }
        }
        my $QGlobalValue2 = $client->GetQGlobal(${name}."potimeA");
        if($QGlobalValue2) {
            quest::MoveGroupInstance(219, $QGlobalValue2, 219, 1, 6, 8);
            return;
        }
        else {
            my $instance_ID = quest::CreateInstance('potimeA', 2, 25200);
            my $arraySize = @clients;
            if($arraySize > 1) {
                quest::AssignGroupToInstance($instance_ID);
                quest::setgroupglobal("potimeA", $instance_ID, 7, "H7");
            }
            else {
                quest::AssignToInstance($instance_ID);
                quest::setglobal(${name}."potimeA", $instance_ID, 7, "H7");
            }
        }
        ##
        ## End Instance Code
        ##
    }

    #valor/storms
    if($doorid == 16 || $doorid == 21) {
        if((defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms})) {
            if(!$client->HasZoneFlag(210) || !$client->HasZoneFlag(208)) {
                $client->SetZoneFlag(210);
                $client->SetZoneFlag(208);
            }
        }
    }

    #codecay
	if(($doorid == 12) || ($d_id == 12)) {
		if((defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel})) {
			if(!$client->HasZoneFlag(200)) {
				$client->SetZoneFlag(200);
			}
		}
	}

    #torment
	if(($doorid == 93) || ($d_id == 93)) {
		if((defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} &&  defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final})) {
			if(!$client->HasZoneFlag(207)) {
				$client->SetZoneFlag(207);
			}
		}
	}

    #bothunder
	if($doorid == 48) {
		if((defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && (defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3) && defined $qglobals{pop_pos_askr_the_lost_final})) {
			if(!$client->HasZoneFlag(209)) {
				$client->SetZoneFlag(209);
			}
		}
	}

    #hohonora
	if($doorid == 23) {
		if((defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar})) {
			if(!$client->HasZoneFlag(211)) {
				$client->SetZoneFlag(211);
			}
		}
	}

    #potactics
	if($doorid == 24) {
		if((defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag})) {
			if(!$client->HasZoneFlag(214)) {
				$client->SetZoneFlag(214);
			}
		}
	}

    #solrotower
	if($doorid == 22) {
		if((defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag} && defined $qglobals{pop_tactics_tallon} && defined $qglobals{pop_tactics_vallon} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_hohb_marr})) {
			if(!$client->HasZoneFlag(212)) {
				$client->SetZoneFlag(212);
			}
		}
	}

    #pofire
	if($doorid == 82) {
		if((defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag} && defined $qglobals{pop_tactics_tallon} && defined $qglobals{pop_tactics_vallon} && defined $qglobals{pop_tactics_ralloz} && defined $qglobals{pop_sol_ro_arlyxir} && defined $qglobals{pop_sol_ro_jiva} && defined $qglobals{pop_sol_ro_rizlona} &&  defined $qglobals{pop_sol_ro_dresolik} && defined $qglobals{pop_sol_ro_xuzl} && defined $qglobals{pop_sol_ro_solusk} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_hohb_marr})) {
			if(!$client->HasZoneFlag(217)) {
				$client->SetZoneFlag(217);
			}
		}
	}

    #powater/poearth/poair
	if(($doorid == 81 || $doorid == 83 || $doorid == 84) || ($d_id == 81 || $d_id == 83 || $d_id == 84)){
		if((defined $qglobals{pop_hohb_marr} && defined $qglobals{pop_bot_agnarr} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar} && defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 && defined $qglobals{pop_pos_askr_the_lost_final} && defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final} &&  defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_hoh_faye} && defined $qglobals{pop_hoh_trell} && defined $qglobals{pop_hoh_garn} && defined $qglobals{pop_elemental_grand_librarian})) {
			if(!$client->HasZoneFlag(216) || !$client->HasZoneFlag(215) || !$client->HasZoneFlag(218)) {
				$client->SetZoneFlag(216);
				$client->SetZoneFlag(215);
				$client->SetZoneFlag(218);
			}
		}
	}

	$qglobals{pop_pon_hedge_jezith}=undef;
	$qglobals{pop_pon_construct}=undef;
	$qglobals{pop_ponb_terris}=undef;
	$qglobals{pop_ponb_poxbourne}=undef;
	$qglobals{pop_poi_dragon}=undef;
	$qglobals{pop_poi_behometh_preflag}=undef;
	$qglobals{pop_poi_behometh_flag}=undef;
	$qglobals{pop_pod_alder_fuirstel}=undef;
	$qglobals{pop_pod_grimmus_planar_projection}=undef;
	$qglobals{pop_pod_elder_fuirstel}=undef;
	$qglobals{pop_poj_mavuin}=undef;
	$qglobals{pop_poj_tribunal}=undef;
	$qglobals{pop_poj_valor_storms}=undef;
	$qglobals{pop_poj_execution}=undef;
	$qglobals{pop_poj_flame}=undef;
	$qglobals{pop_poj_hanging}=undef;
	$qglobals{pop_poj_lashing}=undef;
	$qglobals{pop_poj_stoning}=undef;
	$qglobals{pop_poj_torture}=undef;
	$qglobals{pop_pov_aerin_dar}=undef;
	$qglobals{pop_pos_askr_the_lost}=undef;
	$qglobals{pop_pos_askr_the_lost_final}=undef;
	$qglobals{pop_cod_preflag}=undef;
	$qglobals{pop_cod_bertox}=undef;
	$qglobals{pop_cod_final}=undef;
	$qglobals{pop_pot_shadyglade}=undef;
	$qglobals{pop_pot_newleaf}=undef;
	$qglobals{pop_pot_saryrn}=undef;
	$qglobals{pop_pot_saryrn_final}=undef;
	$qglobals{pop_hoh_faye}=undef;
	$qglobals{pop_hoh_trell}=undef;
	$qglobals{pop_hoh_garn}=undef;
	$qglobals{pop_hohb_marr}=undef;
	$qglobals{pop_bot_agnarr}=undef;
	$qglobals{pop_bot_karana}=undef;
	$qglobals{pop_tactics_tallon}=undef;
	$qglobals{pop_tactics_vallon}=undef;
	$qglobals{pop_tactics_ralloz}=undef;
	$qglobals{pop_elemental_grand_librarian}=undef;
	$qglobals{pop_sol_ro_arlyxir}=undef;
	$qglobals{pop_sol_ro_dresolik}=undef;
	$qglobals{pop_sol_ro_jiva}=undef;
	$qglobals{pop_sol_ro_rizlona}=undef;
	$qglobals{pop_sol_ro_xuzl}=undef;
	$qglobals{pop_sol_ro_solusk}=undef;
	$qglobals{pop_fire_fennin_projection}=undef;
	$qglobals{pop_wind_xegony_projection}=undef;
	$qglobals{pop_water_coirnav_projection}=undef;
	$qglobals{pop_eartha_arbitor_projection}=undef;
	$qglobals{pop_earthb_rathe}=undef;
	$qglobals{pop_time_maelin}=undef;
}

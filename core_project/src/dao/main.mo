/*
<div id="proposals">
      <p style="color: white">a proposal: {proposals}</p>
    </div>
*/

import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
actor {
    //My discord is: iri#1598
    //Feel free to DM me any question.
    type v_pair = {yes: Nat; no: Nat};
    type Proposal = { prop_text : Text; votes : v_pair };// TO DEFINE;
    stable var proposal_list : [Proposal] = [];

    public shared({caller}) func submit_proposal(this_payload : Text) : async {#Ok : Text; #Err : Text} {
        var mybuffer  = Buffer.fromArray<Proposal>(proposal_list); 
        var new_prop : Proposal = { prop_text = this_payload; votes = {yes = 0; no = 0}} ;
        mybuffer.add(new_prop);
        proposal_list := mybuffer.toArray();
        return #Ok(new_prop.prop_text);
    };

    public shared({caller}) func vote(proposal_id : Nat, yes_or_no : Bool) : async {#Ok : (Nat, Nat); #Err : Text} {
        var mybuffer  = Buffer.fromArray<Proposal>(proposal_list);
        var votesyes = 0;
        var votesno = 0;
        if(mybuffer.size() < proposal_id + 1)
            return(#Err("No such proposal ID!"));

        if(yes_or_no)
        {
            votesyes := proposal_list[proposal_id].votes.yes + 1;
            votesno := proposal_list[proposal_id].votes.no;
        }
        else
        {
            votesyes := proposal_list[proposal_id].votes.yes;
            votesno := proposal_list[proposal_id].votes.no + 1;
        };
        mybuffer.put(proposal_id,{prop_text = proposal_list[proposal_id].prop_text; votes = {yes = votesyes; no = votesno}});
        proposal_list := mybuffer.toArray();
        return #Ok((votesyes,votesno));
    };

    public query func get_proposal(id : Nat) : async {#Ok : Proposal; #Err : Text} {
        var mybuffer  = Buffer.fromArray<Proposal>(proposal_list);
        if(mybuffer.size() < id+1)
            return(#Err("No such proposal ID!"));
        return #Ok(proposal_list[id]);
        //return null
    };
    
    public query func get_all_proposals() : async [(Int, Proposal)] { //async [(Int, Proposal)] {
        var d : Int = 0;
        //var new_prop : Proposal = { prop_text = "test1"} ;
        var buff = Buffer.Buffer<(Int, Proposal)>(0);
        var buff0 = Buffer.fromArray<Proposal>(proposal_list);

        for(elements in Iter.fromArray(proposal_list))
        {
            buff.add((d,elements));
            d := d+1;
        };
        return buff.toArray();
        //return [(d, new_prop)];
    };
};
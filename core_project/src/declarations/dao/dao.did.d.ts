import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface Proposal { 'votes' : v_pair, 'prop_text' : string }
export interface v_pair { 'no' : bigint, 'yes' : bigint }
export interface _SERVICE {
  'get_all_proposals' : ActorMethod<[], Array<[bigint, Proposal]>>,
  'get_proposal' : ActorMethod<
    [bigint],
    { 'Ok' : Proposal } |
      { 'Err' : string }
  >,
  'submit_proposal' : ActorMethod<
    [string],
    { 'Ok' : string } |
      { 'Err' : string }
  >,
  'vote' : ActorMethod<
    [bigint, boolean],
    { 'Ok' : [bigint, bigint] } |
      { 'Err' : string }
  >,
}

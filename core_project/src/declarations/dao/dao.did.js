export const idlFactory = ({ IDL }) => {
  const v_pair = IDL.Record({ 'no' : IDL.Nat, 'yes' : IDL.Nat });
  const Proposal = IDL.Record({ 'votes' : v_pair, 'prop_text' : IDL.Text });
  return IDL.Service({
    'get_all_proposals' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Int, Proposal))],
        ['query'],
      ),
    'get_proposal' : IDL.Func(
        [IDL.Nat],
        [IDL.Variant({ 'Ok' : Proposal, 'Err' : IDL.Text })],
        ['query'],
      ),
    'submit_proposal' : IDL.Func(
        [IDL.Text],
        [IDL.Variant({ 'Ok' : IDL.Text, 'Err' : IDL.Text })],
        [],
      ),
    'vote' : IDL.Func(
        [IDL.Nat, IDL.Bool],
        [IDL.Variant({ 'Ok' : IDL.Tuple(IDL.Nat, IDL.Nat), 'Err' : IDL.Text })],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };

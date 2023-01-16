actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };

  public multiply(n : Nat, m : Nat) -> async Nat {
  };

}
